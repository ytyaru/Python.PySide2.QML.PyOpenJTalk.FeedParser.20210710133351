[en](./README.md)

# PySide2.QML.PyOpenJTalk.FeedParser

　QMLで画面をつくりPySide2で実装してFeedParserでニュースを取得しOpenJTalkで読み上げる。

# デモ

![img](https://github.com/ytyaru/Python.PySide2.QML.PyOpenJTalk.FeedParser.20210710133351/blob/master/doc/0.png?raw=true)

# 開発環境

* <time datetime="2021-07-10T13:33:47+0900">2021-07-10</time>
* [Raspbierry Pi](https://ja.wikipedia.org/wiki/Raspberry_Pi) 4 Model B Rev 1.2
* [Raspberry Pi OS](https://ja.wikipedia.org/wiki/Raspbian) buster 10.0 2020-08-20 <small>[setup](http://ytyaru.hatenablog.com/entry/2020/10/06/111111)</small>
* bash 5.0.3(1)-release
* Qt 5.11.3
* Python 3.7.3
* PySide2

```sh
$ uname -a
Linux raspberrypi 5.4.83-v7l+ #1379 SMP Mon Dec 14 13:11:54 GMT 2020 armv7l GNU/Linux
```

# インストール

```sh
git clone https://github.com/ytyaru/Python.PySide2.QML.PyOpenJTalk.FeedParser.20210710133351
cd Python.PySide2.QML.PyOpenJTalk.FeedParser.20210710133351/src
./setup.sh
```

# 使い方

```sh
./run.sh
```

# 注意

* 発話中フリーズしてしまう
    * マルチスレッドにする必要がある

# 著者

　ytyaru

* [![github](http://www.google.com/s2/favicons?domain=github.com)](https://github.com/ytyaru "github")
* [![hatena](http://www.google.com/s2/favicons?domain=www.hatena.ne.jp)](http://ytyaru.hatenablog.com/ytyaru "hatena")
* [![mastodon](http://www.google.com/s2/favicons?domain=mstdn.jp)](https://mstdn.jp/web/accounts/233143 "mastdon")

# ライセンス

　このソフトウェアはCC0ライセンスである。

[![CC0](http://i.creativecommons.org/p/zero/1.0/88x31.png "CC0")](http://creativecommons.org/publicdomain/zero/1.0/deed.ja)

