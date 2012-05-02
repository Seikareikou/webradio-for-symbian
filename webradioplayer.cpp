#include "webradioplayer.h"

WebRadioPlayer::WebRadioPlayer(QDeclarativeItem *parent) :
    QDeclarativeItem(parent)
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
    return radioUrl;
}

bool WebRadioPlayer::playing() const {
    return radioPlaying;
}

QString WebRadioPlayer::artist() {
    retrieveMetaData();
    return metaArtist;
}

QString WebRadioPlayer::title() {
    retrieveMetaData();
    return metaTitle;
}

void WebRadioPlayer::setName(QString str) {
    radioName = str;
}

void WebRadioPlayer::setUrl(QString str) {
    radioUrl = str;
    player->setMedia(QUrl(radioUrl));
}

void WebRadioPlayer::setPlaying(bool b) {
    radioPlaying = b;
    if (radioPlaying)
        player->play();
    else
        player->stop();
}

void WebRadioPlayer::retrieveMetaData() {
    metaArtist = player->metaData(QtMultimediaKit::Author).toString();
    metaTitle  = player->metaData(QtMultimediaKit::Title).toString();
    emit titleChanged();
    qDebug() << 1;
    qDebug() << metaArtist;
}
