#include "favoirites.h"

Favoirites::Favoirites(QString path)
{
    xmlPath = path;
    ReadXmlFile();
}

void Favoirites::ReadXmlFile()
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
    for (int i=0; i<attributesList.size();++i)
        qDebug()<<attributesList.at(i).value("name");
    file.close();
}

void Favoirites::AddToFavoirites(QString name, QString url)
{
    QFile file(xmlPath);
    file.open(QIODevice::ReadWrite | QIODevice::Text);
    QXmlStreamWriter xml(&file);

    xml.setAutoFormatting(true);
    xml.writeStartDocument();
    xml.writeStartElement("database");
    xml.writeStartElement("station");
    xml.writeAttribute("name", name);
    xml.writeAttribute("url", url);
    xml.writeEndElement();
    xml.writeStartElement("station");
    for (int i=0; i<attributesList.size();++i) {
        xml.writeAttribute("name", attributesList.at(i).value("name").toString());
        xml.writeAttribute("url", attributesList.at(i).value("url").toString());
        xml.writeEndElement();
    }
    xml.writeEndDocument();
    file.close();
}
