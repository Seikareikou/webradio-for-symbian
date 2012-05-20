import QtQuick 1.1
import QtMultimediaKit 1.1
import WRP 1.0
import com.nokia.symbian 1.1

PageStackWindow {
    id: window
    initialPage: radioList
    showStatusBar: true
    showToolBar: true

    property string tabText: "All"

    WebRadioPlayer {
        id: player  
    }
    Keys.onVolumeUpPressed: player.volume += 10
    Keys.onVolumeDownPressed: player.volume -= 10
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
}

