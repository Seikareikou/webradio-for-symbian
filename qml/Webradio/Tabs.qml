// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Rectangle {
    id: tabs
    width: parent.width
    height: 60
    color: "#222222"
    clip: true
    Rectangle {
        id: tab1
        width: parent.width/3
        height: parent.height
        x: 0
        color: "#333333"
    }
    Rectangle {
        id: tab2
        width: parent.width/3
        height: parent.height
        x: tab1.width
        color: "#555555"
    }
    Rectangle {
        id: tab3
        width: parent.width - tab1.width - tab2.width
        height: parent.height
        x: parent.width - tab3.width
        color: "#777777"
    }
}
