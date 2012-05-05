#include "favorites.h"

Favorites::Favorites(QString path)
{
    xmlPath = path;
    ReadXmlFile();
}

void Favorites::ReadXmlFile()
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

void Favorites::AddToFavorites(QString name, QString url)
{
    QFile file(xmlPath);
    file.open(QIODevice::WriteOnly | QIODevice::Text);
    QXmlStreamWriter xml(&file);

    xml.setAutoFormatting(true);
    xml.writeStartDocument();
    xml.writeStartElement("database");

    if (!CheckStation(name, url, true)) {
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
}

void Favorites::AddToRecent(QString name, QString url)
{
    QFile file(xmlPath);
    file.open(QIODevice::WriteOnly | QIODevice::Text);
    QXmlStreamWriter xml(&file);

    CheckStation(name, url, true);

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

bool Favorites::CheckStation(QString name, QString url, bool delIt)
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
