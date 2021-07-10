#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import os, sys, numpy, pyopenjtalk
from PySide2.QtQml import QQmlApplicationEngine
from PySide2.QtWidgets import QApplication
from PySide2.QtQuick import QQuickView
from PySide2.QtCore import QUrl, QObject, Slot, Property
import simpleaudio as sa
import feedparser
import pprint

ENGINE = None
class Connect(QObject):
    def __init__(self, parent=None): super().__init__(parent)
    @Slot(str)
    def talk(self, text):
        x, sr = pyopenjtalk.tts(text)
        ply = sa.play_buffer(x.astype(numpy.int16), 1, 2, sr)
        ply.wait_done()
    @Slot(str)
    def talk_news(self, url):
        feed = feedparser.parse(url)
        pprint.pprint(feed, depth=1)
        pprint.pprint(feed['feed'], depth=1)
        news_num = len(feed['entries'])
        print(news_num)
        x, sr = pyopenjtalk.tts(f'{news_num}件のニュースがあります。')
        ply = sa.play_buffer(x.astype(numpy.int16), 1, 2, sr)
        ply.wait_done()
        for entry in feed['entries']:
            pprint.pprint(entry, depth=1)
            x, sr = pyopenjtalk.tts(entry.title)
            ply = sa.play_buffer(x.astype(numpy.int16), 1, 2, sr)
            ply.wait_done()
    @Slot(str, result=str)
    def make_html(self, url):
        html = ''
        feed = feedparser.parse(url)
        html += f'<ul>'
        for entry in feed['entries']:
            html += f'<li><a href="{entry.link}">{entry.title}</a></li>'
        html += f'</ul>'
        return html
        

    """
    @Property(str, notify=textChanged)
    def RssUrl(self): return self.__url
    @RssUrl.setter
    def RssUrl(self, v):
        self.
    """

def Main():
    app = QApplication(sys.argv)
    connect = Connect()
    engine = QQmlApplicationEngine()
    ctx = engine.rootContext()
    ctx.setContextProperty("Connect", connect)
    HERE = os.path.dirname(os.path.abspath(__file__))
    UI = os.path.join(HERE, 'talker.qml')
    engine.load(UI)
    ENGINE = engine
    if not engine.rootObjects(): sys.exit(-1)
    sys.exit(app.exec_())

if __name__ == '__main__':
    Main()
