#include "webradioplayer.h"

WebRadioPlayer::WebRadioPlayer(QDeclarativeItem *parent) :
    QDeclarativeItem(parent)
{
    player = new QMediaPlayer(this);
    QObject::connect(player, SIGNAL(metaDataAvailableChanged(bool)), this, SLOT(retrieveMetaData()));
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
    return metaArtist;
}

QString WebRadioPlayer::title() {
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
    QList<QtMultimediaKit::MetaData> list = player->availableMetaData();
    QtMultimediaKit::MetaData key;
    QVariant var;
    qDebug() << list.size();
    for (int i = 0; i < list.size(); ++i) {
        key = list.at(i);
        var = player->metaData(key);
        qDebug() << var.toString();
        qDebug() << i;
    }
}

void WebRadioPlayer::addToFavoirite()
{
    qDebug()<<radioName;
    qDebug()<<radioUrl;
    Favoirites favoirite("D:\\favorite.xml");
    favoirite.AddToFavoirites(radioName, radioUrl);
}
