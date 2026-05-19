echo off
echo "※※※※※※※※※※※※※※※※※※※※※※※"
echo "※　請確認本批次檔使用'系統管理員'權限開啟　※"
echo "※※※※※※※※※※※※※※※※※※※※※※※"
pause
net stop w32time
echo "已停止運作: w32time 舊有排程程式... OK"
w32tm /unregister
echo "已解除註冊: w32time 舊有排程程式... OK"
w32tm /register
echo "開始新註冊: w32time 排程程式... OK"
w32tm /config /syncfromflags:manual /manualpeerlist:"time.stdtime.gov.tw"
echo "設定時間伺服器為: time.stdtime.gov.tw ... OK"
w32tm /config /reliable:yes
net start w32time
echo "註冊並設定自啟動: w32time 排程程式... OK"
w32tm /resync
echo "w32time 完成同步時間."

echo on
w32tm /query /configuration
echo "請確認 w32tm 排程程式狀態資訊. "
pause