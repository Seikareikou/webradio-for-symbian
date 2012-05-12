// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import com.nokia.extras 1.1
import com.nokia.symbian 1.1

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
    Connections {
        target: player
        onAudioChanged: {
            waitBanner.close();
            window.pageStack.push(radioPlayer);
            player.addToRecent();
        }
    }
    Timer {
        id: errorChecker
        interval: 2000
        onTriggered: {
            if (!player.checkPlayerError()) {
                player.playing = false;
                waitBanner.close();
                errorDialog.open();
            }
        }
    }
    Dialog {
        id: errorDialog
        content:
            Item {
                id: name
                height: 50
                width: parent.width
                Text {
                    id: text
                    font.pixelSize: 30
                    anchors.centerIn: parent
                    color: "white"
                    text: "Cannot play current station."
                }
            }
        buttons:
            ButtonRow {
                anchors.horizontalCenter: parent.horizontalCenter
                width: 100

                Button {
                    text: "OK";
                    onClicked: errorDialog.accept()
                }
            }
    }
    InfoBanner {
        id: waitBanner
        timeout: 0
        height: 90
        Text {
            text: "<b>Loading. Please wait.</b>"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 30
            color: "white"
        }
    }
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
                    player.url  = xmlStation.get(listView.currentIndex).radio_url;
                    player.name = xmlStation.get(listView.currentIndex).radio_name;
                    player.playing = true;
                    errorChecker.start();
                    waitBanner.open();
                    break;
                }
                case 2:
                {
                    player.playing = false;
                    player.url  = xmlFave.get(listView.currentIndex).url;
                    player.name = xmlFave.get(listView.currentIndex).name;
                    player.playing = true;
                    errorChecker.start();
                    waitBanner.open();
                    break;
                }
                case 3:
                {
                    player.playing = false;
                    player.url  = xmlRecent.get(listView.currentIndex).url;
                    player.name = xmlRecent.get(listView.currentIndex).name;
                    player.playing = true;
                    errorChecker.start();
                    waitBanner.open();
                    break;
                }
                default:
                    break;
                }
            }
        }
    }
}
