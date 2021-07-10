//import QtQuick 2.15
import QtQuick 2.0
//import QtQuick.Window 2.0
import QtQuick.Controls 2.0
//import QtWebView 1.15
import QtQuick.Layouts 1.0
import QtWebKit 3.0

ApplicationWindow {
    id: mainWindow
    width: 500
    height: 50
    title: qsTr("Qt + PySide2 + PyOpenJTalk")
    visible: true
    locale: locale
    ColumnLayout {
        spacing: 0
        anchors.fill: parent
        Rectangle {
            color: "#FFCCDD"
//            anchors.fill: parent
//            Layout.preferredWidth: 40
//            Layout.preferredHeight: 40
            Layout.fillWidth: true
            Layout.fillHeight: true
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
//            anchors.fill: parent
            Layout.fillWidth: true
            Layout.fillHeight: true
            TextInput {
                id: _rssUrl
                text: "https://news.yahoo.co.jp/rss/topics/top-picks.xml"
                focus: true
                KeyNavigation.tab: _talkText
                font.pixelSize: Math.max(16, parent.width / 80)
                anchors.fill: parent
                onAccepted: Connect.talk_news(_rssUrl.text)
            }
        }
    }
    /*
    WebView {
        id: resultwebview
        anchors.fill: parent
        url: "https://www.google.co.jp/"
    }
    */
}
