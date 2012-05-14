// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import QtMultimediaKit 1.1
import com.nokia.symbian 1.1

Page {
    id: radioList
    tools: radioToolBar
    MainToolbar {
        id: radioToolBar
    }
    Rectangle {
        id: radioRect
        anchors.fill: parent
        XmlListModel {
             id: xmlRadio
             source: "database.xml"
             query: "/database/radio"

             XmlRole { name: "name";  query: "@name/string()" }
             XmlRole { name: "id";  query: "@id/string()" }
        }
        XmlListModel {
             id: xmlStation
             source: "database.xml"

             XmlRole { name: "radio_name"; query: "@name/string()" }
             XmlRole { name: "radio_url";  query: "@url/string()"  }
        }
        RadioListView {
            id: radioListView
        }
        StationListView {
            id: stationListView
        }

        Tabs {
            id: tabs
        }
        RectList {
            id: rectList
            model: xmlRadio
            delegate: radioListView
            fRadio: 0
        }
    }
}
