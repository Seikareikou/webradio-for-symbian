import QtQuick 1.1

Component {
    id: stationListView
    Item {
        width: parent.width
        height: 80
        Column {
            anchors.verticalCenter: parent.verticalCenter
            Text {
                text: "<b>" + radio_name + "</b>"
                x: 10
                font.pixelSize: 36
                color: "#111155"
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
