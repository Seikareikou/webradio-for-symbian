// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import com.nokia.symbian 1.1

Page {
    id: playerPage
    tools: playerBarLayout
    MainToolbar {
        id: playerBarLayout
        enablePlay: false
    }
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
            color: "transparent"
            Text {
                text: player.name
                color: "darkblue"
                font.pixelSize: parent.height * 0.4
                anchors.centerIn: parent
            }
        }
        LikeButton {
            id: buttonLike
        }
        PlayButton {
            id: playButton
        }
        Rectangle {
            id: rectVolume
            width: parent.width - parent.height * 0.015 * 2
            height: parent.height * 0.09
            x: parent.height * 0.015
            y: parent.height - parent.height * 0.017 * 8
            color: "transparent"
            Slider {
                id: volumeSlider
                maximumValue: 100
                minimumValue: 0
                value: 50
                stepSize: 1
                valueIndicatorVisible: true

                x: muteButton.width
                width: parent.width - muteButton.width

                onValueChanged: {
                    player.volume = volumeSlider.value;
                }
            }
            Connections {
                target: player
                onVolumeChanged: volumeSlider.value = player.volume
            }
            MuteButton {
                id: muteButton
            }
        }
    }
}
