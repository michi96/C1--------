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

# 2の状態を選択するとタイマーリセット
# 1の状態はタイマーが起動したまま

2    21   <eps>                               TIMER_START|idle1|20
21   22   TIMER_EVENT_START|idle1             TIMER_START|idle2|40
22   23   TIMER_EVENT_START|idle2             TIMER_START|idle3|60
23   1    TIMER_EVENT_START|idle3             VALUE_SET|random|0|100
1    1    RECOG_EVENT_START                   MOTION_ADD|mei|listen|Expression\mei_listen\mei_listen.vmd|PART|ONCE
1    1    TIMER_EVENT_STOP|idle1              MOTION_ADD|mei|idle|Motion\mei_idle\mei_idle_boredom.vmd|PART|ONCE
1    1    TIMER_EVENT_STOP|idle2              SYNTH_START|mei|mei_voice_normal|道案内、自己紹介、研究室紹介などができますよ。
1    2    TIMER_EVENT_STOP|idle3              SYNTH_START|mei|mei_voice_normal|道案内、と話しかけてみてください。

# 0031-0040 Hello

1    30   KEY|1                               SOUND_START|user|input_voice\konnichiwa.mp3
30   31   SOUND_EVENT_STOP|user               SYNTH_START|mei|mei_voice_normal|こんにちは。
   
1    31   RECOG_EVENT_STOP|こんにちは         SYNTH_START|mei|mei_voice_normal|こんにちは。
1    31   RECOG_EVENT_STOP|こんにちわ         SYNTH_START|mei|mei_voice_normal|こんにちは。
1    31   RECOG_EVENT_STOP|こんばんは         SYNTH_START|mei|mei_voice_normal|こんばんは。
1    31   RECOG_EVENT_STOP|こんばんわ         SYNTH_START|mei|mei_voice_normal|こんばんは。
1    31   RECOG_EVENT_STOP|おはよう           SYNTH_START|mei|mei_voice_normal|おはようございます。
1    31   RECOG_EVENT_STOP|ごきげんよう       SYNTH_START|mei|mei_voice_normal|ごきげんよう。
31   32   <eps>                               MOTION_ADD|mei|action|Motion\mei_greeting\mei_greeting.vmd|PART|ONCE
32   2    SYNTH_EVENT_STOP|mei                <eps>

# 0041-0050 Self introduction

1    40   KEY|2                               SOUND_START|user|input_voice\jikosyoukai.mp3
40   41   SOUND_EVENT_STOP|user               SYNTH_START|mei|mei_voice_normal|ヒノと言います。                       

1    41   RECOG_EVENT_STOP|自己紹介           SYNTH_START|mei|mei_voice_normal|ヒノと言います。
1    41   RECOG_EVENT_STOP|あなた,誰          SYNTH_START|mei|mei_voice_normal|ヒノと言います。
1    41   RECOG_EVENT_STOP|君,誰              SYNTH_START|mei|mei_voice_normal|ヒノと言います。
41   42   <eps>                               MOTION_ADD|mei|action|Motion\mei_self_introduction\mei_self_introduction.vmd|PART|ONCE
42   43   SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|よろしくお願いします。
43   2    SYNTH_EVENT_STOP|mei                <eps>

# 0051-0060 Thank you

1    51   RECOG_EVENT_STOP|ありがと           SYNTH_START|mei|mei_voice_normal|どういたしまして。
1    51   RECOG_EVENT_STOP|ありがとう         SYNTH_START|mei|mei_voice_normal|どういたしまして。
1    51   RECOG_EVENT_STOP|有難う             SYNTH_START|mei|mei_voice_normal|どういたしまして。
1    51   RECOG_EVENT_STOP|有り難う           SYNTH_START|mei|mei_voice_normal|どういたしまして。
51   52   <eps>                               MOTION_ADD|mei|expression|Expression\mei_happiness\mei_happiness.vmd|PART|ONCE
52   53   SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_happy|いつでも、話しかけてくださいね。
53   54   <eps>                               MOTION_CHANGE|mei|base|Motion\mei_guide\mei_guide_happy.vmd
54   2    SYNTH_EVENT_STOP|mei                MOTION_CHANGE|mei|base|Motion\mei_wait\mei_wait.vmd

# 0061-0070 Positive comments

