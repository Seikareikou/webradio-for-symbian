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
        height: parent.height
        color: "transparent"
        gradient: Gradient {
            GradientStop {
                position: 0.00;
                color: "#8888FF"
            }
            GradientStop {
                position: 0.18;
                color: "#999999"
            }
            GradientStop {
                position: 0.60
                color: "#BBBBBB"
            }
            GradientStop {
                position: 0.85
                color: "#999999"
            }
        }
        Rectangle {
            id: radioTitle
            width: parent.width
            height: parent.height * 0.14
            color: "transparent"
            Text {
                text: player.name
                color: "#000022"
                font.pixelSize: parent.height * 0.4
                font.bold: true
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
                value: player.volume
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
                onVolumeChanged: {
                    volumeTimer.stop();
                    volumeSlider.value = player.volume;
                    volumeTimer.start();
                }
            }
            Timer {
                id: volumeTimer
                interval: 1000
                onTriggered: player.saveVolumeLevel();
            }
            MuteButton {
                id: muteButton
            }
        }
    }
}
