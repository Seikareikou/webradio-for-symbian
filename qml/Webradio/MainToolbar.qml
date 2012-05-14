// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import com.nokia.symbian 1.1

ToolBarLayout {
    id: toolBarLayout
    ToolButton {
        flat: true
        iconSource: "toolbar-back"
        onClicked: {
            if (window.pageStack.depth > 1)
                window.pageStack.pop();
            if (rectList.model !== xmlRadio) {
                rectList.model = xmlRadio;
                rectList.fRadio = 0;
                rectList.delegate = radioListView;
            }
        }
    }
    ToolButton {
        flat: true
        iconSource: "toolbar-menu"
        onClicked: mainMenu.open()
    }
}
