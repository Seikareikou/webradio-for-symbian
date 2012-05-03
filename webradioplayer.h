#ifndef WEBRADIOPLAYER_H
#define WEBRADIOPLAYER_H

#include <QDeclarativeItem>
#include <QString>
#include <QMediaPlayer>
#include <QDebug>
#include "favorites.h"

class WebRadioPlayer : public QDeclarativeItem
{
    Q_OBJECT

    Q_PROPERTY(QString name READ name WRITE setName)
    QString radioName;

    Q_PROPERTY(QString url  READ url  WRITE setUrl )
    QString radioUrl;

    Q_PROPERTY(bool playing READ playing WRITE setPlaying )
    bool radioPlaying;

    Q_PROPERTY(QString artist READ artist)
    QString metaArtist;

    Q_PROPERTY(QString title  READ title NOTIFY titleChanged)
    QString metaTitle;

    QMediaPlayer *player;
public:
    explicit WebRadioPlayer(QDeclarativeItem *parent = 0);
    ~WebRadioPlayer();
    QString name() const;
    QString url() const;
    bool playing() const;
    QString artist();
    QString title();

signals:
    void titleChanged();
public slots:
    void setName(QString str);
    void setUrl(QString str);
    void setPlaying(bool b);
    void retrieveMetaData();

    void addToFavorites();
};

#endif // WEBRADIOPLAYER_H
