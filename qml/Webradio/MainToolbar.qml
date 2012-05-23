import QtQuick 1.1
import com.nokia.symbian 1.1

ToolBarLayout {
    id: toolBarLayout

    property bool enablePlay: true

    ToolButton {
        id: toolbarBack
        flat: true
        iconSource: "toolbar-back"
        onClicked: {
            if (loadingIndicator.visible === true)
                return;
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
        onClicked: {
            if (loadingIndicator.visible === true)
                return;
            if (player.name)
                window.pageStack.push(radioPlayer);
            else
                emptyRadioDialog.open();
        }
    }
    ToolButton {
        flat: true
        iconSource: "toolbar-menu"
        onClicked: {
            if (loadingIndicator.visible === true)
                return;
            mainMenu.open()
        }
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
