# 0011-0020 Initialization

0    10   <eps>                               MODEL_ADD|bootscreen|Accessory\bootscreen\bootscreen.pmd|0.0,12.85,17.6|0.0,0.0,0.0|OFF
10   11   MODEL_EVENT_ADD|bootscreen          MODEL_ADD|mei|Model\mei\mei.pmd|-8.0,0.0,-14.0
11   12   <eps>                               MOTION_ADD|menu|rotate|Motion\menu_rotation\menu_rotation.vmd|FULL|LOOP|OFF|OFF
12   13   <eps>                               STAGE|Stage\building2\floor.bmp,Stage\building2\background_hino.jpg
13   14   <eps>                               MOTION_ADD|mei|base|Motion\mei_wait\mei_wait.vmd|FULL|LOOP|ON|OFF
14   15   <eps>                               TIMER_START|bootscreen|1.5
15   16    TIMER_EVENT_STOP|bootscreen        MODEL_DELETE|bootscreen
16   17   <eps>                               MODEL_ADD|choices|IMAGE\choices\choices.pmd|-3,0,3|0,0,0|ON|mei
17   18   <eps>                               MOTION_ADD|choices|choice_guide|Image\choices\normal.vmd|FULL|LOOP|ON|ON
18   19   <eps>                               MODEL_ADD|professor|IMAGE\professor\\professor.pmd|0,-10,5|0,0,0|ON|mei
19    2   <eps>                               MOTION_ADD|professor|professor_intro|Image\professor\start.vmd|FULL|LOOP|ON|ON

# 0021-0030 Idle behavior

# 2�̏�Ԃ�I������ƃ^�C�}�[���Z�b�g
# 1�̏�Ԃ̓^�C�}�[���N�������܂�

2    21   <eps>                               TIMER_START|idle1|20
21   22   TIMER_EVENT_START|idle1             TIMER_START|idle2|40
22   23   TIMER_EVENT_START|idle2             TIMER_START|idle3|60
23   1    TIMER_EVENT_START|idle3             VALUE_SET|random|0|100
1    1    RECOG_EVENT_START                   MOTION_ADD|mei|listen|Expression\mei_listen\mei_listen.vmd|PART|ONCE
1    1    TIMER_EVENT_STOP|idle1              MOTION_ADD|mei|idle|Motion\mei_idle\mei_idle_boredom.vmd|PART|ONCE
1    1    TIMER_EVENT_STOP|idle2              SYNTH_START|mei|mei_voice_normal|���ē��A���ȏЉ�A�������Љ�Ȃǂ��ł��܂���B
1    2    TIMER_EVENT_STOP|idle3              SYNTH_START|mei|mei_voice_normal|���ē��A�Ƙb�������Ă݂Ă��������B

# 0031-0040 Hello

1    30   KEY|1                               SOUND_START|user|input_voice\konnichiwa.mp3
30   31   SOUND_EVENT_STOP|user               SYNTH_START|mei|mei_voice_normal|����ɂ��́B
   
1    31   RECOG_EVENT_STOP|����ɂ���         SYNTH_START|mei|mei_voice_normal|����ɂ��́B
1    31   RECOG_EVENT_STOP|����ɂ���         SYNTH_START|mei|mei_voice_normal|����ɂ��́B
1    31   RECOG_EVENT_STOP|����΂��         SYNTH_START|mei|mei_voice_normal|����΂�́B
1    31   RECOG_EVENT_STOP|����΂��         SYNTH_START|mei|mei_voice_normal|����΂�́B
1    31   RECOG_EVENT_STOP|���͂悤           SYNTH_START|mei|mei_voice_normal|���͂悤�������܂��B
1    31   RECOG_EVENT_STOP|��������悤       SYNTH_START|mei|mei_voice_normal|��������悤�B
31   32   <eps>                               MOTION_ADD|mei|action|Motion\mei_greeting\mei_greeting.vmd|PART|ONCE
32   2    SYNTH_EVENT_STOP|mei                <eps>

# 0041-0050 Self introduction

1    40   KEY|2                               SOUND_START|user|input_voice\jikosyoukai.mp3
40   41   SOUND_EVENT_STOP|user               SYNTH_START|mei|mei_voice_normal|�q�m�ƌ����܂��B                       

1    41   RECOG_EVENT_STOP|���ȏЉ�           SYNTH_START|mei|mei_voice_normal|�q�m�ƌ����܂��B
1    41   RECOG_EVENT_STOP|���Ȃ�,�N          SYNTH_START|mei|mei_voice_normal|�q�m�ƌ����܂��B
1    41   RECOG_EVENT_STOP|�N,�N              SYNTH_START|mei|mei_voice_normal|�q�m�ƌ����܂��B
41   42   <eps>                               MOTION_ADD|mei|action|Motion\mei_self_introduction\mei_self_introduction.vmd|PART|ONCE
42   43   SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|��낵�����肢���܂��B
43   2    SYNTH_EVENT_STOP|mei                <eps>

# 0051-0060 Thank you

