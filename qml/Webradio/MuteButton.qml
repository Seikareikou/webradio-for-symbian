import QtQuick 1.1

Rectangle {
    id: muteButton
    height: parent.height
    width: parent.width * 0.17
    color: "transparent"
    MouseArea {
        anchors.fill: parent
        onClicked: {
            muteButton.state = (muteButton.state == "default" ? "muted" : "default")
        }
    }
    Item {
        width: parent.width
        anchors.fill: parent
        Image {
            id: background
            anchors.fill: parent
            fillMode: Image.PreserveAspectFit
        }
    }
    state: "default"
    states: [
        State {
            name: "muted"
            PropertyChanges {
                target: background
                source: ":mute.png"
            }
            PropertyChanges {
                target: player
                muted: true
            }
        },
        State {
            name: "default"
            PropertyChanges {
                target: background
                source: ":notmute.png"
            }
            PropertyChanges {
                target: player
                muted: false
            }
        }
    ]
}