1    61   RECOG_EVENT_STOP|可愛い             VALUE_EVAL|random|LE|50
1    61   RECOG_EVENT_STOP|かわいい           VALUE_EVAL|random|LE|50
1    61   RECOG_EVENT_STOP|綺麗               VALUE_EVAL|random|LE|50
1    61   RECOG_EVENT_STOP|きれい             VALUE_EVAL|random|LE|50
1    61   RECOG_EVENT_STOP|結婚               VALUE_EVAL|random|LE|50
1    61   RECOG_EVENT_STOP|好き               VALUE_EVAL|random|LE|50
1    61   RECOG_EVENT_STOP|美人               VALUE_EVAL|random|LE|50
61   62   VALUE_EVENT_EVAL|random|LE|50|TRUE  SYNTH_START|mei|mei_voice_bashful|恥ずかしいです。
61   62   VALUE_EVENT_EVAL|random|LE|50|FALSE SYNTH_START|mei|mei_voice_bashful|ありがとう。
62   63   <eps>                               MOTION_ADD|mei|expression|Expression\mei_bashfulness\mei_bashfulness.vmd|PART|ONCE
63   2    SYNTH_EVENT_STOP|mei                <eps>

# 0071-0110 Guide

1    71   RECOG_EVENT_STOP|首都大学東京       SYNTH_START|mei|mei_voice_normal|首都大学東京は、主に3つのキャンパスからなる大学です。
1    71   RECOG_EVENT_STOP|首都大             SYNTH_START|mei|mei_voice_normal|首都大学東京は、主に3つのキャンパスからなる大学です。
71   72   SYNTH_EVENT_STOP|mei                MODEL_ADD|minami|Image\tmu_minami\panel.pmd|10,20,-20|0,0,0|OFF
72   73   <eps>                               MODEL_ADD|hino|Image\tmu_hino\panel.pmd|3,8,-20|0,0,0|OFF
73   74   <eps>                               MODEL_ADD|arakawa|Image\tmu_arakawa\panel.pmd|17,8,-20|0,0,0|OFF
74   75   <eps>                               SYNTH_START|mei|mei_voice_normal|南大沢キャンパス、日野キャンパス、荒川キャンパスがあります。
75   76   SYNTH_EVENT_STOP|mei                MOTION_ADD|mei|action|Motion\mei_point\mei_point_left_buttom.vmd|PART|ONCE
76   80   <eps>                               SYNTH_START|mei|mei_voice_normal|どのキャンパスについて紹介しましょう。

80   81   RECOG_EVENT_STOP|南大沢             SYNTH_START|mei|mei_voice_normal|南大沢キャンパスは、主に文系学部が集まるキャンパスです。
81   82   <eps>                               MODEL_DELETE|hino
82   83   <eps>                               MODEL_DELETE|arakawa
83   84   <eps>                               MODEL_DELETE|minami
84   85   MODEL_EVENT_DELETE|minami           MODEL_ADD|minami|Image\tmu_minami\panel.pmd|10,20,-20|0,0,0|OFF
85   86   <eps>                               MOTION_ADD|mei|action|Motion\mei_point\mei_point_left_buttom.vmd|PART|ONCE
86   87   SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|お解りになりますか？
87    2   SYNTH_EVENT_STOP|mei                MODEL_DELETE|minami

80   91   RECOG_EVENT_STOP|ヒノ               SYNTH_START|mei|mei_voice_normal|日野キャンパスは、大学3年生以上のシステムデザイン学部が集まるキャンパスです。
91   92   <eps>                               MODEL_DELETE|hino
92   93   <eps>                               MODEL_DELETE|arakawa
93   94   <eps>                               MODEL_DELETE|minami
94   95   MODEL_EVENT_DELETE|hino             MODEL_ADD|hino|Image\tmu_hino\panel.pmd|10,20,-20|0,0,0|OFF
95   96   <eps>                               MOTION_ADD|mei|action|Motion\mei_point\mei_point_left_buttom.vmd|PART|ONCE
96   97   SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|お解りになりますか？
97    2   SYNTH_EVENT_STOP|mei                MODEL_DELETE|hino

80   100  RECOG_EVENT_STOP|荒川	　            SYNTH_START|mei|mei_voice_normal|荒川キャンパスは、大学2年生以上の健康福祉学部が集まるキャンパスです。
100  101  <eps>                               MODEL_DELETE|hino
101  102  <eps>                               MODEL_DELETE|arakawa
102  103  <eps>                               MODEL_DELETE|minami
103  104  MODEL_EVENT_DELETE|arakawa          MODEL_ADD|arakawa|Image\tmu_arakawa\panel.pmd|10,20,-20|0,0,0|OFF
104  105  <eps>                               MOTION_ADD|mei|action|Motion\mei_point\mei_point_left_buttom.vmd|PART|ONCE
105  106  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|お解りになりますか？
106    2  SYNTH_EVENT_STOP|mei                MODEL_DELETE|arakawa

