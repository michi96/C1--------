fst�T���v��

1    200       RECOG_EVENT_STOP|�A���P�[�g         SYNTH_START|mei|mei_voice_normal|�ǂ̃A���P�[�g�ɂ��������܂����H
200  210       <eps>                               <eps>

210  220       RECOG_EVENT_STOP|����               Q_ASK|sex
220  221       <eps>                               <eps>

221  222       RECOG_EVENT_STOP|�j                 Q_COUNT|sex|man
222  228       Q_EVENT_COUNT|sex|man                SYNTH_START|mei|mei_voice_normal|�󂯕t���܂����B
221  223       RECOG_EVENT_STOP|��                 Q_COUNT|sex|woman
223  228       Q_EVENT_COUNT|sex|woman                SYNTH_START|mei|mei_voice_normal|�󂯕t���܂����B

228  229       <eps>                               SYNTH_START|mei|mei_voice_normal|�����炪���݂̉𓚏󋵂ł��B
229  300       <eps>                               <eps>

300  1         <eps>                               <eps>


220 210�ɃA���P�[�g��I�ԃp�l��
220 221�ɑI������I�ԃp�l��
229 300�Ɍ��ʂ̃p�l���𒣂ꂽ�炢�����ȁH


���s�R�}���h
Q_ASK|(name)                 ���C�����(name)�̎��������
Q_COUNT(name)|(ans)          (name)�ɑ΂����(ans)�̐���+1����

�C�x���g�R�}���h
Q_EVENT_COUNT|(name)|(ans)   (name)�ɑ΂����(ans)�̐���+1�����Ƃ�


PLUGIN�̎d�l
MMDagent.exe�Ɠ����t�H���_�Ɏ��⎖�����������e�L�X�g�t�@�C��question_list.txt�����Ă���
MMDagent���I�������Ƃ��Ƀe�L�X�g�t�@�C��(question_list.txt)���X�V�����B
����AMMDagent���J�n�����Ƃ��͍X�V��̃t�@�C�����ǂݍ��܂�邩��f�[�^��MMDagent���I�����Ă������p����

MMDagent.exe�Ɠ����t�H���_��Image�t�H���_����肻�̂Ȃ��ɂ����survey�t�H���_��p�ӂ��Ă���
�����ɉ摜.png���쐬�����̂Ńp�l���ɒ���t���Ďg�p����
�摜.png�͉񓚂��邽�тɍ쐬�����
���݂͕����̉𓚂𓯎��ɕ\�����邱�Ƃ͕s�B�܂����ʂ����\�����邱�Ƃ��s�B


question_list.txt�̎d�l
(name)|(����̌��t)|(�񓚂̐�)|(��1�̖��O),(��1�̒l)|(��2�̖��O),(��2�̒l)|......|(��n�̖��O),(��n�̒l) ��n��10�ȉ��񓚂̖��O�ɂ͉p��̂ݎg�p�\

question_list.txt�̗�
sex|���Ȃ��̐��ʂ͉��ł����H|2|man,2|woman,0