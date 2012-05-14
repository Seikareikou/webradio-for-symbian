// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import com.nokia.symbian 1.1

Rectangle {
    id: tabs
    width: parent.width
    height: 60
/*  color: "#222222"
    clip: true
    Rectangle {
        id: all
        width: parent.width/3
        height: parent.height
        x: 0
        color: "#333333"
        Text {
            anchors.centerIn: parent
            text: "All"
            font.pixelSize: 24
            color: "#CCCCCC"
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                if (window.pageStack.currentPage != radioList)
                    window.pageStack.replace(radioList);
            }
        }
    }
    Rectangle {
        id: fave
        width: parent.width/3
        height: parent.height
        x: all.width
        color: "#555555"
        Text {
            anchors.centerIn: parent
            text: "Favorite"
            font.pixelSize: 24
            color: "#CCCCCC"
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                if (window.pageStack.currentPage != favoriteList)
                    window.pageStack.replace(favoriteList);
            }
        }
    }
    Rectangle {
        id: recent
        width: parent.width - all.width - fave.width
        height: parent.height
        x: parent.width - recent.width
        color: "#777777"
        Text {
            anchors.centerIn: parent
            text: "Recent"
            font.pixelSize: 24
            color: "#CCCCCC"
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                if (window.pageStack.currentPage != recentList)
                    window.pageStack.replace(recentList);
            }
        }
    }
    */
    color: "#CCCCCC"
    ButtonRow {
        id: row
        checkedButton: all
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
            text: "All"
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
