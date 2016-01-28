/* definitions */
#ifdef _WIN32
#define EXPORT extern "C" __declspec(dllexport)
#else
#define EXPORT extern "C"
#endif /* _WIN32 */

#include <stdio.h>
#include <stdlib.h>
#include <iostream>
#include <fstream>
#include <vector>

#include "MMDAgent.h"

using namespace std;

static bool enable;

static ofstream fo;
static ifstream fi;

// COMMAND & EVENT
#define PLUGIN_NAME  "guide"
#define MAP_ADD "MAP_ADD"
#define GUIDE_START "GUIDE_START"
#define GUIDE_STOP  "GUIDE_STOP"
#define GUIDE_EVENT_GOAL "GUIDE_EVENT_GOAL"

#define map_model   "map"
#define guide_model "mini_hino"
#define point_model "point"
#define word_model  "word"
#define arrow_model "arrow"

static double mx, my, mz; // map position
static int rx, ry; // rotate value
static int d; // distance
static bool exist_map;
static char distination[256];

static ofstream ofs;

EXPORT void extAppStart(MMDAgent *mmdagent)
{
	enable = true;
	exist_map = false;

	// check用ファイルのオープン
	ofs.open("guide_check.txt");
	
	mmdagent->sendMessage(MMDAGENT_EVENT_PLUGINENABLE, "%s", PLUGIN_NAME);
}

EXPORT void extProcMessage(MMDAgent *mmdagent, const char *type, const char *args)
{
	if (enable == true) {
		if (MMDAgent_strequal(type, MAP_ADD)) {
			char args_buff[256], *buff;
			ofs << "check1" << endl;
			strcpy(args_buff, args);
			ofs << "check2" << endl;
			mx = atoi(MMDAgent_strtok(args_buff, ",", &buff));
			my = atoi(MMDAgent_strtok(NULL, ",", &buff));
			mz = atoi(MMDAgent_strtok(NULL, "|", &buff));
			ofs << "mx : " << mx << endl;
			ofs << "my : " << my << endl;
			ofs << "mz : " << mz << endl;
			mmdagent->sendMessage("MODEL_ADD", "map_model|GUIDE\\MODEL\\%s\\%s.pmd|%.2f,%.2f,%.2f|40,0,0", map_model, map_model, mx,my,mz);
			mmdagent->sendMessage("MODEL_ADD", "word_model|GUIDE\\MODEL\\%s\\%s.pmd|0,0,0|0,0,0|ON|map_model",  word_model,  word_model);
			rx = 0;
			ry = 0;
			d = 120;
			// mmdagent->sendMessage("CAMERA", "%.2f,%.2f,%.2f|%d,%d,0|%d|20|0", mx, my, mz, rx + 40, ry, d);
			exist_map = true;
		}
		else if(MMDAgent_strequal(type, GUIDE_START) && exist_map) {
			strcpy(distination, args);
			mmdagent->sendMessage("MODEL_ADD", "guide_model|GUIDE\\MODEL\\%s\\%s.pmd|0,0,0|0,0,0|ON|map_model", guide_model, guide_model);
			mmdagent->sendMessage("MODEL_ADD", "point_model|GUIDE\\MODEL\\%s\\%s.pmd|0,0,0|0,0,0|ON|map_model", point_model, point_model);
			mmdagent->sendMessage("MODEL_ADD", "arrow_model|GUIDE\\MODEL\\%s\\%s.pmd|0,0,0|0,0,0|ON|map_model", arrow_model, arrow_model);
			mmdagent->sendMessage("MOTION_ADD", "guide_model|guide_motion|GUIDE\\MOTION\\%s\\%s.vmd", guide_model, distination);
			mmdagent->sendMessage("MOTION_ADD", "point_model|point_motion|GUIDE\\MOTION\\%s\\%s.vmd|FULL|LOOP", point_model, distination);
			mmdagent->sendMessage("MOTION_ADD", "arrow_model|arrow_motion|GUIDE\\MOTION\\%s\\%s.vmd|FULL|LOOP", arrow_model, distination);
			ofs << distination << endl;
		}
		else if(MMDAgent_strequal(type, GUIDE_STOP) && exist_map) {
			mmdagent->sendMessage("MODEL_DELETE", "map_model");
			// mmdagent->sendMessage("CAMERA", "0.0,13.0,0.0|0.0,0.0,0.0|100|16|0");
		}

		else if(MMDAgent_strequal(type, "MOTION_EVENT_DELETE") && exist_map) {
			ofs << args << endl;
			if (MMDAgent_strequal(args, "guide_model|guide_motion")) {
				mmdagent->sendMessage("MODEL_DELETE", "guide_model");
				mmdagent->sendMessage("MODEL_DELETE", "point_model");
				mmdagent->sendMessage("MODEL_DELETE", "arrow_model");
				mmdagent->sendMessage("GUIDE_EVENT_GOAL", "%s", distination);
				ofs << "distination : " << distination << endl;
			}
		} // "CAMERA_INPUT"
		else if(MMDAgent_strequal(type, "CAMERA_INPUT")) {
			if (MMDAgent_strequal(args, "down")) {
				rx = (rx > 0) ? rx - 1 : rx;
				mmdagent->sendMessage("ROTATE_START", "map_model|%d,%d,0|GLOBAL|10", rx, ry);
			}
			if (MMDAgent_strequal(args, "up")) {
				rx = (rx <  50) ? rx + 1 : rx;
				mmdagent->sendMessage("ROTATE_START", "map_model|%d,%d,0|GLOBAL|10", rx, ry);
			}
			if(MMDAgent_strequal(args, "right")) {
				ry = (ry > -90) ? ry - 1 : ry;
				mmdagent->sendMessage("ROTATE_START", "map_model|%d,%d,0|GLOBAL|10", rx, ry);
			}
			if(MMDAgent_strequal(args, "left")) {
				ry = (ry <  90) ? ry + 1 : ry;
				mmdagent->sendMessage("ROTATE_START", "map_model|%d,%d,0|GLOBAL|10", rx, ry);
			}
		}
		else if(!MMDAgent_strequal(type, "CAMERA_EVENT_HANDPOINT")) {
			ofs << type << "|" << args << endl;
		}
	}
}

EXPORT void extAppEnd(MMDAgent *mmdagent)
{

}

/* execUpdate: run when motion is updated */
EXPORT void extUpdate(MMDAgent *mmdagent, double deltaFrame) {

}

/* execRender: run when scene is rendered */
EXPORT void extRender(MMDAgent *mmdagent) {

}