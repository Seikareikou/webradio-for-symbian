#include <QtGui/QApplication>
#include "qmlapplicationviewer.h"
#include <QtDeclarative>
#include "webradioplayer.h"
#include "mediakeycaptureitem.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    qmlRegisterType<WebRadioPlayer>("WRP", 1, 0, "WebRadioPlayer");
    qmlRegisterType<MediakeyCaptureItem>("MKCI", 1, 0, "MediaKeyCaptureItem");

    QmlApplicationViewer viewer;

    viewer.setOrientation(QmlApplicationViewer::ScreenOrientationLockPortrait);
    viewer.setMainQmlFile(QLatin1String("qml/Webradio/main.qml"));
    viewer.showExpanded();

    return app.exec();
}
