#ifndef FAVOIRITES_H
#define FAVOIRITES_H

#include <QFile>
#include <QString>
#include <QList>
#include <QXmlStreamReader>
#include <QXmlStreamWriter>
#include <QDebug>

class Favoirites
{
    QList<QXmlStreamAttributes> attributesList;
    QString xmlPath;
    void ReadXmlFile();
public:
    Favoirites(QString xmlPath);
    void AddToFavoirites(QString name, QString url);
};

#endif // FAVOIRITES_H
