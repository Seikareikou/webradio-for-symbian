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
    static const int recentCount = 10;
    QList<QXmlStreamAttributes> attributesList;
    QString xmlPath;
    void ReadXmlFile();
    bool CheckStation(QString name, QString url, bool delIt);
    void SortingXmlFile();
    void SortingAttrList();
public:
    Favorites(QString path);
    void AddToFavorites(QString name, QString url);
    void AddToRecent(QString name, QString url);
    bool CheckStationPresence(QString name, QString url);
};

#endif // FAVORITES_H
