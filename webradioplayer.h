#ifndef WEBRADIOPLAYER_H
#define WEBRADIOPLAYER_H

#include <QObject>
#include <QString>
#include <QMediaPlayer>

class WebRadioPlayer : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString name READ name WRITE setName)
    QString radioName;
    Q_PROPERTY(QString URL  READ url  WRITE setURL )
    QString radioURL;
    QMediaPlayer *player;

public:
    explicit WebRadioPlayer(QObject *parent = 0);
    ~WebRadioPlayer();
    QString name() const;
    QString url() const;
signals:
    
public slots:
    void setName(QString str);
    void setURL(QString str);
};

#endif // WEBRADIOPLAYER_H
