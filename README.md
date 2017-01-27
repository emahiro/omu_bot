# omu_bot
LINE Messaging APIで作成したオウム返しのBot

公式サンプルと同じ
https://github.com/line/line-bot-sdk-ruby  

sinatra + herokuで動きます。

whitelistは設定しなくても動作しました。

# 手順

LINE Business Center で アカウント登録した後 https://developers.line.me/ でMessagingAPI をチャンネル（LINE@）と紐付ける。  
その後、channelのページにあるchannel_secretとchannel_tokenをapp.rbに記載してデプロイすると動作するはず。
