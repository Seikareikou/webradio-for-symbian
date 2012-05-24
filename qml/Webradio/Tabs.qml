import QtQuick 1.1
import com.nokia.symbian 1.1

Rectangle {
    id: tabsLocal

    property int checked: -1

    width: parent.width
    height: 60
    color: "black"
    ButtonRow {
        id: row
        checkedButton: parent.checked === 0 ? all : (parent.checked === 1 ? fave : recent)
        height: parent.height
        width: parent.width
        Connections {
            target: radioList
            onStatusChanged: {
                if (radioList.status === 2)
                    row.checkedButton = all
            }
        }
        Connections {
            target: favoriteList
            onStatusChanged: {
                if (favoriteList.status === 2)
                    row.checkedButton = fave
            }
        }
        Connections {
            target: recentList
            onStatusChanged: {
                if (recentList.status === 2)
                    row.checkedButton = recent
            }
        }
        Button {
            id: all
            text: window.tabText
            height: parent.height
            onClicked: {
                if (window.pageStack.currentPage !== radioList)
                    window.pageStack.replace(radioList);
            }
        }
        Button {
            id: fave
            text: "Favorites"
            height: parent.height
            onClicked: {
                if (window.pageStack.currentPage !== favoriteList)
                    window.pageStack.replace(favoriteList);
            }
        }
        Button {
            id: recent
            text: "Recent"
            height: parent.height
            onClicked: {
                if (window.pageStack.currentPage !== recentList)
                    window.pageStack.replace(recentList);
            }
        }
    }
}
