// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import com.nokia.symbian 1.1

Page {
    tools: toolBarLayout
    Rectangle {
        id: playerRect
        anchors.fill: parent
        color: "#999999"
        height: parent.height
        Rectangle {
            id: radioTitle
            width: parent.width - parent.height * 0.015 * 2
            height: parent.height * 0.14
            x: parent.height * 0.015
            y: parent.height * 0.015
            color: "#000033"
            Text {
                text: "Radio Title"
                color: "lightblue"
                font.pixelSize: parent.height * 0.4
                anchors.centerIn: parent
            }
        }
        Rectangle {
        id: songInfo
        width: parent.width - parent.height * 0.015 * 2
        height: parent.height * 0.14
        x: parent.height * 0.015
        y: radioTitle.y + radioTitle.height + parent.height * 0.015 * 2
        color: "#000066"
            Text {
                text: "Song Info"
                color: "lightblue"
                font.pixelSize: parent.height * 0.4
                anchors.centerIn: parent
            }
        }
        Rectangle {
            id: buttonLike
            width: parent.height * 0.13
            height: width
            x: parent.width - parent.height * 0.015 - width
            y: songInfo.y + songInfo.height + parent.height * 0.015
            color: "red"
        }
        Rectangle {
            id: buttonPlay
            width: parent.height * 0.4
            radius: width / 2
            smooth: true
            height: width
            x: (parent.width - width) / 2
            y: buttonLike.y + buttonLike.height
            color: "black"
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    player.playing = !player.playing;
                }
            }
        }
        Rectangle {
            id: rectVolume
            width: parent.width - parent.height * 0.015 * 2
            height: parent.height * 0.09
            x: parent.height * 0.015
            y: buttonPlay.y + buttonPlay.height + parent.height * 0.017 * 2
            color: "yellow"
            Rectangle {
                height: parent.height
                width: parent.width * 0.17
                color: "red"
            }
        }
/*        Rectangle {
            id: buttonBackPlayer
            width: parent.width
            height: parent.height * 0.11 < 60 ? 60 : parent.height * 0.11
            y: parent.height - height
            color: buttonBackRadio.color
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    playerRect.visible = false;
                    radioRect.visible = true;
                }
            }
            Text {
                anchors.centerIn: parent
                text: "Back"
                color: "#6699FF"
                font.pixelSize: parent.height * 0.4
            }
        }*/
    }
}
