import QtQuick 1.1

Component {
    id: stationListView
    Item {
        width: parent.width
        height: 80
        Item {
            width: window.pageStack.currentPage === favoriteList ? parent.width * 0.85 : parent.width
            height: parent.height
            Column {
                anchors.verticalCenter: parent.verticalCenter
                Text {
                    text: "<b>" + radio_name + "</b>"
                    x: 10
                    font.pixelSize: 36
                    color: "#111155"
                }
            }
        }
        Item {
            visible: window.pageStack.currentPage === favoriteList ? true : false
            width: parent.width * 0.15
            x: parent.width * 0.85
            height: parent.height
            Image {
                anchors.fill: parent
                source: ":delete.png"
            }
        }
        Rectangle {
            width: parent.width
            height: 1
            border.color: "#AAAAAA"
            border.width: 2
        }
    }
}
