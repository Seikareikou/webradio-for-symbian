#ifndef MEDIAKEYCAPTURE_H
#define MEDIAKEYCAPTURE_H

#include <QDeclarativeItem>

#ifdef Q_WS_S60
#include <remconcoreapitargetobserver.h>    // link against RemConCoreApi.lib
#include <remconcoreapitarget.h>            // and
#include <remconinterfaceselector.h>        // RemConInterfaceBase.lib
#endif // Q_WS_S60

#ifdef Q_WS_S60
class MediakeyCaptureItemPrivate;
#endif // Q_WS_S60
class MediakeyCaptureItem : public QDeclarativeItem
{
    Q_OBJECT
#ifdef Q_WS_S60
public:
    MediakeyCaptureItem(QDeclarativeItem *parent = 0);
    void paint(QPainter *painter, const QStyleOptionGraphicsItem *option, QWidget *widget);
#endif // Q_WS_S60
signals:
    void volumeDownPressed();
    void volumeUpPressed();
#ifdef Q_WS_S60
private:
    MediakeyCaptureItemPrivate *d_ptr;
private:    // Friend class definitions
    friend class MediakeyCaptureItemPrivate;
#endif // Q_WS_S60
};

#endif // MEDIAKEYCAPTURE_H
