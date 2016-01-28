/* definitions */
#ifdef _WIN32
#define EXPORT extern "C" __declspec(dllexport)
#else
#define EXPORT extern "C"
#endif /* _WIN32 */

#include <opencv2/core/core.hpp>
#include <opencv2/highgui/highgui.hpp>

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
#define PLUGINQUESTION_NAME  "Question"
#define PLUGINQUESTION_ASK   "Q_ASK"
#define PLUGINQUESTION_COUNT "Q_COUNT"
#define PLUGINQUESTION_EVENT_COUNT "Q_EVENT_COUNT"

#define Question_MAX_num 10
#define Question_MAX_str 1024

#define CV_RGB( r, g, b ) cv::Scalar( b, g, r )

class question{
public:
	// Question
	char question_name[Question_MAX_str];
	char question_word[Question_MAX_str];

	// Answer
	int  ans_num;
	char ans_name[10][Question_MAX_str];
	int  ans_value[10];
};

question get_question(const char *str);

static vector<question> list;

EXPORT void extAppStart(MMDAgent *mmdagent)
{
	enable = true;

	fi.open("question_list.txt");
	fo.open("question_list_out.txt");
	
	int i = 0;

	while (!fi.eof()) {
		char str[Question_MAX_str];
		char *buff;
		question buff_list;

		// テキストファイルから1行ずつ取得
		fi.getline(str, Question_MAX_str - 1);

		if (str[0] == NULL) continue;

		// Question部分のデータ
		strcpy(buff_list.question_name, MMDAgent_strtok(str, "|", &buff));
		strcpy(buff_list.question_word, MMDAgent_strtok(NULL, "|", &buff));

		// Answer部分のデータ
		buff_list.ans_num       =	atoi(MMDAgent_strtok(NULL, "|", &buff));
		for (int j = 0; j < buff_list.ans_num; j++) {
			strcpy(buff_list.ans_name[j], MMDAgent_strtok(NULL, ",", &buff));
			buff_list.ans_value[j] = atoi(MMDAgent_strtok(NULL, "|", &buff));
		}

		// 配列listに登録
		list.push_back(buff_list);
	}

	// 配列が格納できているかテスト出力
	for (vector<question>::iterator it = list.begin(); it != list.end(); it++) {
		fo << it->question_name << endl;
		fo << it->question_word << endl;
		fo << it->ans_num << endl;
		for (i = 0; i < it->ans_num; i++) {
			fo << i << " : " << it->ans_name[i] << " , " << it->ans_value[i] << endl;
		}
		fo << "\n" << endl;
	}

	mmdagent->sendMessage(MMDAGENT_EVENT_PLUGINENABLE, "%s", PLUGINQUESTION_NAME);
}

