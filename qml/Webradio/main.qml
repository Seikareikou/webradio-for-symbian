
import QtQuick 1.0
import QtMultimediaKit 1.1
import WRP 1.0
import com.nokia.symbian 1.1

PageStackWindow {
    id: window
    initialPage: radioList
    showStatusBar: true
    showToolBar: true

    property variant tabText: "All"

    WebRadioPlayer {
        id: player  
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
}

