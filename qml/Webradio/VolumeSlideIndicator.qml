// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import com.nokia.symbian 1.1
import "." 1.1

Rectangle {
    id: rect
    width: parent.width - 20
    height: 96
    x: 10
    y: 115
    z: 10
    visible: opacity === 0 ? false : true
    MouseArea {
        anchors.fill: parent
        onClicked: {return}
    }
    radius: 16
    smooth: true
    color: Qt.rgba(0.1, 0.1, 0.1, 1);
    Rectangle {
        width: parent.width - 20
        height: parent.height
        anchors.centerIn: parent
        color: "transparent"
        Label {
            color: platformStyle.colorNormalLink
            text: "Volume"
            font { family: platformStyle.fontFamilyRegular; pixelSize: platformStyle.fontSizeLarge * 1.25 }
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: -20
        }
        ProgressBar {
            id: slider
            width: parent.width
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: 20
            anchors.horizontalCenter: parent.horizontalCenter
            maximumValue: 100
            minimumValue: 0
            value: player.volume
        }
    }
    state: hide
    Behavior on opacity {
        NumberAnimation {
            duration: 250
        }
    }
    states: [
        State {
            name: "show"
            when: timer.running === true
            PropertyChanges {
                target: rect
                opacity: 0.9
            }
        },
        State {
            name: "hide"
            when: timer.running === false
            PropertyChanges {
                target: rect
                opacity: 0
            }
        }
    ]
    Timer {
        id: timer
        interval: 1000
        repeat: false
        running: false
    }
    Connections {
        target: player
        onVolumeChanged: {
            if (window.pageStack.currentPage !== radioPlayer)
                timer.restart();
        }
    }
}
