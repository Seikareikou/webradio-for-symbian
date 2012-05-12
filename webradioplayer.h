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

    Q_PROPERTY(QString url READ url WRITE setUrl )
    QString radioUrl;

    Q_PROPERTY(bool playing READ playing WRITE setPlaying )
    bool radioPlaying;

    Q_PROPERTY(QString artist READ artist)
    QString metaArtist;

    Q_PROPERTY(QString title READ title NOTIFY titleChanged)
    QString metaTitle;

    Q_PROPERTY(int volume READ volume WRITE setVolume NOTIFY volumeChanged)
    int radioVolume;

    Q_PROPERTY(bool muted READ muted WRITE setMuted NOTIFY mutedChanged)
    bool radioMuted;

    QMediaPlayer *player;
public:
    explicit WebRadioPlayer(QDeclarativeItem *parent = 0);
    ~WebRadioPlayer();
    QString name() const;
    QString url() const;
    bool playing() const;
    QString artist();
    QString title();
    int volume() const;
    bool muted() const;

signals:
    void titleChanged();
    void nameChanged();
    void volumeChanged();
    void mutedChanged();

public slots:
    void setName(QString str);
    void setUrl(QString str);
    void setPlaying(bool b);
    void retrieveMetaData();
    void setVolume(int vol);
    void setMuted(bool b);

    void addToFavorites();
    void addToRecent();

    bool checkPlayerError();
};

#endif // WEBRADIOPLAYER_H
