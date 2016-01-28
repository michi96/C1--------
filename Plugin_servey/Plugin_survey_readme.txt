fstサンプル

1    200       RECOG_EVENT_STOP|アンケート         SYNTH_START|mei|mei_voice_normal|どのアンケートにお答えしますか？
200  210       <eps>                               <eps>

210  220       RECOG_EVENT_STOP|性別               Q_ASK|sex
220  221       <eps>                               <eps>

221  222       RECOG_EVENT_STOP|男                 Q_COUNT|sex|man
222  228       Q_EVENT_COUNT|sex|man                SYNTH_START|mei|mei_voice_normal|受け付けました。
221  223       RECOG_EVENT_STOP|女                 Q_COUNT|sex|woman
223  228       Q_EVENT_COUNT|sex|woman                SYNTH_START|mei|mei_voice_normal|受け付けました。

228  229       <eps>                               SYNTH_START|mei|mei_voice_normal|こちらが現在の解答状況です。
229  300       <eps>                               <eps>

300  1         <eps>                               <eps>


220 210にアンケートを選ぶパネル
220 221に選択肢を選ぶパネル
229 300に結果のパネルを張れたらいいかな？


実行コマンド
Q_ASK|(name)                 メイちゃんが(name)の質問をする
Q_COUNT(name)|(ans)          (name)に対する回答(ans)の数を+1する

イベントコマンド
Q_EVENT_COUNT|(name)|(ans)   (name)に対する回答(ans)の数を+1したとき


PLUGINの仕様
MMDagent.exeと同じフォルダに質問事項が入ったテキストファイルquestion_list.txtを入れておく
MMDagentを終了したときにテキストファイル(question_list.txt)が更新される。
次回、MMDagentを開始したときは更新後のファイルが読み込まれるからデータはMMDagentを終了しても引き継げる

MMDagent.exeと同じフォルダにImageフォルダを作りそのなかにさらにsurveyフォルダを用意しておく
そこに画像.pngが作成されるのでパネルに張り付けて使用する
画像.pngは回答するたびに作成される
現在は複数の解答を同時に表示することは不可。また結果だけ表示することも不可。


question_list.txtの仕様
(name)|(質問の言葉)|(回答の数)|(回答1の名前),(回答1の値)|(回答2の名前),(回答2の値)|......|(回答nの名前),(回答nの値) ※nは10以下回答の名前には英語のみ使用可能

question_list.txtの例
sex|あなたの性別は何ですか？|2|man,2|woman,0