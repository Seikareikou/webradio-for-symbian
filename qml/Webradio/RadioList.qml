// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import QtMultimediaKit 1.1
import com.nokia.symbian 1.1

Page {
    id: radioList
    Rectangle {
        id: radioRect
        anchors.fill: parent
        XmlListModel {
             id: xmlRadio
             source: "database.xml"
             query: "/database/radio"

             XmlRole { name: "genre_name";  query: "name/string()" }
        }
        RadioListView {
            id: radioListView
        }

        Tabs {
            id: tabs
        }
        RectList {
            model: xmlRadio
            delegate: radioListView
            fRadio: true
        }
    }
}