# 0111-0120 Bye

1    111   RECOG_EVENT_STOP|バイバイ           SYNTH_START|mei|mei_voice_normal|さようなら。
1    111   RECOG_EVENT_STOP|さようなら         SYNTH_START|mei|mei_voice_normal|さようなら。
1    111   RECOG_EVENT_STOP|さよなら           SYNTH_START|mei|mei_voice_normal|さようなら。
111  112   <eps>                               MOTION_ADD|mei|action|Motion\mei_bye\mei_bye.vmd|PART|ONCE
112    2   SYNTH_EVENT_STOP|mei                <eps>

# 0121-0130 Browsing

1    121  RECOG_EVENT_STOP|ホームページ       EXECUTE|http://www.tmu.ac.jp/
1    121  RECOG_EVENT_STOP|ＭＭＤＡｇｅｎｔ   EXECUTE|http://www.mmdagent.jp/
121  122  <eps>                               SYNTH_START|mei|mei_voice_normal|ＭＭＤＡｇｅｎｔの、ホームページを表示します。
122    2  SYNTH_EVENT_STOP|mei                <eps>

# 0131-0140 Screen

1    131  RECOG_EVENT_STOP|フルスクリーン     KEY_POST|MMDAgent|F|OFF
131  132  <eps>                               SYNTH_START|mei|mei_voice_normal|スクリーンの設定を、変更しました。
132    2  SYNTH_EVENT_STOP|mei                <eps>

# 0141-0200 Positive comments

1    141   RECOG_EVENT_STOP|ヒノ,さん          VALUE_EVAL|random|LE|50
1    141   RECOG_EVENT_STOP|ヒノ               VALUE_EVAL|random|LE|50
1    141   RECOG_EVENT_STOP|ねえ               VALUE_EVAL|random|LE|50
1    141   RECOG_EVENT_STOP|ねえねえ           VALUE_EVAL|random|LE|50
141  142   VALUE_EVENT_EVAL|random|LE|50|TRUE  SYNTH_START|mei|mei_voice_normal|どうしましたか。
141  142   VALUE_EVENT_EVAL|random|LE|50|FALSE SYNTH_START|mei|mei_voice_normal|お困りですか。
142  143   SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|自己紹介、道案内、研究室紹介などができますよ。
143  144   SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_happy|いつでも、話しかけてくださいね。
144  2     SYNTH_EVENT_STOP|mei					 <eps>




### 0200-0400 道案内 ###

# 0200-0210 地図の表示

1    200  KEY|4                                SYNTH_START|mei|mei_voice_normal|地図を表示します。
1    200  RECOG_EVENT_STOP|道,案内             SYNTH_START|mei|mei_voice_normal|地図を表示します。
1    200  RECOG_EVENT_STOP|道案内              SYNTH_START|mei|mei_voice_normal|地図を表示します。
200  201  <eps>                                MOTION_CHANGE|choices|choice_guide|Image\choices\guide.vmd
201  202  SYNTH_EVENT_STOP|mei                 ROTATE_START|mei|0,-90,0|GLOBAL|60
202  203  ROTATE_EVENT_STOP|mei                MOTION_ADD|mei|walk|Motion\mei_walk\mei_walk_fast.vmd|FULL|ONCE|ON|ON
203  204  <eps>                                MOVE_START|mei|-18,0,-14|GLOBAL|6
204  205  MOVE_EVENT_STOP|mei                  MOTION_DELETE|mei|walk
205  206  <eps>                                ROTATE_START|mei|0,0,0|GLOBAL|60
206  207  ROTATE_EVENT_STOP|mei                MOTION_ADD|mei|wait|Motion\mei_wait\mei_wait.vmd|PART|ONCE
207  208  <eps>                                MAP_ADD|5,12,-6
208  209  <eps>                                SYNTH_START|mei|mei_voice_normal|どこまで案内しましょう。
209  210  <eps>                                MOTION_ADD|mei|point|Motion\mei_point\mei_point_left_buttom.vmd|PART|ONCE

# 210が正門から場所を指定すると各地点へ案内する状態
# 道案内後の状態は380

# 0210 - 0240 2号館の案内

