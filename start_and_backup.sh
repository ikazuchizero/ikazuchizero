```
#!/bin/bash

sudo -u minecraft screen -S mc-server -X stuff "say =======================================\015"
sleep 1
sudo -u minecraft screen -S mc-server -X stuff "say サーバーは10分後に再起動します\015"
sleep 1
sudo -u minecraft screen -S mc-server -X stuff "say =======================================\015"

sleep 300

sudo -u minecraft screen -S mc-server -X stuff "say =======================================\015"
sleep 1
sudo -u minecraft screen -S mc-server -X stuff "say サーバーは5分後に再起動します\015"
sleep 1
sudo -u minecraft screen -S mc-server -X stuff "say =======================================\015"

sleep 180

sudo -u minecraft screen -S mc-server -X stuff "say =======================================\015"
sleep 1
sudo -u minecraft screen -S mc-server -X stuff "say サーバーは2分後に再起動します\015"
sleep 1
sudo -u minecraft screen -S mc-server -X stuff "say =======================================\015"

sleep 60

sudo -u minecraft screen -S mc-server -X stuff "say =======================================\015"
sleep 1
sudo -u minecraft screen -S mc-server -X stuff "say サーバーは1分後に再起動します\015"
sleep 1
sudo -u minecraft screen -S mc-server -X stuff "say =======================================\015"

sleep 30

sudo -u minecraft screen -S mc-server -X stuff "say =======================================\015"
sleep 1
sudo -u minecraft screen -S mc-server -X stuff "say サーバーは30秒後に再起動します\015"
sleep 1
sudo -u minecraft screen -S mc-server -X stuff "say =======================================\015"

sleep 30

sudo systemctl stop mc-server

# サーバーパス
MC_PATH='/var/mc-server'
# バックアップ収納パス
BK_PATH='/var/mc-backups'
# バックアップ時刻形式
BK_TIME=`date +%Y%m%d-%H%M%S`
# バックアップファイル名
BK_NAME="${BK_PATH}/mc_backup_${BK_TIME}.tar.gz"
# バックアップ保存世代数
BK_GEN="3"
TAIL_GEN="+4"

tar cfvz $BK_NAME $MC_PATH

sleep 3

# 過去世代の削除
## ディレクトリの存在チェック
if [ -d $BK_PATH ]; then
  # バックアップディレクトリが存在している場合、
  # 格納されているファイル一覧を表示
  ls -lrth $BK_PATH
else
  echo "The backup directory (${BK_PATH}) doesn't exist !"
  eval $IS_TIME
fi
# バックアップファイルをローカルのバックアップフォルダで世代管理
TGT_FILE="${BK_PATH}/mc_backup_????????-??????.tar.gz"
CHK_GEN=$(ls -1 ${TGT_FILE}|wc -l)
# 削除対象ファイルリスト
DEL_LIST=$(ls -1 -t ${TGT_FILE}|tail -n ${TAIL_GEN})
## ファイル削除要否判定
if [[ ${CHK_GEN} -gt $BK_GEN ]]; then
    # バックアップファイル数が保管世代数より多い場合、
    # 最新の保存数のみ残しそれ以外を削除する
    sudo rm -f ${BK_PATH}/${DEL_LIST}
    eval $IS_TIME
else
    echo "There is no old backup files to delete"
    eval $IS_TIME
fi

sleep 3

sudo systemctl start mc-server```