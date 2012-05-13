#ifndef FAVORITES_H
#define FAVORITES_H

#include <QFile>
#include <QString>
#include <QList>
#include <QXmlStreamReader>
#include <QXmlStreamWriter>
#include <QtAlgorithms>
#include <QDebug>

class Favorites
{
    static const int recentCount = 15;
    QList<QXmlStreamAttributes> attributesList;
    QString xmlPath;
    void readXmlFile();
    bool checkStation(QString name, QString url, bool delIt);
    void sortingXmlFile();
    void sortingAttrList();
public:
    Favorites(QString path);
    void addToFavorites(QString name, QString url);
    void addToRecent(QString name, QString url);
    bool checkStationPresence(QString name, QString url);
};

#endif // FAVORITES_H
