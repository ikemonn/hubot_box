hubot_box
======================
Vagrant上でHUBOTを気軽に試すために作った。  
HipChatとの連携も可。

環境
------
CentOS6.5  
Redis  
redis-commander  
Node.js  
CoffeeScript  
Apache  
HUBOT  
hubot-hipchat  


使い方
------
### HUBOTを試す
```
$ git clone https://github.com/ikemonn/hubot_box.git
$ cd hubot_box
$ vagrant box add centos65 http://www.lyricalsoftware.com/downloads/centos65.box
$ vagrant init centos65
$ cp -f ./conf/Vagrantfile ./Vagrantfile
$ vagrant up
$ vagrant ssh
$ cd /vagrant
$ hubot --create mybot
$ cd mybot
$ npm install
$ hubot
Hubot> hubot ping
Hubot> PONG # PONGが返ってきたらOK
```

### HipChat連携を試す

```
# 上記作業終了後
$ vi bin/hubot
--------------
#!/bin/sh

npm install
export PATH="node_modules/.bin:node_modules/hubot/node_modules/.bin:$PATH"
# Admin権限のあるAPIトークン
export HUBOT_HIPCHAT_TOKEN="Admin API Token"
# hubotユーザのJID
export HUBOT_HIPCHAT_JID="hubot JID"
# hubotユーザのパスワード
export HUBOT_HIPCHAT_PASSWORD="hubot password"
# ルームID
export HUBOT_HIPCHAT_ROOMS="your room"
# hubotはデフォルトで8080を使うが、既に使われている場合は適当に設定
# export PORT=9999

exec node_modules/.bin/hubot "$@"
--------------
$ npm install  hubot-hipchat --save
$ bin/hubot -a hipchat
```

その他
------
Apacheとredis-commanderをいれているので、Redisの中身を覗きたいときは
使用すると便利。
