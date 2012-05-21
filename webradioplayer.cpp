#include "webradioplayer.h"

WebRadioPlayer::WebRadioPlayer(QDeclarativeItem *parent) :
    QDeclarativeItem(parent)
{
    player = new QMediaPlayer(this);
    radioVolume = 50;
    player->setVolume(50);
    radioMuted = false;
    signalsFilterCount = 0;
    QObject::connect(player, SIGNAL(audioAvailableChanged(bool)), this, SLOT(audioChangedSender(bool)));
    QObject::connect(player, SIGNAL(error(QMediaPlayer::Error)), this, SLOT(errorFoundSender(QMediaPlayer::Error)));
    QObject::connect(player, SIGNAL(stateChanged(QMediaPlayer::State)), this, SLOT(stateChangedSender(QMediaPlayer::State)));
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
    QMediaContent nullContent;
    if (!radioUrl.isNull())
        player->setMedia(QUrl(radioUrl));
    else
        player->setMedia(nullContent);
    emit urlChanged();
}

void WebRadioPlayer::setPlaying(bool b) {
    radioPlaying = b;
    if (radioPlaying)
        player->play();
    else
        player->stop();
    emit playingChanged();
}

void WebRadioPlayer::setVolume(int vol) {
    radioVolume = vol;
    if (radioVolume < 0)
        radioVolume = 0;
    if (radioVolume > 100)
        radioVolume = 100;
    player->setVolume(radioVolume);
    emit volumeChanged();
}

void WebRadioPlayer::setMuted(bool b) {
    radioMuted = b;
    player->setMuted(radioMuted);
    emit mutedChanged();
}

bool WebRadioPlayer::isCurrentFave() {
    return checkStation(radioName, radioUrl);
}

void WebRadioPlayer::addToFavorites()
{
    Favorites favorites("qml\\Webradio\\favorite.xml");
    favorites.addToFavorites(radioName, radioUrl);
}

void WebRadioPlayer::addToRecent()
{
    Favorites recent("qml\\Webradio\\recent.xml");
    recent.addToRecent(radioName, radioUrl);
}

bool WebRadioPlayer::checkPlayerError()
{
    if (player->error() != QMediaPlayer::NoError)
        return false;
    return true;
}

bool WebRadioPlayer::checkStation(QString name, QString url)
{
    Favorites favorites("qml\\Webradio\\favorite.xml");
    return favorites.checkStationPresence(name, url);
}

void WebRadioPlayer::audioChangedSender(bool available)
{
    if (available) emit audioChanged();
}

int WebRadioPlayer::signalsFilter()
{
    if (signalsFilterCount == 4) signalsFilterCount = 0;
    return signalsFilterCount++;
}

void WebRadioPlayer::errorFoundSender(QMediaPlayer::Error error)
{
    if (error != QMediaPlayer::NoError)
        emit errorFound();
}

void WebRadioPlayer::stateChangedSender(QMediaPlayer::State state)
{
    if (state == QMediaPlayer::PlayingState)
        emit stChanged();
}

void WebRadioPlayer::clearData()
{
    radioUrl  = "";
    radioName = "";
}
