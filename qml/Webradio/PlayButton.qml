// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Rectangle {
    id: buttonPlay
    width: parent.height * 0.5
    radius: width / 2
    smooth: true
    height: width
    x: (parent.width - width) / 2
    y: buttonLike.y + buttonLike.height
    color: "black"
    Connections {
        target: player
        onPlayingChanged: {
            if (player.playing)
                buttonPlay.state = "playing"
            else
                buttonPlay.state = "stopped"
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            buttonPlay.state = (buttonPlay.state == "playing" ? "stopped" : "playing")
        }
    }
    state: "playing"

    states: [
        State {
            name: "playing"
            PropertyChanges {
                target: buttonPlay
                color: "black"
            }
            PropertyChanges {
                target: player
                playing: true
            }
        },
        State {
            name: "stopped"
            PropertyChanges {
                target: buttonPlay
                color: "gray"
            }
            PropertyChanges {
                target: player
                playing: false
            }
        }

    ]
}