210  211  KEY|2                                SYNTH_START|mei|mei_voice_normal|。
210  211  RECOG_EVENT_STOP|二,号館             SYNTH_START|mei|mei_voice_normal|。
210  211  RECOG_EVENT_STOP|大講義室            SYNTH_START|mei|mei_voice_normal|大講義室は二号館の二階にあります。
210  211  RECOG_EVENT_STOP|計算機,センター     SYNTH_START|mei|mei_voice_normal|計算機センターは二号館の二階にあります。
210  211  RECOG_EVENT_STOP|山口                SYNTH_START|mei|mei_voice_normal|山口研究室は二号館の六階にあります。
210  211  RECOG_EVENT_STOP|貴家                SYNTH_START|mei|mei_voice_normal|貴家研究室は二号館の六階にあります。
210  211  RECOG_EVENT_STOP|西川                SYNTH_START|mei|mei_voice_normal|西川研究室は二号館の六階にあります。
210  211  RECOG_EVENT_STOP|小町                SYNTH_START|mei|mei_voice_normal|小町研究室は二号館の六階にあります。
210  211  RECOG_EVENT_STOP|石川                SYNTH_START|mei|mei_voice_normal|石川研究室は二号館の六階にあります。
210  211  RECOG_EVENT_STOP|福本                SYNTH_START|mei|mei_voice_normal|福本研究室は二号館の六階にあります。
210  211  RECOG_EVENT_STOP|キャル室            SYNTH_START|mei|mei_voice_normal|キャル室は二号館の五階にあります。

211  212  <eps>                                MOTION_CHANGE|mei|base|Motion\mei_guide\mei_guide_normal.vmd
212  213  SYNTH_EVENT_STOP|mei                 SYNTH_START|mei|mei_voice_normal|二号館は、正門から道なりにまっすぐ進むとつきます。
213  214  SYNTH_EVENT_STOP|mei                 SYNTH_START|mei|mei_voice_normal|キャンパスマップでは、こちらになります。
214  215  SYNTH_EVENT_STOP|mei                 GUIDE_START|2
215  216  <eps>                                MOTION_CHANGE|mei|base|Motion\mei_guide\mei_guide_happy.vmd
216  217  <eps>                                SYNTH_START|mei|mei_voice_normal|入って左手にエレベーターがございます。ご利用ください。
217  218  <eps>                                MOTION_CHANGE|mei|base|Motion\mei_wait\mei_wait.vmd
218  380  GUIDE_EVENT_GOAL|2                   <eps>

# 0241-0260 道案内-1号館

210  241  KEY|1                                SYNTH_START|mei|mei_voice_normal|。
210  241  RECOG_EVENT_STOP|一,号館             SYNTH_START|mei|mei_voice_normal|。
210  241  RECOG_EVENT_STOP|学生,課             SYNTH_START|mei|mei_voice_normal|学生課は一号館入ってすぐにあります。

241  242  SYNTH_EVENT_STOP|mei                 SYNTH_START|mei|mei_voice_normal|キャンパスマップでは、こちらになります。
242  243  <eps>                                GUIDE_START|1

243  244  SYNTH_EVENT_STOP|mei                 SYNTH_START|mei|mei_voice_normal|一号館は、正門から道なりにまっすぐ進み、二号館を通過するとつきます。
244  245  SYNTH_EVENT_STOP|mei                 SYNTH_START|mei|mei_voice_normal|学生課に御用のかたはこちらにいらしてください。
245  246  <eps>                                MOTION_CHANGE|mei|base|Motion\mei_wait\mei_wait.vmd
246  380  GUIDE_EVENT_GOAL|1                   <eps>

# 0261-0280 道案内-4号館

210  261  KEY|4                                SYNTH_START|mei|mei_voice_normal|。
210  261  RECOG_EVENT_STOP|四,号館             SYNTH_START|mei|mei_voice_normal|。
261  262  SYNTH_EVENT_STOP|mei                 SYNTH_START|mei|mei_voice_normal|キャンパスマップでは、こちらになります。
262  263  <eps>                                GUIDE_START|4
263  380  GUIDE_EVENT_GOAL|4                   <eps>

# 0281-0300 道案内-3号館

210  281  KEY|3                                SYNTH_START|mei|mei_voice_normal|。
210  281  RECOG_EVENT_STOP|三,号館             SYNTH_START|mei|mei_voice_normal|。
281  282  SYNTH_EVENT_STOP|mei                 SYNTH_START|mei|mei_voice_normal|キャンパスマップでは、こちらになります。
282  283  <eps>                                GUIDE_START|3
283  380  GUIDE_EVENT_GOAL|3                   <eps>

# 0301-0320 道案内-5号館

