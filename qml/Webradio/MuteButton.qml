// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Rectangle {
    id: muteButton
    height: parent.height
    width: parent.width * 0.17
    color: "red"
    MouseArea {
        anchors.fill: parent
        onClicked: {
            muteButton.state = (muteButton.state == "default" ? "muted" : "default")
        }
    }

    state: "default"
    states: [
        State {
            name: "muted"
            PropertyChanges {
                target: muteButton
                color: "darkred"
            }
            PropertyChanges {
                target: player
                muted: true
            }
        },
        State {
            name: "default"
            PropertyChanges {
                target: muteButton
                color: "red"
            }
            PropertyChanges {
                target: player
                muted: false
            }
        }
    ]
}
