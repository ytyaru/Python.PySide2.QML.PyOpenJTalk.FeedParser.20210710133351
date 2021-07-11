import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtWebKit 3.0

ApplicationWindow {
    id: mainWindow
    width: 600
    height: 200
    title: qsTr("Qt + PySide2 + PyOpenJTalk")
    visible: true
    locale: locale

    ColumnLayout {
        spacing: 0
        anchors.fill: parent
        Rectangle {
            color: "#FFCCDD"
            Layout.fillWidth: true
            Layout.preferredHeight: Math.max(16, parent.width / 40)
            TextInput {
                id: _talkText
                text: "発話したいテキストを入力してからEnterキーを押してください。"
                focus: true
                KeyNavigation.tab: _rssUrl
                font.pixelSize: Math.max(16, parent.width / 40)
                anchors.fill: parent
                onAccepted: Connect.talk(_talkText.text)
            }
        }
        Rectangle {
            color: "#DDCCFF"
            Layout.fillWidth: true
            Layout.preferredHeight: Math.max(16, parent.width / 80)
            TextInput {
                id: _rssUrl
                text: "https://news.yahoo.co.jp/rss/topics/top-picks.xml"
                focus: true
                KeyNavigation.tab: _talkText
                font.pixelSize: Math.max(16, parent.width / 80)
                anchors.fill: parent
                onAccepted: {
                    _webview.loadHtml(Connect.make_html(_rssUrl.text))
                }
            }
        }
        WebView {
            id: _webview
            Layout.fillWidth: true
            Layout.fillHeight: true
            onLoadingChanged: {
                if (loadRequest.status == WebView.LoadStartedStatus) {
                    console.log("Load start: " + loadRequest.url)
                } else if (loadRequest.status == WebView.LoadSucceededStatus) {
                    console.log("Load succeeded: " + loadRequest.url)
                    Connect.talk_news(_rssUrl.text)
                } else if (loadRequest.status == WebView.LoadFailedStatus) {
                    console.log("Load failed: " + loadRequest.url + ". Error code: " + loadRequest.errorString)   
                }
            }
            Keys.onPressed: {
                switch(event.key){
                case Qt.Key_Home:
                    _webview.goBack()
                    console.debug("Key=" + event.key + ",text=[Home],accepted=" + event.accepted);
                    break;
                case Qt.Key_End:
                    _webview.goFoword()
                    console.debug("Key=" + event.key + ",text=[End],accepted=" + event.accepted);
                    break;
                case Qt.Key_Space:
                    _webview.goFoword()
                    console.debug("Key=" + event.key + ",text=[Space],accepted=" + event.accepted);
                    break;
                case Qt.Key_Backspace:
                    _webview.goBack()
                    console.debug("Key=" + event.key + ",text=[BkSp],accepted=" + event.accepted);
                    break;
                default:
                    console.debug("Key=" + event.key + ",text=" + event.text + ",accepted=" + event.accepted);
                    break;
                }
                // これでイベントが到達しなくなる
                //event.accepted = true;
            }
        }
    }
}
