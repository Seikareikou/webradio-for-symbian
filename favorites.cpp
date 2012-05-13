#include "favorites.h"

Favorites::Favorites(QString path)
{
    xmlPath = path;
    readXmlFile();
}

void Favorites::readXmlFile()
{
    QFile file(xmlPath);
    if (!file.exists()) qDebug() << "Fav not found";
    file.open(QIODevice::ReadWrite | QIODevice::Text);
    QXmlStreamReader xml(&file);
    xml.readNextStartElement();
    QXmlStreamAttributes attributes;
    while (!xml.atEnd()) {
       if (xml.readNextStartElement()) attributes = xml.attributes();
       if (xml.name().toString() == "station" && !xml.attributes().size()) attributesList << attributes;
    }
    file.close();
}

void Favorites::addToFavorites(QString name, QString url)
{
    QFile file(xmlPath);
    file.open(QIODevice::WriteOnly | QIODevice::Text);
    QXmlStreamWriter xml(&file);

    xml.setAutoFormatting(true);
    xml.writeStartDocument();
    xml.writeStartElement("database");

    if (!checkStation(name, url, true)) {
        xml.writeStartElement("station");
        xml.writeAttribute("name", name);
        xml.writeAttribute("url", url);
        xml.writeEndElement();
    }

    for (int i=0; i < attributesList.size(); ++i) {
        xml.writeStartElement("station");
        xml.writeAttribute("name", attributesList.at(i).value("name").toString());
        xml.writeAttribute("url", attributesList.at(i).value("url").toString());
        xml.writeEndElement();
    }

    xml.writeEndElement();
    xml.writeEndDocument();
    file.close();
    sortingXmlFile();
}

void Favorites::addToRecent(QString name, QString url)
{
    QFile file(xmlPath);
    file.open(QIODevice::WriteOnly | QIODevice::Text);
    QXmlStreamWriter xml(&file);

    checkStation(name, url, true);

    xml.setAutoFormatting(true);
    xml.writeStartDocument();
    xml.writeStartElement("database");
    xml.writeStartElement("station");
    xml.writeAttribute("name", name);
    xml.writeAttribute("url", url);
    xml.writeEndElement();

    int count = recentCount - 1;
    if (attributesList.size() < count) count = attributesList.size();

    for (int i=0; i < count; ++i) {
        xml.writeStartElement("station");
        xml.writeAttribute("name", attributesList.at(i).value("name").toString());
        xml.writeAttribute("url", attributesList.at(i).value("url").toString());
        xml.writeEndElement();
    }

    xml.writeEndElement();
    xml.writeEndDocument();
    file.close();
}

bool Favorites::checkStation(QString name, QString url, bool delIt)
{
    for (int i=0; i < attributesList.size(); ++i) {
        if (name == attributesList.at(i).value("name").toString() &&
            url  == attributesList.at(i).value("url").toString()) {
                if (delIt) attributesList.removeAt(i);
                return true;
        }
    }
    return false;
}

bool caseInsensitiveLessThan(const QXmlStreamAttributes &s1, const QXmlStreamAttributes &s2)
{
    return s1.value("name").toString().toLower() < s2.value("name").toString().toLower();
}

void Favorites::sortingAttrList()
{
    qSort(attributesList.begin(), attributesList.end(), caseInsensitiveLessThan);
}

void Favorites::sortingXmlFile()
{
    attributesList.clear();
    readXmlFile();
    sortingAttrList();

    QFile file(xmlPath);
    file.open(QIODevice::WriteOnly | QIODevice::Text);
    QXmlStreamWriter xml(&file);

    xml.setAutoFormatting(true);
    xml.writeStartDocument();
    xml.writeStartElement("database");

    for (int i=0; i < attributesList.size(); ++i) {
        xml.writeStartElement("station");
        xml.writeAttribute("name", attributesList.at(i).value("name").toString());
        xml.writeAttribute("url", attributesList.at(i).value("url").toString());
        xml.writeEndElement();
    }

    xml.writeEndElement();
    xml.writeEndDocument();
    file.close();
}

bool Favorites::checkStationPresence(QString name, QString url)
{
    return checkStation(name, url, false);
}
