// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import com.nokia.symbian 1.1

Item {
    property string text: "Name:"
    property string inputData: input.text
    id: wrapper
    anchors.left: parent.left
    anchors.leftMargin: platformStyle.paddingLarge
    anchors.right: parent.right
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.topMargin: 10
    height:  36
    Label {
        id: label
        text: parent.text
        color: platformStyle.colorNormalLink
    }
    TextInput {
        id: input
        text: ""
        color: "white"
        anchors.left: label.right
        anchors.leftMargin: platformStyle.paddingSmall
        anchors.top: parent.top
        anchors.bottom: label.bottom
        width: parent.width - label.width - 10
        font.pixelSize: height - 6
    }
}
