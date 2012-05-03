#ifndef FAVORITES_H
#define FAVORITES_H

#include <QFile>
#include <QString>
#include <QList>
#include <QXmlStreamReader>
#include <QXmlStreamWriter>
#include <QDebug>

class Favorites
{
    QList<QXmlStreamAttributes> attributesList;
    QString xmlPath;
    void ReadXmlFile();
    bool CheckStation(QString name, QString url);
public:
    Favorites(QString xmlPath);
    void AddToFavorites(QString name, QString url);
};

#endif // FAVORITES_H