1    51   RECOG_EVENT_STOP|���肪��           SYNTH_START|mei|mei_voice_normal|�ǂ��������܂��āB
1    51   RECOG_EVENT_STOP|���肪�Ƃ�         SYNTH_START|mei|mei_voice_normal|�ǂ��������܂��āB
1    51   RECOG_EVENT_STOP|�L�             SYNTH_START|mei|mei_voice_normal|�ǂ��������܂��āB
1    51   RECOG_EVENT_STOP|�L��           SYNTH_START|mei|mei_voice_normal|�ǂ��������܂��āB
51   52   <eps>                               MOTION_ADD|mei|expression|Expression\mei_happiness\mei_happiness.vmd|PART|ONCE
52   53   SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_happy|���ł��A�b�������Ă��������ˁB
53   54   <eps>                               MOTION_CHANGE|mei|base|Motion\mei_guide\mei_guide_happy.vmd
54   2    SYNTH_EVENT_STOP|mei                MOTION_CHANGE|mei|base|Motion\mei_wait\mei_wait.vmd

# 0061-0070 Positive comments

1    61   RECOG_EVENT_STOP|����             VALUE_EVAL|random|LE|50
1    61   RECOG_EVENT_STOP|���킢��           VALUE_EVAL|random|LE|50
1    61   RECOG_EVENT_STOP|�Y��               VALUE_EVAL|random|LE|50
1    61   RECOG_EVENT_STOP|���ꂢ             VALUE_EVAL|random|LE|50
1    61   RECOG_EVENT_STOP|����               VALUE_EVAL|random|LE|50
1    61   RECOG_EVENT_STOP|�D��               VALUE_EVAL|random|LE|50
1    61   RECOG_EVENT_STOP|���l               VALUE_EVAL|random|LE|50
61   62   VALUE_EVENT_EVAL|random|LE|50|TRUE  SYNTH_START|mei|mei_voice_bashful|�p���������ł��B
61   62   VALUE_EVENT_EVAL|random|LE|50|FALSE SYNTH_START|mei|mei_voice_bashful|���肪�Ƃ��B
62   63   <eps>                               MOTION_ADD|mei|expression|Expression\mei_bashfulness\mei_bashfulness.vmd|PART|ONCE
63   2    SYNTH_EVENT_STOP|mei                <eps>

# 0071-0110 Guide

1    71   RECOG_EVENT_STOP|��s��w����       SYNTH_START|mei|mei_voice_normal|��s��w�����́A���3�̃L�����p�X����Ȃ��w�ł��B
1    71   RECOG_EVENT_STOP|��s��             SYNTH_START|mei|mei_voice_normal|��s��w�����́A���3�̃L�����p�X����Ȃ��w�ł��B
71   72   SYNTH_EVENT_STOP|mei                MODEL_ADD|minami|Image\tmu_minami\panel.pmd|10,20,-20|0,0,0|OFF
72   73   <eps>                               MODEL_ADD|hino|Image\tmu_hino\panel.pmd|3,8,-20|0,0,0|OFF
73   74   <eps>                               MODEL_ADD|arakawa|Image\tmu_arakawa\panel.pmd|17,8,-20|0,0,0|OFF
74   75   <eps>                               SYNTH_START|mei|mei_voice_normal|����L�����p�X�A����L�����p�X�A�r��L�����p�X������܂��B
75   76   SYNTH_EVENT_STOP|mei                MOTION_ADD|mei|action|Motion\mei_point\mei_point_left_buttom.vmd|PART|ONCE
76   80   <eps>                               SYNTH_START|mei|mei_voice_normal|�ǂ̃L�����p�X�ɂ��ďЉ�܂��傤�B

80   81   RECOG_EVENT_STOP|����             SYNTH_START|mei|mei_voice_normal|����L�����p�X�́A��ɕ��n�w�����W�܂�L�����p�X�ł��B
81   82   <eps>                               MODEL_DELETE|hino
82   83   <eps>                               MODEL_DELETE|arakawa
83   84   <eps>                               MODEL_DELETE|minami
84   85   MODEL_EVENT_DELETE|minami           MODEL_ADD|minami|Image\tmu_minami\panel.pmd|10,20,-20|0,0,0|OFF
85   86   <eps>                               MOTION_ADD|mei|action|Motion\mei_point\mei_point_left_buttom.vmd|PART|ONCE
86   87   SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|������ɂȂ�܂����H
87    2   SYNTH_EVENT_STOP|mei                MODEL_DELETE|minami

80   91   RECOG_EVENT_STOP|�q�m               SYNTH_START|mei|mei_voice_normal|����L�����p�X�́A��w3�N���ȏ�̃V�X�e���f�U�C���w�����W�܂�L�����p�X�ł��B
91   92   <eps>                               MODEL_DELETE|hino
92   93   <eps>                               MODEL_DELETE|arakawa
93   94   <eps>                               MODEL_DELETE|minami
94   95   MODEL_EVENT_DELETE|hino             MODEL_ADD|hino|Image\tmu_hino\panel.pmd|10,20,-20|0,0,0|OFF
95   96   <eps>                               MOTION_ADD|mei|action|Motion\mei_point\mei_point_left_buttom.vmd|PART|ONCE
96   97   SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|������ɂȂ�܂����H
97    2   SYNTH_EVENT_STOP|mei                MODEL_DELETE|hino