210  301  KEY|5                                SYNTH_START|mei|mei_voice_normal|。
210  301  RECOG_EVENT_STOP|五,号館             SYNTH_START|mei|mei_voice_normal|。
301  302  SYNTH_EVENT_STOP|mei                 SYNTH_START|mei|mei_voice_normal|キャンパスマップでは、こちらになります。
302  303  <eps>                                GUIDE_START|5
303  380  GUIDE_EVENT_GOAL|5                   <eps>

# 0321-0340 道案内-学生会館

210  321  KEY|6                                SYNTH_START|mei|mei_voice_normal|。
210  321  RECOG_EVENT_STOP|学生                SYNTH_START|mei|mei_voice_normal|。
321  322  SYNTH_EVENT_STOP|mei                 SYNTH_START|mei|mei_voice_normal|キャンパスマップでは、こちらになります。
322  323  <eps>                                GUIDE_START|uh
323  380  GUIDE_EVENT_GOAL|uh                  <eps>

# 0341-0360 道案内-体育館

210  341  KEY|7                                SYNTH_START|mei|mei_voice_normal|。
210  341  RECOG_EVENT_STOP|体育                SYNTH_START|mei|mei_voice_normal|。
341  342  SYNTH_EVENT_STOP|mei                 SYNTH_START|mei|mei_voice_normal|キャンパスマップでは、こちらになります。
342  343  <eps>                                GUIDE_START|gym
343  380  GUIDE_EVENT_GOAL|gym                 <eps>

# 0380 - 0390 道案内の継続 

380  381  <eps>                                SYNTH_START|mei|mei_voice_normal|道案内を続けますか?
381  382  SYNTH_EVENT_STOP|mei                 <eps>

382  383  KEY|1                                SYNTH_START|mei|mei_voice_normal|それでは道案内を続けます。
382  383  RECOG_EVENT_STOP|はい                SYNTH_START|mei|mei_voice_normal|それでは道案内を続けます。
383  210  SYNTH_EVENT_STOP|mei                 <eps>

382  390  KEY|2                                <eps>
382  390  RECOG_EVENT_STOP|終了              <eps>

# 0390 - 0400 道案内の終了

390  391  <eps>                                SYNTH_START|mei|mei_voice_normal|道案内を終了します。
391  392  <eps>                                GUIDE_STOP
392  393  <eps>                                ROTATE_START|mei|0,90,0|GLOBAL|60
393  394  ROTATE_EVENT_STOP|mei                MOTION_ADD|mei|walk|Motion\mei_walk\mei_walk_fast.vmd|FULL|ONCE|ON|ON
394  395  <eps>                                MOVE_START|mei|-8,0,-14|GLOBAL|6
395  396  MOVE_EVENT_STOP|mei                  MOTION_DELETE|mei|walk
396  397  <eps>                                ROTATE_START|mei|0,0,0|GLOBAL|60
397  398  ROTATE_EVENT_STOP|mei                MOTION_ADD|mei|wait|Motion\mei_wait\mei_wait.vmd|PART|ONCE
398    2  <eps>                                MOTION_CHANGE|choices|choice_guide|Image\choices\normal.vmd



### 401 - 600 研究室紹介 ###

1    401  KEY|3                                SYNTH_START|mei|mei_voice_normal|どの研究室を紹介しましょう。
1    401  RECOG_EVENT_STOP|研究,室             SYNTH_START|mei|mei_voice_normal|どの研究室を紹介しましょう。
1    401  RECOG_EVENT_STOP|研究,室,紹介        SYNTH_START|mei|mei_voice_normal|どの研究室を紹介しましょう。
401  402  <eps>                                MOTION_CHANGE|choices|choice_guide|Image\choices\lab.vmd
402  403  <eps>                                MOTION_CHANGE|professor|professor_intro|Image\professor\all.vmd
403  410  <eps>                                MOVE_START|professor|8.5,0.5,0.5|GLOBAL|20

# 410が各研究室の案内に分岐させる状態

# 福本研 411-420

410  411  KEY|1                                MOTION_CHANGE|professor|professor_intro|Image\professor\fukumoto.vmd
410  411  RECOG_EVENT_STOP|福本                MOTION_CHANGE|professor|professor_intro|Image\professor\fukumoto.vmd
411  412  <eps>                                SYNTH_START|mei|mei_voice_normal|耐故障性の高い、コンピュータシステムや、ネットワークシステムの実現手法について研究しています。
412  540  SYNTH_EVENT_STOP|mei                 <eps>


# 大久保研 421-430

