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
                switch (listRect.fRadio) {
                case 0:
                {
                    var _query;
                    _query = "/database/" + xmlRadio.get(listView.currentIndex).id + "/station";
                    xmlStation.query = _query;
                    listRect.delegate = stationListView;
                    listRect.model = xmlStation;
                    listRect.fRadio = 1;
                    break;
                }
                case 1:
                {
                    player.playing = false;
                    window.pageStack.push(radioPlayer);
                    player.url  = xmlStation.get(listView.currentIndex).radio_url;
                    player.name = xmlStation.get(listView.currentIndex).radio_name;
                    player.playing = true;
                    player.addToRecent();
                    break;
                }
                case 2:
                {
                    player.playing = false;
                    window.pageStack.push(radioPlayer);
                    player.url  = xmlFave.get(listView.currentIndex).url;
                    player.name = xmlFave.get(listView.currentIndex).name;
                    player.playing = true;
                    player.addToRecent();
                    break;
                }
                case 3:
                {
                    player.playing = false;
                    window.pageStack.push(radioPlayer);
                    player.url  = xmlRecent.get(listView.currentIndex).url;
                    player.name = xmlRecent.get(listView.currentIndex).name;
                    player.playing = true;
                    player.addToRecent();
                    break;
                }
                default:
                    break;
                }
            }
        }
    }
}
