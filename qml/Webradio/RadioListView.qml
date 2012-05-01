// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Component {
    id: radioListView
    Item {
        width: parent.width
        height: 95
        Column {
            anchors.verticalCenter: parent.verticalCenter
            Text {
                text: "<b>" + genre_name + "</b>"
                x: 10
                font.pixelSize: 36
                font.family: "Helvetica"
                color: "darkblue"
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
