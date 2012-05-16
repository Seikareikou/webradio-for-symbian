// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import com.nokia.symbian 1.1

ToolBarLayout {
    id: toolBarLayout
    ToolButton {
        id: toolbarBack
        flat: true
        iconSource: "toolbar-back"
        onClicked: {
            if (window.pageStack.depth > 1)
                window.pageStack.pop();
            if (stationRectList.x === 0) {
                stationRectList.x = stationRectList.parent.width;
                window.tabText = "All";
            }
        }
    }
    ToolButton {
        id: toolPlay
        flat: true
        iconSource: "toolbar-mediacontrol-play"
        onClicked: {
            if (window.pageStack.currentPage !== radioPlayer)
                window.pageStack.push(radioPlayer);
        }
    }
    ToolButton {
        flat: true
        iconSource: "toolbar-home"
        onClicked: QmlApplicationViewer.showMinimized();
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
