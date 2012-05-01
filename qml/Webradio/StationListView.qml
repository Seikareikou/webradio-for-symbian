// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Component {
    id: radioListView
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
