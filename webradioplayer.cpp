#include "webradioplayer.h"

WebRadioPlayer::WebRadioPlayer(QDeclarativeItem *parent) :
    QDeclarativeItem(parent)
{
    player = new QMediaPlayer(this);
    radioVolume = 50;
    radioMuted = false;
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

int WebRadioPlayer::volume() const {
    return radioVolume;
}

bool WebRadioPlayer::muted() const {
    return radioMuted;
}

void WebRadioPlayer::setName(QString str) {
    radioName = str;
    emit nameChanged();
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

void WebRadioPlayer::setVolume(int vol) {
    radioVolume = vol;
    player->setVolume(radioVolume);
    emit volumeChanged();
}

void WebRadioPlayer::setMuted(bool b) {
    radioMuted = b;
    player->setMuted(radioMuted);
    emit mutedChanged();
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

bool WebRadioPlayer::isCurrentFave() {
    return checkStation(radioName, radioUrl);
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
    qDebug() << player->error();
    if (player->error() != QMediaPlayer::NoError)
        return false;
    return true;
}

void WebRadioPlayer::audioChangedSender(bool available)
{
    if (available) emit audioChanged();
}

bool WebRadioPlayer::checkStation(QString name, QString url)
{
    Favorites favorites("qml\\Webradio\\favorite.xml");
    return favorites.CheckStationPresence(name, url);
}
