#ifndef WEBRADIOPLAYER_H
#define WEBRADIOPLAYER_H

#include <QDeclarativeItem>
#include <QString>
#include <QMediaPlayer>
#include <QDebug>
#include <QDir>
#include "favorites.h"

class WebRadioPlayer : public QDeclarativeItem
{
    Q_OBJECT

    Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged)
    QString radioName;

    Q_PROPERTY(QString url READ url WRITE setUrl NOTIFY urlChanged)
    QString radioUrl;

    Q_PROPERTY(bool playing READ playing WRITE setPlaying NOTIFY playingChanged)
    bool radioPlaying;

    Q_PROPERTY(int volume READ volume WRITE setVolume NOTIFY volumeChanged)
    int radioVolume;

    Q_PROPERTY(bool muted READ muted WRITE setMuted NOTIFY mutedChanged)
    bool radioMuted;

    QMediaPlayer *player;
    int signalsFilterCount;

    bool checkStation(QString name, QString url);

public:
    explicit WebRadioPlayer(QDeclarativeItem *parent = 0);
    ~WebRadioPlayer();
    QString name() const;
    QString url() const;
    bool playing() const;
    int volume() const;
    bool muted() const;

signals:
    void nameChanged();
    void urlChanged();
    void playingChanged();
    void volumeChanged();
    void mutedChanged();
    void audioChanged();
    void errorFound();
    void stChanged();

public slots:
    void setName(QString str);
    void setUrl(QString str);
    void setPlaying(bool b);
    void setVolume(int vol);
    void setMuted(bool b);
    void addToFavorites();
    void addToRecent();
    bool checkPlayerError();
    void audioChangedSender(bool available);
    void errorFoundSender(QMediaPlayer::Error error);
    void stateChangedSender(QMediaPlayer::State state);
    bool isCurrentFave();
    void clearData();
    int signalsFilter();

    void saveVolumeLevel();
    void loadVolumeLevel();
};

#endif // WEBRADIOPLAYER_H
