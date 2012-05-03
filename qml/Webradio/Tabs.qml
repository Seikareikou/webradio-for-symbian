// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Rectangle {
    id: tabs
    width: parent.width
    height: 60
    color: "#222222"
    clip: true
    Rectangle {
        id: all
        width: parent.width/3
        height: parent.height
        x: 0
        color: "#333333"
        Text {
            anchors.centerIn: parent
            text: "All"
            font.pixelSize: 24
            color: "#CCCCCC"
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                window.pageStack.push(Qt.resolvedUrl("RadioList.qml"), {tools: toolBarLayout})
            }
        }
    }
    Rectangle {
        id: fave
        width: parent.width/3
        height: parent.height
        x: all.width
        color: "#555555"
        Text {
            anchors.centerIn: parent
            text: "Favorite"
            font.pixelSize: 24
            color: "#CCCCCC"
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                window.pageStack.push(Qt.resolvedUrl("FavoriteList.qml"))
            }
        }
    }
    Rectangle {
        id: recent
        width: parent.width - all.width - fave.width
        height: parent.height
        x: parent.width - recent.width
        color: "#777777"
        Text {
            anchors.centerIn: parent
            text: "Recent"
            font.pixelSize: 24
            color: "#CCCCCC"
        }
    }
}
