#include "webradioplayer.h"

WebRadioPlayer::WebRadioPlayer(QObject *parent) :
    QObject(parent)
{
    player = new QMediaPlayer(this);
}

WebRadioPlayer::~WebRadioPlayer() {
    delete player;
}

QString WebRadioPlayer::name() const {
    return radioName;
}

QString WebRadioPlayer::url() const {
    return radioURL;
}

void WebRadioPlayer::setName(QString str) {
    radioName = str;
}

void WebRadioPlayer::setURL(QString str) {
    radioURL = str;
}
