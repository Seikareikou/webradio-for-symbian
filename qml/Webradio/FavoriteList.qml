// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import com.nokia.symbian 1.1

Page {
    id: favoriteList
    tools: toolBarLayout

    onStatusChanged: {
        xmlFave.reload();
    }

    Rectangle {
        id: favoriteRect
        anchors.fill: parent
        XmlListModel {
             id: xmlFave
             source: "D:\\favorite.xml"
             query: "/database/station"

             XmlRole { name: "name";  query: "@name/string()" }
             XmlRole { name: "url";  query: "@url/string()" }
        }
        RadioListView {
            id: favoriteListView
        }

        Tabs {
            id: tabs
        }
        RectList {
            model: xmlFave
            delegate: favoriteListView
            fRadio: 2
        }
    }
}