410  421  RECOG_EVENT_STOP|大久保              MOTION_CHANGE|professor|professor_intro|Image\professor\okubo.vmd
421  422  <eps>                                SYNTH_START|mei|mei_voice_normal|信号解析、数値シミュレーション、電磁界計測に関する研究をおこなっています。
422  540  SYNTH_EVENT_STOP|mei                 <eps>

# 石川研 431-440

410  431  RECOG_EVENT_STOP|石川                MOTION_CHANGE|professor|professor_intro|Image\professor\ishikawa.vmd
431  432  <eps>                                SYNTH_START|mei|mei_voice_normal|ビッグデータを効率的に解析することで新しい価値を発見する技術を研究しています。
432  540  SYNTH_EVENT_STOP|mei                 <eps>

# 小町研 441-450

410  441  RECOG_EVENT_STOP|小町                MOTION_CHANGE|professor|professor_intro|Image\professor\komachi.vmd
441  442  <eps>                                SYNTH_START|mei|mei_voice_normal|人間の言葉を解析し、言語学習の作文の誤り訂正、翻訳などの多言語コミュニケーション支援につなげる研究をしています。
442  540  SYNTH_EVENT_STOP|mei                 <eps>

# 山口研 451-460

410  451  RECOG_EVENT_STOP|山口                MOTION_CHANGE|professor|professor_intro|Image\professor\yamaguchi.vmd
451  452  <eps>                                SYNTH_START|mei|mei_voice_normal|ジェスチャー理解をする意図の認識機構、人間と意図を共有しコミュニケートするオントロジー機構、さらに、コミュニケーションが空間全体に広がる知能空間を研究しています。
452  540  SYNTH_EVENT_STOP|mei                 <eps>
# 阿保研 461-470

410  461  RECOG_EVENT_STOP|阿保                MOTION_CHANGE|professor|professor_intro|Image\professor\abo.vmd
461  462  <eps>                                SYNTH_START|mei|mei_voice_normal|電波や光を使って、遠く離れた場所の環境情報を測り、その情報を伝送するシステムの研究をしています。
462  540  SYNTH_EVENT_STOP|mei                 <eps>

# 高間研 471-480

410  471  RECOG_EVENT_STOP|高間                MOTION_CHANGE|professor|professor_intro|Image\professor\takama.vmd
471  472  <eps>                                SYNTH_START|mei|mei_voice_normal|セマンティックウェブ技術を応用した情報検索システムや、情報可視化技術を用いた知的インタフェース、テキストや画像情報の効率的な収集手法などについて研究をおこなっています。
472  540  SYNTH_EVENT_STOP|mei                 <eps>

# 貴家研　481-490

410  481  RECOG_EVENT_STOP|貴家                MOTION_CHANGE|professor|professor_intro|Image\professor\kiya.vmd
481  482  <eps>                                SYNTH_START|mei|mei_voice_normal|情報圧縮、映像処理、コンテンツ配信、セキュリティに関する研究をしています。
482  540  SYNTH_EVENT_STOP|mei                 <eps>

# 田川研 491-500

410  491  RECOG_EVENT_STOP|田川                MOTION_CHANGE|professor|professor_intro|Image\professor\tagawa.vmd
491  492  <eps>                                SYNTH_START|mei|mei_voice_normal|計測データを解析して、所望の情報を抽出するための研究をしています。
492  540  SYNTH_EVENT_STOP|mei                 <eps>

# 柴田研 501-510

410  501  RECOG_EVENT_STOP|柴田                MOTION_CHANGE|professor|professor_intro|Image\professor\shibata.vmd
501  502  <eps>                                SYNTH_START|mei|mei_voice_normal|地球・都市環境問題に役立つリモートセンシングシステムの研究をおこなっています。
502  540  SYNTH_EVENT_STOP|mei                 <eps>

# 三浦研 511-520

410  511  RECOG_EVENT_STOP|三浦                MOTION_CHANGE|professor|professor_intro|Image\professor\miura.vmd
511  512  <eps>                                SYNTH_START|mei|mei_voice_normal|高信頼性のあるVLSIの設計手法、その動作確認について研究しています。
512  540  SYNTH_EVENT_STOP|mei                 <eps>

# 西川研 521-530

410  521  RECOG_EVENT_STOP|西川                MOTION_CHANGE|professor|professor_intro|Image\professor\nishikawa.vmd
521  522  <eps>                                SYNTH_START|mei|mei_voice_normal|動画像に代表されるメディア情報を、インターネットを用いて効率よく配信する事を研究しています。
522  540  SYNTH_EVENT_STOP|mei                 <eps>