EXPORT void extProcMessage(MMDAgent *mmdagent, const char *type, const char *args)
{
	if (enable == true) {

		// question_wordに格納された言葉をメイちゃんがしゃべる
		if (MMDAgent_strequal(type, PLUGINQUESTION_ASK)) {
			mmdagent->sendMessage("SYNTH_START", "mei|mei_voice_normal|%s", get_question(args).question_word);
		}
		// 回答を受け付ける
		else if (MMDAgent_strequal(type, PLUGINQUESTION_COUNT)) {
			char str[Question_MAX_str];
			char *buff;
			
			cv::Mat img(cv::Size(400, 250), CV_8UC3, cv::Scalar::all(255));
			int color[10][3];
			color[0][0] = 255; color[0][1] = 0;   color[0][2] = 0;
			color[1][0] = 0;   color[1][1] = 255; color[1][2] = 0;
			color[2][0] = 0;   color[2][1] = 0;   color[2][2] = 255;
			color[3][0] = 255; color[3][1] = 255; color[3][2] = 0;
			color[4][0] = 0;   color[4][1] = 255; color[4][2] = 255;
			color[5][0] = 255; color[5][1] = 0;   color[5][2] = 255;
			color[6][0] = 255; color[6][1] = 150; color[6][2] = 0;
			color[7][0] = 0;   color[7][1] = 255; color[7][2] = 150;
			color[8][0] = 150; color[8][1] = 0;   color[8][2] = 255;
			color[9][0] = 128; color[9][1] = 128; color[9][2] = 128;

			strcpy(str, args);
			strcpy(str, MMDAgent_strtok(str, "|", &buff));

			for (vector<question>::iterator it = list.begin(); it != list.end(); it++) {
				if (MMDAgent_strequal(str, it->question_name)) {
					strcpy(str, MMDAgent_strtok(NULL, "\0", &buff));
					for (int i = 0; i < it->ans_num; i++) {
						if (MMDAgent_strequal(str, it->ans_name[i])) {
							it->ans_value[i] ++;
							mmdagent->sendMessage(PLUGINQUESTION_EVENT_COUNT, "%s|%s", it->question_name, it->ans_name[i]);
							
							double sum = 0;
							for(int j = 0; j < it->ans_num; j++){
								sum += it->ans_value[j];
							}
							double angle = 0;
							double angleend = angle;
							cv::putText(img, it->question_name, cv::Point(20,20), cv::FONT_HERSHEY_DUPLEX, 0.5, cv::Scalar::all(0), 1, CV_AA);
							for(int j = 0; j < it->ans_num; j++){
								angleend += 360*it->ans_value[j]/sum;
								//画像, 中心座標, (長径・短径), 回転角度, 円弧開始角度, 円弧終了角度, 色, 線太さ, 連結, Red, 塗りつぶし, アンチエイリアス
								cv::ellipse(img, cv::Point(100, 125), cv::Size(90, 90), -90, angle, angleend, CV_RGB( color[j][0], color[j][1], color[j][2] ), -1, CV_AA);
								angle = angleend;
								cv::rectangle(img, cv::Point(220, 10+j*20), cv::Point(230, 20+j*20), CV_RGB( color[j][0], color[j][1], color[j][2] ), -1, CV_AA);
								
								std::stringstream ss;
								ss << it->ans_value[j];
								std::string str = ":" +ss.str(); 
								// 画像，テキスト，位置（左下），フォント，スケール，色，線太さ，種類
								cv::putText(img, it->ans_name[j] + str, cv::Point(240,20+j*20), cv::FONT_HERSHEY_DUPLEX, 0.5, cv::Scalar::all(0), 1, CV_AA);
							}
							//cv::namedWindow("drawing", CV_WINDOW_AUTOSIZE|CV_WINDOW_FREERATIO);
							//cv::imshow("drawing", img);
							cv::imwrite("Image/survey/画像.png", img);
						}
					}
				}
			}	
		}
	}
}

EXPORT void extAppEnd(MMDAgent *mmdagent)
{
	// 一旦、入出力両方のファイルを閉じる
	fi.close( );
	fo.close( );

	// 更新するために入力で使ったテキストファイルを出力用で開く
	fo.open("question_list.txt");
	
	// listの中身をすべてテキストファイルに書き出す
	for (vector<question>::iterator it = list.begin(); it != list.end(); it++) {
		fo << it->question_name << "|" << it->question_word << "|" << it->ans_num;
		for (int i = 0; i < it->ans_num; i++) {
			fo << "|" << it->ans_name[i] << "," << it->ans_value[i];
		}
		fo << endl;
	}

	cv::destroyAllWindows();
}

/* execUpdate: run when motion is updated */
EXPORT void extUpdate(MMDAgent *mmdagent, double deltaFrame) {

}

/* execRender: run when scene is rendered */
EXPORT void extRender(MMDAgent *mmdagent) {

}

question get_question(const char *str) {

	for(vector<question>::iterator it = list.begin(); it != list.end(); it++) {
		if (MMDAgent_strequal(str, it->question_name)) {
			return *it;
		}
	}

	question error = {NULL, NULL, 0};

	return error;
}