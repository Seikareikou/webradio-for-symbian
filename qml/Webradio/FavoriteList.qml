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
             source: "favorite.xml"
             query: "/database/station"

             XmlRole { name: "radio_name";  query: "@name/string()" }
             XmlRole { name: "radio_url";  query: "@url/string()" }
        }
        StationListView {
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