# 研究室紹介の継続 #540 - 600

540  541  <eps>                                MOTION_CHANGE|professor|professor_intro|Image\professor\all.vmd
541  542  <eps>                                MOVE_START|professor|8.5,0.5,0.5|GLOBAL|20
542  543  <eps>                                SYNTH_START|mei|mei_voice_normal|他の研究室の説明を聞きたいかたはこのまま、先生の名前をおっしゃってください。
543  550  SYNTH_EVENT_STOP|mei                 SYNTH_START|mei|mei_voice_normal|研究室紹介を終了する場合は、終了、とおっしゃってください


550  411  RECOG_EVENT_STOP|福本                MOTION_CHANGE|professor|professor_intro|Image\professor\fukumoto.vmd
550  421  RECOG_EVENT_STOP|大久保              MOTION_CHANGE|professor|professor_intro|Image\professor\okubo.vmd
550  431  RECOG_EVENT_STOP|石川                MOTION_CHANGE|professor|professor_intro|Image\professor\ishikawa.vmd
550  441  RECOG_EVENT_STOP|小町                MOTION_CHANGE|professor|professor_intro|Image\professor\komachi.vmd
550  451  RECOG_EVENT_STOP|山口                MOTION_CHANGE|professor|professor_intro|Image\professor\yamaguchi.vmd
550  461  RECOG_EVENT_STOP|阿保                MOTION_CHANGE|professor|professor_intro|Image\professor\abo.vmd
550  471  RECOG_EVENT_STOP|高間                MOTION_CHANGE|professor|professor_intro|Image\professor\takama.vmd
550  481  RECOG_EVENT_STOP|貴家                MOTION_CHANGE|professor|professor_intro|Image\professor\kiya.vmd
550  491  RECOG_EVENT_STOP|田川                MOTION_CHANGE|professor|professor_intro|Image\professor\tagawa.vmd
550  501  RECOG_EVENT_STOP|柴田                MOTION_CHANGE|professor|professor_intro|Image\professor\shibata.vmd
550  511  RECOG_EVENT_STOP|三浦                MOTION_CHANGE|professor|professor_intro|Image\professor\miura.vmd
550  521  RECOG_EVENT_STOP|西川                MOTION_CHANGE|professor|professor_intro|Image\professor\nishikawa.vmd

550  451  KEY|2                                MOTION_CHANGE|professor|professor_intro|Image\professor\yamaguchi.vmd

550  551  KEY|1                                SYNTH_START|mei|mei_voice_normal|研究室紹介を終了します
550  551  RECOG_EVENT_STOP|終了                SYNTH_START|mei|mei_voice_normal|研究室紹介を終了します
551  552  SYNTH_EVENT_STOP|mei                 MOTION_CHANGE|professor|professor_intro|Image\professor\start.vmd
552  553  <eps>                                MOTION_CHANGE|choices|choice_guide|Image\choices\normal.vmd
553    2  <eps>                                MOVE_START|professor|0,-10,5|GLOBAL|20



### アンケート機能  5001 - 6000###

   1  5001  RECOG_EVENT_STOP|アンケート        SYNTH_START|mei|mei_voice_normal|どのアンケートにお答えしますか？
5001  5100  <eps>                              MODEL_ADD|question_list|Image\question_list\panel_survey.pmd|5,18,-10|0,0,0|ON

# 性別は？

5100  5101  RECOG_EVENT_STOP|性別              MODEL_DELETE|question_list
5101  5102  <eps>                              Q_ASK|sex
5102  5103  <eps>                              MODEL_ADD|sex|Image\sex\panel_survey.pmd|5,18,-10|0,0,0|ON
5103  5104  RECOG_EVENT_STOP|男                Q_COUNT|sex|man
5103  5104  RECOG_EVENT_STOP|女                Q_COUNT|sex|woman
5104  5105  <eps>                              SYNTH_START|mei|mei_voice_normal|受け付けました。
5105  5900  <eps>                              MODEL_DELETE|sex

#　年齢は？

