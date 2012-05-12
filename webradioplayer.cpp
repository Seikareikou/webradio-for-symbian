#include "webradioplayer.h"

WebRadioPlayer::WebRadioPlayer(QDeclarativeItem *parent) :
    QDeclarativeItem(parent)
{
    player = new QMediaPlayer(this);
    QObject::connect(player, SIGNAL(metaDataAvailableChanged(bool)), this, SLOT(retrieveMetaData()));
    QObject::connect(player, SIGNAL(audioAvailableChanged(bool)), this, SLOT(audioChangedSender(bool)));
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
    for (int i = 0; i < list.size(); ++i) {
        key = list.at(i);
        var = player->metaData(key);
        qDebug() << var.toString();
        qDebug() << i;
    }
}

void WebRadioPlayer::addToFavorites()
{
    Favorites favorites("qml\\Webradio\\favorite.xml");
    favorites.AddToFavorites(radioName, radioUrl);
}

void WebRadioPlayer::addToRecent()
{
    Favorites recent("qml\\Webradio\\recent.xml");
    recent.AddToRecent(radioName, radioUrl);
}

bool WebRadioPlayer::checkPlayerError()
{
    if (player->error() != QMediaPlayer::NoError)
        return false;
    return true;
}

void WebRadioPlayer::audioChangedSender(bool available)
{
    if (available) emit audioChanged();
}
