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
            checked: 1
        }
        Rectangle {
            id: addStationButton
            width: parent.width
            y: tabs.y + tabs.height
            height: 80
            color: rectList.color
            Text {
                text: "Add custom station"
                anchors.centerIn: parent
                font.pixelSize: 36
                font.bold: true
                font.family: "Helvetica"
                color: "#111155"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: addStationDialog.open()
            }
        }
        RectList {
            id: rectList
            model: xmlFave
            delegate: favoriteListView
            fRadio: 2
        }
    }
}