5100  5111  RECOG_EVENT_STOP|年齢              MODEL_DELETE|question_list
5111  5112  <eps>                              Q_ASK|age
5112  5113  <eps>                              MODEL_ADD|age|Image\age\panel_survey.pmd|5,18,-10|0,0,0|ON
5113  5114  RECOG_EVENT_STOP|一                Q_COUNT|age|10s
5113  5114  RECOG_EVENT_STOP|二                Q_COUNT|age|20s
5113  5114  RECOG_EVENT_STOP|三                Q_COUNT|age|30s
5113  5114  RECOG_EVENT_STOP|四                Q_COUNT|age|40s
5113  5114  RECOG_EVENT_STOP|五                Q_COUNT|age|50s
5113  5114  RECOG_EVENT_STOP|六                Q_COUNT|age|60s
5113  5114  RECOG_EVENT_STOP|七                Q_COUNT|age|70over
5114  5115  <eps>                              SYNTH_START|mei|mei_voice_normal|受け付けました。
5115  5900  <eps>                              MODEL_DELETE|age

# コースは？

5100  5121  RECOG_EVENT_STOP|コース            MODEL_DELETE|question_list
5121  5122  <eps>                              Q_ASK|course
5122  5123  <eps>                              MODEL_ADD|course|Image\course\panel_survey.pmd|5,18,-10|0,0,0|ON
5123  5124  RECOG_EVENT_STOP|知能              Q_COUNT|course|IMS
5123  5124  RECOG_EVENT_STOP|情報通信          Q_COUNT|course|ICS
5123  5124  RECOG_EVENT_STOP|航空              Q_COUNT|course|AE
5123  5124  RECOG_EVENT_STOP|経営              Q_COUNT|course|MSE
5123  5124  RECOG_EVENT_STOP|インダス          Q_COUNT|course|IA
5124  5125  <eps>                              SYNTH_START|mei|mei_voice_normal|受け付けました。
5125  5900 <eps>                              MODEL_DELETE|course

# 職業は?

5100  5131  RECOG_EVENT_STOP|職業              MODEL_DELETE|question_list
5131  5132  <eps>                              Q_ASK|job
5132  5133  <eps>                              MODEL_ADD|job|Image\job\panel_survey.pmd|5,18,-10|0,0,0|ON
5133  5134  RECOG_EVENT_STOP|学生              Q_COUNT|job|student
5133  5134  RECOG_EVENT_STOP|教授              Q_COUNT|job|professor
5133  5134  RECOG_EVENT_STOP|その他            Q_COUNT|job|other
5134  5135  <eps>                              SYNTH_START|mei|mei_voice_normal|受け付けました。
5135  5900  <eps>                              MODEL_DELETE|job

# キノコ、タケノコ戦争

5100  5141  RECOG_EVENT_STOP|戦争              MODEL_DELETE|question_list
5141  5142  <eps>                              Q_ASK|war
5142  5143  <eps>                              MODEL_ADD|war|Image\war\panel_survey.pmd|5,18,-10|0,0,0|ON
5143  5144  RECOG_EVENT_STOP|キノコ            Q_COUNT|war|kinoko
5143  5144  RECOG_EVENT_STOP|たけのこ          Q_COUNT|war|takenoko
5144  5145  <eps>                              SYNTH_START|mei|mei_voice_normal|受け付けました。
5145  5900  <eps>                              MODEL_DELETE|war

# インドア？アウトドア？

5100  5151  RECOG_EVENT_STOP|趣味              MODEL_DELETE|question_list
5151  5152  <eps>                              Q_ASK|hoby
5152  5153  <eps>                              MODEL_ADD|hoby|Image\hoby\panel_survey.pmd|5,18,-10|0,0,0|ON
5153  5154  RECOG_EVENT_STOP|インドア          Q_COUNT|hoby|indoor
5153  5154  RECOG_EVENT_STOP|アウトドア        Q_COUNT|hoby|outdoor
5154  5155  <eps>                              SYNTH_START|mei|mei_voice_normal|受け付けました。
5155  5900  <eps>                              MODEL_DELETE|hoby

# 集計結果表示

5900  5901  SYNTH_EVENT_STOP|mei               SYNTH_START|mei|mei_voice_normal|こちらが現在の解答状況です。
5901  5902  <eps>                              MODEL_ADD|survey|Image\survey\panel_survey.pmd|5,18,-10|0,0,0|ON
5902  5903  <eps>                              TIMER_START|waittime|10
5903     1  TIMER_EVENT_STOP|waittime          MODEL_DELETE|survey


# 手を振り返す

1  1   CAMERA_EVENT_HANDSHAKE|right_hand         MOTION_ADD|mei|shake|Motion\mei_bye\mei_bye.vmd|FULL|ONCE|OFF|OFF
1  1   CAMERA_EVENT_HANDSHAKE|left_hand          MOTION_ADD|mei|shake|Motion\mei_bye\mei_bye.vmd|FULL|ONCE|OFF|OFF