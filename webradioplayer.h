#ifndef WEBRADIOPLAYER_H
#define WEBRADIOPLAYER_H

#include <QDeclarativeItem>
#include <QString>
#include <QMediaPlayer>

class WebRadioPlayer : public QDeclarativeItem
{
    Q_OBJECT
    Q_PROPERTY(QString name READ name WRITE setName)
    QString radioName;
    Q_PROPERTY(QString url  READ url  WRITE setUrl )
    QString radioUrl;
    Q_PROPERTY(bool playing READ playing WRITE setPlaying )
    bool radioPlaying;
    QMediaPlayer *player;

public:
    explicit WebRadioPlayer(QDeclarativeItem *parent = 0);
    ~WebRadioPlayer();
    QString name() const;
    QString url() const;
    bool playing() const;
signals:
    
public slots:
    void setName(QString str);
    void setUrl(QString str);
    void setPlaying(bool b);
};

#endif // WEBRADIOPLAYER_H
