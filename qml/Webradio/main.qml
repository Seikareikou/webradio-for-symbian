import QtQuick 1.1
import QtMultimediaKit 1.1
import WRP 1.0
import MKCI 1.0
import com.nokia.symbian 1.1

PageStackWindow {
    id: window
    initialPage: radioList
    showStatusBar: true
    showToolBar: true

    property string tabText: "All"
    property int loadingFilter: 0
    WebRadioPlayer {
        id: player  
    }
    MediaKeyCaptureItem {
        id: mkci
        onVolumeUpPressed: player.volume += 10
        onVolumeDownPressed: player.volume -= 10
    }
    VolumeSlideIndicator {
        id: vsi
    }
    RadioList {
        id: radioList
    }
    RadioPlayer {
        id: radioPlayer
    }
    FavoriteList {
        id: favoriteList
    }
    RecentList {
        id: recentList
    }
    MainToolbar {
        id: toolBarLayout
    }
    MainMenu {
        id: mainMenu
    }
    AboutDialog {
        id: aboutDialog
    }
    ExitDialog {
        id: exitDialog
    }
    ErrorDialog {
        id: emptyRadioDialog
        message: "No radio station is selected\n"
    }
    LoadingIndicator {
        id: loadingIndicator
    }
    Rectangle {
        id: loadingRect
        anchors.fill: parent
        color: Qt.rgba(0, 0, 0, 0.7)
        visible: loadingIndicator.visible
        MouseArea {
            anchors.fill: parent
        }
    }
}

