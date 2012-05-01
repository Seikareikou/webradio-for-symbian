// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import com.nokia.symbian 1.1

Page {
    id: stationList
    tools: toolBarLayout

    property variant query

    Rectangle {
        id: stationRect
        anchors.fill: parent
        XmlListModel {
             id: xmlStation
             source: "database.xml"
             query: stationList.query ? stationList.query : "/"

             XmlRole { name: "radio_name"; query: "name/string()" }
             XmlRole { name: "radio_url";  query: "url/string()"  }
        }
        StationListView {
            id: stationListView
        }
        Tabs {
            id: tabs
        }
        RectList {
            model: xmlStation
            delegate: stationListView
            fRadio: false
        }
    }
}