80   100  RECOG_EVENT_STOP|�r��	�@            SYNTH_START|mei|mei_voice_normal|�r��L�����p�X�́A��w2�N���ȏ�̌��N�����w�����W�܂�L�����p�X�ł��B
100  101  <eps>                               MODEL_DELETE|hino
101  102  <eps>                               MODEL_DELETE|arakawa
102  103  <eps>                               MODEL_DELETE|minami
103  104  MODEL_EVENT_DELETE|arakawa          MODEL_ADD|arakawa|Image\tmu_arakawa\panel.pmd|10,20,-20|0,0,0|OFF
104  105  <eps>                               MOTION_ADD|mei|action|Motion\mei_point\mei_point_left_buttom.vmd|PART|ONCE
105  106  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|������ɂȂ�܂����H
106    2  SYNTH_EVENT_STOP|mei                MODEL_DELETE|arakawa

# 0111-0120 Bye

1    111   RECOG_EVENT_STOP|�o�C�o�C           SYNTH_START|mei|mei_voice_normal|���悤�Ȃ�B
1    111   RECOG_EVENT_STOP|���悤�Ȃ�         SYNTH_START|mei|mei_voice_normal|���悤�Ȃ�B
1    111   RECOG_EVENT_STOP|����Ȃ�           SYNTH_START|mei|mei_voice_normal|���悤�Ȃ�B
111  112   <eps>                               MOTION_ADD|mei|action|Motion\mei_bye\mei_bye.vmd|PART|ONCE
112    2   SYNTH_EVENT_STOP|mei                <eps>

# 0121-0130 Browsing

