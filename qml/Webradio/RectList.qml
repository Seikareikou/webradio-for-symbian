// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Rectangle {
    id: listRect

    property variant model
    property variant delegate
    property variant fRadio

    width: parent.width
    height: parent.height - tabs.height
    y: tabs.height
    z: 0
    clip: true
    color: "#CCCCCC"
    ListView {
        id: listView
        anchors.fill: parent
        model: parent.model
        delegate: parent.delegate
        highlight: Rectangle {
            width: listRect.width
            height: 95
            color: "lightblue"
        }

        focus: false
        MouseArea {
            anchors.fill: parent
            onClicked: {
                listView.currentIndex = listView.indexAt(mouseX, listView.contentY + mouseY);
                if (listRect.fRadio == true) {
                    var _query;
                    _query = "/database/" + xmlRadio.get(listView.currentIndex).genre_name;
                    window.pageStack.push(Qt.resolvedUrl("StationList.qml"), {query: _query})
                }
                else {
                    player.stop();
                    window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"));
                    player.source = xmlStation.get(listView.currentIndex).radio_url;
                    player.play();
                }
            }
        }
    }
}
