import QtQuick 1.1

Rectangle {
    id: buttonPlay
    width: parent.height * 0.5
    height: width
    x: (parent.width - width) / 2
    y: buttonLike.y + buttonLike.height
    color: "transparent"
    Item {
        width: parent.width
        anchors.fill: parent
        Image {
            id: background
            anchors.centerIn: parent
            fillMode: Image.PreserveAspectFit
        }
    }
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
                target: background
                source: ":stop.png"
            }
            PropertyChanges {
                target: player
                playing: true
            }
        },
        State {
            name: "stopped"
            PropertyChanges {
                target: background
                source: ":play.png"
            }
            PropertyChanges {
                target: player
                playing: false
            }
        }

    ]
}
