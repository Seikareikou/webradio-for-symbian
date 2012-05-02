import QtQuick 1.0
import QtMultimediaKit 1.1
import WRP 1.0
import com.nokia.symbian 1.1

PageStackWindow {
    id: window
    initialPage: RadioList {
        tools: toolBarLayout
    }
    showStatusBar: true
    showToolBar: true

    Audio {
        id: player
    }

    WebRadioPlayer {
        name: "oops"
    }

    ToolBarLayout {
        id: toolBarLayout
        ToolButton {
            flat: true
            iconSource: "toolbar-back"
            onClicked: {
                if (window.pageStack.depth <= 1)
                    Qt.quit()
                else
                    window.pageStack.pop();
            }
        }
    }
}
