// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Rectangle {
    id: buttonLike
    width: parent.height * 0.13
    height: width
    x: parent.width - parent.height * 0.015 - width
    y: radioTitle.y + radioTitle.height + parent.height * 0.015
    Connections {
        target: player
        onNameChanged: {
            buttonLike.state = player.isCurrentFave() ? "faved" : "notfaved";
        }
    }
    MouseArea {
        anchors.fill: parent
        onClicked: {
            buttonLike.state = (buttonLike.state == "faved" ? "notfaved" : "faved");
            player.addToFavorites();
        }
    }
    states: [
        State {
            name: "faved"
            PropertyChanges {
                target: buttonLike
                color: "red"
            }
        },
        State {
            name: "notfaved"
            PropertyChanges {
                target: buttonLike
                color: "darkred"
            }
        }
    ]
}