1    121  RECOG_EVENT_STOP|�z�[���y�[�W       EXECUTE|http://www.tmu.ac.jp/
1    121  RECOG_EVENT_STOP|�l�l�c�`��������   EXECUTE|http://www.mmdagent.jp/
121  122  <eps>                               SYNTH_START|mei|mei_voice_normal|�l�l�c�`���������́A�z�[���y�[�W��\�����܂��B
122    2  SYNTH_EVENT_STOP|mei                <eps>

# 0131-0140 Screen

1    131  RECOG_EVENT_STOP|�t���X�N���[��     KEY_POST|MMDAgent|F|OFF
131  132  <eps>                               SYNTH_START|mei|mei_voice_normal|�X�N���[���̐ݒ���A�ύX���܂����B
132    2  SYNTH_EVENT_STOP|mei                <eps>

# 0141-0200 Positive comments

1    141   RECOG_EVENT_STOP|�q�m,����          VALUE_EVAL|random|LE|50
1    141   RECOG_EVENT_STOP|�q�m               VALUE_EVAL|random|LE|50
1    141   RECOG_EVENT_STOP|�˂�               VALUE_EVAL|random|LE|50
1    141   RECOG_EVENT_STOP|�˂��˂�           VALUE_EVAL|random|LE|50
141  142   VALUE_EVENT_EVAL|random|LE|50|TRUE  SYNTH_START|mei|mei_voice_normal|�ǂ����܂������B
141  142   VALUE_EVENT_EVAL|random|LE|50|FALSE SYNTH_START|mei|mei_voice_normal|������ł����B
142  143   SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|���ȏЉ�A���ē��A�������Љ�Ȃǂ��ł��܂���B
143  144   SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_happy|���ł��A�b�������Ă��������ˁB
144  2     SYNTH_EVENT_STOP|mei					 <eps>




### 0200-0400 ���ē� ###

# 0200-0210 �n�}�̕\��

1    200  KEY|4                                SYNTH_START|mei|mei_voice_normal|�n�}��\�����܂��B
1    200  RECOG_EVENT_STOP|��,�ē�             SYNTH_START|mei|mei_voice_normal|�n�}��\�����܂��B
1    200  RECOG_EVENT_STOP|���ē�              SYNTH_START|mei|mei_voice_normal|�n�}��\�����܂��B
200  201  <eps>                                MOTION_CHANGE|choices|choice_guide|Image\choices\guide.vmd
201  202  SYNTH_EVENT_STOP|mei                 ROTATE_START|mei|0,-90,0|GLOBAL|60
202  203  ROTATE_EVENT_STOP|mei                MOTION_ADD|mei|walk|Motion\mei_walk\mei_walk_fast.vmd|FULL|ONCE|ON|ON
203  204  <eps>                                MOVE_START|mei|-18,0,-14|GLOBAL|6
204  205  MOVE_EVENT_STOP|mei                  MOTION_DELETE|mei|walk
205  206  <eps>                                ROTATE_START|mei|0,0,0|GLOBAL|60
206  207  ROTATE_EVENT_STOP|mei                MOTION_ADD|mei|wait|Motion\mei_wait\mei_wait.vmd|PART|ONCE
207  208  <eps>                                MAP_ADD|5,12,-6
208  209  <eps>                                SYNTH_START|mei|mei_voice_normal|�ǂ��܂ňē����܂��傤�B
209  210  <eps>                                MOTION_ADD|mei|point|Motion\mei_point\mei_point_left_buttom.vmd|PART|ONCE

# 210�����傩��ꏊ���w�肷��Ɗe�n�_�ֈē�������
# ���ē���̏�Ԃ�380

# 0210 - 0240 2���ق̈ē�

210  211  KEY|2                                SYNTH_START|mei|mei_voice_normal|�B
210  211  RECOG_EVENT_STOP|��,����             SYNTH_START|mei|mei_voice_normal|�B
210  211  RECOG_EVENT_STOP|��u�`��            SYNTH_START|mei|mei_voice_normal|��u�`���͓񍆊ق̓�K�ɂ���܂��B
210  211  RECOG_EVENT_STOP|�v�Z�@,�Z���^�[     SYNTH_START|mei|mei_voice_normal|�v�Z�@�Z���^�[�͓񍆊ق̓�K�ɂ���܂��B
210  211  RECOG_EVENT_STOP|�R��                SYNTH_START|mei|mei_voice_normal|�R���������͓񍆊ق̘Z�K�ɂ���܂��B
210  211  RECOG_EVENT_STOP|�M��                SYNTH_START|mei|mei_voice_normal|�M�ƌ������͓񍆊ق̘Z�K�ɂ���܂��B
210  211  RECOG_EVENT_STOP|����                SYNTH_START|mei|mei_voice_normal|���쌤�����͓񍆊ق̘Z�K�ɂ���܂��B
210  211  RECOG_EVENT_STOP|����                SYNTH_START|mei|mei_voice_normal|�����������͓񍆊ق̘Z�K�ɂ���܂��B
210  211  RECOG_EVENT_STOP|�ΐ�                SYNTH_START|mei|mei_voice_normal|�ΐ쌤�����͓񍆊ق̘Z�K�ɂ���܂��B
210  211  RECOG_EVENT_STOP|���{                SYNTH_START|mei|mei_voice_normal|���{�������͓񍆊ق̘Z�K�ɂ���܂��B
210  211  RECOG_EVENT_STOP|�L������            SYNTH_START|mei|mei_voice_normal|�L�������͓񍆊ق̌܊K�ɂ���܂��B

211  212  <eps>                                MOTION_CHANGE|mei|base|Motion\mei_guide\mei_guide_normal.vmd
212  213  SYNTH_EVENT_STOP|mei                 SYNTH_START|mei|mei_voice_normal|�񍆊ق́A���傩�瓹�Ȃ�ɂ܂������i�ނƂ��܂��B
213  214  SYNTH_EVENT_STOP|mei                 SYNTH_START|mei|mei_voice_normal|�L�����p�X�}�b�v�ł́A������ɂȂ�܂��B
214  215  SYNTH_EVENT_STOP|mei                 GUIDE_START|2
215  216  <eps>                                MOTION_CHANGE|mei|base|Motion\mei_guide\mei_guide_happy.vmd
216  217  <eps>                                SYNTH_START|mei|mei_voice_normal|�����č���ɃG���x�[�^�[���������܂��B�����p���������B
217  218  <eps>                                MOTION_CHANGE|mei|base|Motion\mei_wait\mei_wait.vmd
218  380  GUIDE_EVENT_GOAL|2                   <eps>

# 0241-0260 ���ē�-1����

210  241  KEY|1                                SYNTH_START|mei|mei_voice_normal|�B
210  241  RECOG_EVENT_STOP|��,����             SYNTH_START|mei|mei_voice_normal|�B
210  241  RECOG_EVENT_STOP|�w��,��             SYNTH_START|mei|mei_voice_normal|�w���ۂ͈ꍆ�ٓ����Ă����ɂ���܂��B

241  242  SYNTH_EVENT_STOP|mei                 SYNTH_START|mei|mei_voice_normal|�L�����p�X�}�b�v�ł́A������ɂȂ�܂��B
242  243  <eps>                                GUIDE_START|1

243  244  SYNTH_EVENT_STOP|mei                 SYNTH_START|mei|mei_voice_normal|�ꍆ�ق́A���傩�瓹�Ȃ�ɂ܂������i�݁A�񍆊ق�ʉ߂���Ƃ��܂��B
244  245  SYNTH_EVENT_STOP|mei                 SYNTH_START|mei|mei_voice_normal|�w���ۂɌ�p�̂����͂�����ɂ��炵�Ă��������B
245  246  <eps>                                MOTION_CHANGE|mei|base|Motion\mei_wait\mei_wait.vmd
246  380  GUIDE_EVENT_GOAL|1                   <eps>

# 0261-0280 ���ē�-4����

210  261  KEY|4                                SYNTH_START|mei|mei_voice_normal|�B
210  261  RECOG_EVENT_STOP|�l,����             SYNTH_START|mei|mei_voice_normal|�B
261  262  SYNTH_EVENT_STOP|mei                 SYNTH_START|mei|mei_voice_normal|�L�����p�X�}�b�v�ł́A������ɂȂ�܂��B
262  263  <eps>                                GUIDE_START|4
263  380  GUIDE_EVENT_GOAL|4                   <eps>

# 0281-0300 ���ē�-3����

210  281  KEY|3                                SYNTH_START|mei|mei_voice_normal|�B
210  281  RECOG_EVENT_STOP|�O,����             SYNTH_START|mei|mei_voice_normal|�B
281  282  SYNTH_EVENT_STOP|mei                 SYNTH_START|mei|mei_voice_normal|�L�����p�X�}�b�v�ł́A������ɂȂ�܂��B
282  283  <eps>                                GUIDE_START|3
283  380  GUIDE_EVENT_GOAL|3                   <eps>

# 0301-0320 ���ē�-5����

210  301  KEY|5                                SYNTH_START|mei|mei_voice_normal|�B
210  301  RECOG_EVENT_STOP|��,����             SYNTH_START|mei|mei_voice_normal|�B
301  302  SYNTH_EVENT_STOP|mei                 SYNTH_START|mei|mei_voice_normal|�L�����p�X�}�b�v�ł́A������ɂȂ�܂��B
302  303  <eps>                                GUIDE_START|5
303  380  GUIDE_EVENT_GOAL|5                   <eps>

# 0321-0340 ���ē�-�w�����

210  321  KEY|6                                SYNTH_START|mei|mei_voice_normal|�B
210  321  RECOG_EVENT_STOP|�w��                SYNTH_START|mei|mei_voice_normal|�B
321  322  SYNTH_EVENT_STOP|mei                 SYNTH_START|mei|mei_voice_normal|�L�����p�X�}�b�v�ł́A������ɂȂ�܂��B
322  323  <eps>                                GUIDE_START|uh
323  380  GUIDE_EVENT_GOAL|uh                  <eps>

# 0341-0360 ���ē�-�̈��

210  341  KEY|7                                SYNTH_START|mei|mei_voice_normal|�B
210  341  RECOG_EVENT_STOP|�̈�                SYNTH_START|mei|mei_voice_normal|�B
341  342  SYNTH_EVENT_STOP|mei                 SYNTH_START|mei|mei_voice_normal|�L�����p�X�}�b�v�ł́A������ɂȂ�܂��B
342  343  <eps>                                GUIDE_START|gym
343  380  GUIDE_EVENT_GOAL|gym                 <eps>

# 0380 - 0390 ���ē��̌p�� 

380  381  <eps>                                SYNTH_START|mei|mei_voice_normal|���ē��𑱂��܂���?
381  382  SYNTH_EVENT_STOP|mei                 <eps>

382  383  KEY|1                                SYNTH_START|mei|mei_voice_normal|����ł͓��ē��𑱂��܂��B
382  383  RECOG_EVENT_STOP|�͂�                SYNTH_START|mei|mei_voice_normal|����ł͓��ē��𑱂��܂��B
383  210  SYNTH_EVENT_STOP|mei                 <eps>

382  390  KEY|2                                <eps>
382  390  RECOG_EVENT_STOP|�I��              <eps>

# 0390 - 0400 ���ē��̏I��

390  391  <eps>                                SYNTH_START|mei|mei_voice_normal|���ē����I�����܂��B
391  392  <eps>                                GUIDE_STOP
392  393  <eps>                                ROTATE_START|mei|0,90,0|GLOBAL|60
393  394  ROTATE_EVENT_STOP|mei                MOTION_ADD|mei|walk|Motion\mei_walk\mei_walk_fast.vmd|FULL|ONCE|ON|ON
394  395  <eps>                                MOVE_START|mei|-8,0,-14|GLOBAL|6
395  396  MOVE_EVENT_STOP|mei                  MOTION_DELETE|mei|walk
396  397  <eps>                                ROTATE_START|mei|0,0,0|GLOBAL|60
397  398  ROTATE_EVENT_STOP|mei                MOTION_ADD|mei|wait|Motion\mei_wait\mei_wait.vmd|PART|ONCE
398    2  <eps>                                MOTION_CHANGE|choices|choice_guide|Image\choices\normal.vmd



### 401 - 600 �������Љ� ###

1    401  KEY|3                                SYNTH_START|mei|mei_voice_normal|�ǂ̌��������Љ�܂��傤�B
1    401  RECOG_EVENT_STOP|����,��             SYNTH_START|mei|mei_voice_normal|�ǂ̌��������Љ�܂��傤�B
1    401  RECOG_EVENT_STOP|����,��,�Љ�        SYNTH_START|mei|mei_voice_normal|�ǂ̌��������Љ�܂��傤�B
401  402  <eps>                                MOTION_CHANGE|choices|choice_guide|Image\choices\lab.vmd
402  403  <eps>                                MOTION_CHANGE|professor|professor_intro|Image\professor\all.vmd
403  410  <eps>                                MOVE_START|professor|8.5,0.5,0.5|GLOBAL|20

# 410���e�������̈ē��ɕ��򂳂�����

# ���{�� 411-420

410  411  KEY|1                                MOTION_CHANGE|professor|professor_intro|Image\professor\fukumoto.vmd
410  411  RECOG_EVENT_STOP|���{                MOTION_CHANGE|professor|professor_intro|Image\professor\fukumoto.vmd
411  412  <eps>                                SYNTH_START|mei|mei_voice_normal|�ό̏ᐫ�̍����A�R���s���[�^�V�X�e����A�l�b�g���[�N�V�X�e���̎�����@�ɂ��Č������Ă��܂��B
412  540  SYNTH_EVENT_STOP|mei                 <eps>


# ��v�ی� 421-430

410  421  RECOG_EVENT_STOP|��v��              MOTION_CHANGE|professor|professor_intro|Image\professor\okubo.vmd
421  422  <eps>                                SYNTH_START|mei|mei_voice_normal|�M����́A���l�V�~�����[�V�����A�d���E�v���Ɋւ��錤���������Ȃ��Ă��܂��B
422  540  SYNTH_EVENT_STOP|mei                 <eps>

# �ΐ쌤 431-440

410  431  RECOG_EVENT_STOP|�ΐ�                MOTION_CHANGE|professor|professor_intro|Image\professor\ishikawa.vmd
431  432  <eps>                                SYNTH_START|mei|mei_voice_normal|�r�b�O�f�[�^�������I�ɉ�͂��邱�ƂŐV�������l�𔭌�����Z�p���������Ă��܂��B
432  540  SYNTH_EVENT_STOP|mei                 <eps>

# ������ 441-450

410  441  RECOG_EVENT_STOP|����                MOTION_CHANGE|professor|professor_intro|Image\professor\komachi.vmd
441  442  <eps>                                SYNTH_START|mei|mei_voice_normal|�l�Ԃ̌��t����͂��A����w�K�̍앶�̌������A�|��Ȃǂ̑�����R�~���j�P�[�V�����x���ɂȂ��錤�������Ă��܂��B
442  540  SYNTH_EVENT_STOP|mei                 <eps>

# �R���� 451-460

410  451  RECOG_EVENT_STOP|�R��                MOTION_CHANGE|professor|professor_intro|Image\professor\yamaguchi.vmd
451  452  <eps>                                SYNTH_START|mei|mei_voice_normal|�W�F�X�`���[����������Ӑ}�̔F���@�\�A�l�ԂƈӐ}�����L���R�~���j�P�[�g����I���g���W�[�@�\�A����ɁA�R�~���j�P�[�V��������ԑS�̂ɍL����m�\��Ԃ��������Ă��܂��B
452  540  SYNTH_EVENT_STOP|mei                 <eps>
# ���ی� 461-470

410  461  RECOG_EVENT_STOP|����                MOTION_CHANGE|professor|professor_intro|Image\professor\abo.vmd
461  462  <eps>                                SYNTH_START|mei|mei_voice_normal|�d�g������g���āA�������ꂽ�ꏊ�̊����𑪂�A���̏���`������V�X�e���̌��������Ă��܂��B
462  540  SYNTH_EVENT_STOP|mei                 <eps>

# ���Ԍ� 471-480

410  471  RECOG_EVENT_STOP|����                MOTION_CHANGE|professor|professor_intro|Image\professor\takama.vmd
471  472  <eps>                                SYNTH_START|mei|mei_voice_normal|�Z�}���e�B�b�N�E�F�u�Z�p�����p������񌟍��V�X�e����A�������Z�p��p�����m�I�C���^�t�F�[�X�A�e�L�X�g��摜���̌����I�Ȏ��W��@�Ȃǂɂ��Č����������Ȃ��Ă��܂��B
472  540  SYNTH_EVENT_STOP|mei                 <eps>

# �M�ƌ��@481-490

410  481  RECOG_EVENT_STOP|�M��                MOTION_CHANGE|professor|professor_intro|Image\professor\kiya.vmd
481  482  <eps>                                SYNTH_START|mei|mei_voice_normal|��񈳏k�A�f�������A�R���e���c�z�M�A�Z�L�����e�B�Ɋւ��錤�������Ă��܂��B
482  540  SYNTH_EVENT_STOP|mei                 <eps>

# �c�쌤 491-500

410  491  RECOG_EVENT_STOP|�c��                MOTION_CHANGE|professor|professor_intro|Image\professor\tagawa.vmd
491  492  <eps>                                SYNTH_START|mei|mei_voice_normal|�v���f�[�^����͂��āA���]�̏��𒊏o���邽�߂̌��������Ă��܂��B
492  540  SYNTH_EVENT_STOP|mei                 <eps>

# �ēc�� 501-510

410  501  RECOG_EVENT_STOP|�ēc                MOTION_CHANGE|professor|professor_intro|Image\professor\shibata.vmd
501  502  <eps>                                SYNTH_START|mei|mei_voice_normal|�n���E�s�s�����ɖ𗧂����[�g�Z���V���O�V�X�e���̌����������Ȃ��Ă��܂��B
502  540  SYNTH_EVENT_STOP|mei                 <eps>

# �O�Y�� 511-520

410  511  RECOG_EVENT_STOP|�O�Y                MOTION_CHANGE|professor|professor_intro|Image\professor\miura.vmd
511  512  <eps>                                SYNTH_START|mei|mei_voice_normal|���M�����̂���VLSI�̐݌v��@�A���̓���m�F�ɂ��Č������Ă��܂��B
512  540  SYNTH_EVENT_STOP|mei                 <eps>

# ���쌤 521-530

410  521  RECOG_EVENT_STOP|����                MOTION_CHANGE|professor|professor_intro|Image\professor\nishikawa.vmd
521  522  <eps>                                SYNTH_START|mei|mei_voice_normal|���摜�ɑ�\����郁�f�B�A�����A�C���^�[�l�b�g��p���Č����悭�z�M���鎖���������Ă��܂��B
522  540  SYNTH_EVENT_STOP|mei                 <eps>

# �������Љ�̌p�� #540 - 600

540  541  <eps>                                MOTION_CHANGE|professor|professor_intro|Image\professor\all.vmd
541  542  <eps>                                MOVE_START|professor|8.5,0.5,0.5|GLOBAL|20
542  543  <eps>                                SYNTH_START|mei|mei_voice_normal|���̌������̐����𕷂����������͂��̂܂܁A�搶�̖��O������������Ă��������B
543  550  SYNTH_EVENT_STOP|mei                 SYNTH_START|mei|mei_voice_normal|�������Љ���I������ꍇ�́A�I���A�Ƃ���������Ă�������


550  411  RECOG_EVENT_STOP|���{                MOTION_CHANGE|professor|professor_intro|Image\professor\fukumoto.vmd
550  421  RECOG_EVENT_STOP|��v��              MOTION_CHANGE|professor|professor_intro|Image\professor\okubo.vmd
550  431  RECOG_EVENT_STOP|�ΐ�                MOTION_CHANGE|professor|professor_intro|Image\professor\ishikawa.vmd
550  441  RECOG_EVENT_STOP|����                MOTION_CHANGE|professor|professor_intro|Image\professor\komachi.vmd
550  451  RECOG_EVENT_STOP|�R��                MOTION_CHANGE|professor|professor_intro|Image\professor\yamaguchi.vmd
550  461  RECOG_EVENT_STOP|����                MOTION_CHANGE|professor|professor_intro|Image\professor\abo.vmd
550  471  RECOG_EVENT_STOP|����                MOTION_CHANGE|professor|professor_intro|Image\professor\takama.vmd
550  481  RECOG_EVENT_STOP|�M��                MOTION_CHANGE|professor|professor_intro|Image\professor\kiya.vmd
550  491  RECOG_EVENT_STOP|�c��                MOTION_CHANGE|professor|professor_intro|Image\professor\tagawa.vmd
550  501  RECOG_EVENT_STOP|�ēc                MOTION_CHANGE|professor|professor_intro|Image\professor\shibata.vmd
550  511  RECOG_EVENT_STOP|�O�Y                MOTION_CHANGE|professor|professor_intro|Image\professor\miura.vmd
550  521  RECOG_EVENT_STOP|����                MOTION_CHANGE|professor|professor_intro|Image\professor\nishikawa.vmd

550  451  KEY|2                                MOTION_CHANGE|professor|professor_intro|Image\professor\yamaguchi.vmd

550  551  KEY|1                                SYNTH_START|mei|mei_voice_normal|�������Љ���I�����܂�
550  551  RECOG_EVENT_STOP|�I��                SYNTH_START|mei|mei_voice_normal|�������Љ���I�����܂�
551  552  SYNTH_EVENT_STOP|mei                 MOTION_CHANGE|professor|professor_intro|Image\professor\start.vmd
552  553  <eps>                                MOTION_CHANGE|choices|choice_guide|Image\choices\normal.vmd
553    2  <eps>                                MOVE_START|professor|0,-10,5|GLOBAL|20



### �A���P�[�g�@�\  5001 - 6000###

   1  5001  RECOG_EVENT_STOP|�A���P�[�g        SYNTH_START|mei|mei_voice_normal|�ǂ̃A���P�[�g�ɂ��������܂����H
5001  5100  <eps>                              MODEL_ADD|question_list|Image\question_list\panel_survey.pmd|5,18,-10|0,0,0|ON

# ���ʂ́H

5100  5101  RECOG_EVENT_STOP|����              MODEL_DELETE|question_list
5101  5102  <eps>                              Q_ASK|sex
5102  5103  <eps>                              MODEL_ADD|sex|Image\sex\panel_survey.pmd|5,18,-10|0,0,0|ON
5103  5104  RECOG_EVENT_STOP|�j                Q_COUNT|sex|man
5103  5104  RECOG_EVENT_STOP|��                Q_COUNT|sex|woman
5104  5105  <eps>                              SYNTH_START|mei|mei_voice_normal|�󂯕t���܂����B
5105  5900  <eps>                              MODEL_DELETE|sex

#�@�N��́H

5100  5111  RECOG_EVENT_STOP|�N��              MODEL_DELETE|question_list
5111  5112  <eps>                              Q_ASK|age
5112  5113  <eps>                              MODEL_ADD|age|Image\age\panel_survey.pmd|5,18,-10|0,0,0|ON
5113  5114  RECOG_EVENT_STOP|��                Q_COUNT|age|10s
5113  5114  RECOG_EVENT_STOP|��                Q_COUNT|age|20s
5113  5114  RECOG_EVENT_STOP|�O                Q_COUNT|age|30s
5113  5114  RECOG_EVENT_STOP|�l                Q_COUNT|age|40s
5113  5114  RECOG_EVENT_STOP|��                Q_COUNT|age|50s
5113  5114  RECOG_EVENT_STOP|�Z                Q_COUNT|age|60s
5113  5114  RECOG_EVENT_STOP|��                Q_COUNT|age|70over
5114  5115  <eps>                              SYNTH_START|mei|mei_voice_normal|�󂯕t���܂����B
5115  5900  <eps>                              MODEL_DELETE|age

# �R�[�X�́H

5100  5121  RECOG_EVENT_STOP|�R�[�X            MODEL_DELETE|question_list
5121  5122  <eps>                              Q_ASK|course
5122  5123  <eps>                              MODEL_ADD|course|Image\course\panel_survey.pmd|5,18,-10|0,0,0|ON
5123  5124  RECOG_EVENT_STOP|�m�\              Q_COUNT|course|IMS
5123  5124  RECOG_EVENT_STOP|���ʐM          Q_COUNT|course|ICS
5123  5124  RECOG_EVENT_STOP|�q��              Q_COUNT|course|AE
5123  5124  RECOG_EVENT_STOP|�o�c              Q_COUNT|course|MSE
5123  5124  RECOG_EVENT_STOP|�C���_�X          Q_COUNT|course|IA
5124  5125  <eps>                              SYNTH_START|mei|mei_voice_normal|�󂯕t���܂����B
5125  5900 <eps>                              MODEL_DELETE|course

# �E�Ƃ�?

5100  5131  RECOG_EVENT_STOP|�E��              MODEL_DELETE|question_list
5131  5132  <eps>                              Q_ASK|job
5132  5133  <eps>                              MODEL_ADD|job|Image\job\panel_survey.pmd|5,18,-10|0,0,0|ON
5133  5134  RECOG_EVENT_STOP|�w��              Q_COUNT|job|student
5133  5134  RECOG_EVENT_STOP|����              Q_COUNT|job|professor
5133  5134  RECOG_EVENT_STOP|���̑�            Q_COUNT|job|other
5134  5135  <eps>                              SYNTH_START|mei|mei_voice_normal|�󂯕t���܂����B
5135  5900  <eps>                              MODEL_DELETE|job

# �L�m�R�A�^�P�m�R�푈

5100  5141  RECOG_EVENT_STOP|�푈              MODEL_DELETE|question_list
5141  5142  <eps>                              Q_ASK|war
5142  5143  <eps>                              MODEL_ADD|war|Image\war\panel_survey.pmd|5,18,-10|0,0,0|ON
5143  5144  RECOG_EVENT_STOP|�L�m�R            Q_COUNT|war|kinoko
5143  5144  RECOG_EVENT_STOP|�����̂�          Q_COUNT|war|takenoko
5144  5145  <eps>                              SYNTH_START|mei|mei_voice_normal|�󂯕t���܂����B
5145  5900  <eps>                              MODEL_DELETE|war

# �C���h�A�H�A�E�g�h�A�H

5100  5151  RECOG_EVENT_STOP|�              MODEL_DELETE|question_list
5151  5152  <eps>                              Q_ASK|hoby
5152  5153  <eps>                              MODEL_ADD|hoby|Image\hoby\panel_survey.pmd|5,18,-10|0,0,0|ON
5153  5154  RECOG_EVENT_STOP|�C���h�A          Q_COUNT|hoby|indoor
5153  5154  RECOG_EVENT_STOP|�A�E�g�h�A        Q_COUNT|hoby|outdoor
5154  5155  <eps>                              SYNTH_START|mei|mei_voice_normal|�󂯕t���܂����B
5155  5900  <eps>                              MODEL_DELETE|hoby

# �W�v���ʕ\��

5900  5901  SYNTH_EVENT_STOP|mei               SYNTH_START|mei|mei_voice_normal|�����炪���݂̉𓚏󋵂ł��B
5901  5902  <eps>                              MODEL_ADD|survey|Image\survey\panel_survey.pmd|5,18,-10|0,0,0|ON
5902  5903  <eps>                              TIMER_START|waittime|10
5903     1  TIMER_EVENT_STOP|waittime          MODEL_DELETE|survey


# ���U��Ԃ�

1  1   CAMERA_EVENT_HANDSHAKE|right_hand         MOTION_ADD|mei|shake|Motion\mei_bye\mei_bye.vmd|FULL|ONCE|OFF|OFF
1  1   CAMERA_EVENT_HANDSHAKE|left_hand          MOTION_ADD|mei|shake|Motion\mei_bye\mei_bye.vmd|FULL|ONCE|OFF|OFF