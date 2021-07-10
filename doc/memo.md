# WebView

　[WebView][]参照。

[WebView]:https://doc.qt.io/archives/qt-5.5/qml-qtwebkit-webview.html#loadHtml-method

　なお、ほかにもバージョンによって類似情報が多数あり、どれを見たらいいかわかりにくい。

* 自分の環境にインストールできる版はどれか
* その版が使えるウェブブラウザAPIはどれか
* そのAPIドキュメントはどれか
* その使い方は？ コードの書き方は？

　[WebView-4.8][], [WebEngine][]は使えない。紛らわしい。とくに[WebView-4.8][]の`html`, `setHtml()`を使おうとしたらエラーになったときは何でエラーになるのかわからなかった。

　Qt4.8までは[WebView-4.8][]を使うが、Qt5以降では[WebView][]を使うのだろう。そしてQt5.13以降は[WebEngine][]を使うのだと思われる。

[WebView-4.8]:https://doc.qt.io/archives/qt-4.8/qml-webview.html
[WebEngine]:https://doc.qt.io/qt-5/qml-qtwebengine-webengineview.html

Qt|WebBrowser
--|----------
4.8|[WebView-4.8][]
5.5|[WebView][]
5.13|[WebEngine][]

