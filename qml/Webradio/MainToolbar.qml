// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import com.nokia.symbian 1.1

ToolBarLayout {
    id: toolBarLayout

    property variant enablePlay: true

    ToolButton {
        id: toolbarBack
        flat: true
        iconSource: "toolbar-back"
        onClicked: {
            if (window.pageStack.depth > 1)
                window.pageStack.pop();
            else {
                if (window.pageStack.currentPage === radioList) {
                    if (stationRectList.x === 0) {
                        stationRectList.x = stationRectList.parent.width;
                        window.tabText = "All";
                    }
                    else
                        exitDialog.open();
                }
                else
                    exitDialog.open();
            }
        }
    }
    ToolButton {
        id: toolPlay
        flat: true
        enabled: toolBarLayout.enablePlay
        iconSource: "toolbar-mediacontrol-play"
        onClicked: window.pageStack.push(radioPlayer);
    }
    ToolButton {
        flat: true
        iconSource: "toolbar-home"
//        onClicked: player.sendToBackground();
    }
    ToolButton {
        flat: true
        iconSource: "toolbar-menu"
        onClicked: mainMenu.open()
    }
    Connections {
        target: player
        onPlayingChanged: {
            if (player.playing === true)
                toolPlay.iconSource = "toolbar-mediacontrol-play"
            else
                toolPlay.iconSource = "toolbar-mediacontrol-stop"
        }
    }
}
