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
    Connections {
        target: player
        ignoreUnknownSignals: true
        onAudioChanged: {
            if (!player.signalsFilter()) {
                waitBanner.close();
                window.pageStack.push(radioPlayer);
                player.addToRecent();
            }
        }
        onErrorFound: {
            if (!player.signalsFilter()) {
                if (window.pageStack.currentPage == radioPlayer)
                    window.pageStack.pop();
                player.playing = false;
                waitBanner.close();
                errorDialog.open();
            }
        }
        onStChanged: {
            if (!player.signalsFilter() &&
                window.pageStack.currentPage != radioPlayer) {
                waitBanner.open();
            }
        }
        onNetworkStatusChanged: {
            if (!player.signalsFilter()) {
                player.playing = false;
                networkError.open();
            }
        }
    }
    NetworkError {
        id: networkError
    }
    ErrorDialog {
        id: errorDialog
    }
    WaitBanner {
        id: waitBanner
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
                    break;
                }
                case 2:
                {
                    player.playing = false;
                    player.url  = xmlFave.get(listView.currentIndex).url;
                    player.name = xmlFave.get(listView.currentIndex).name;
                    player.playing = true;
                    break;
                }
                case 3:
                {
                    player.playing = false;
                    player.url  = xmlRecent.get(listView.currentIndex).url;
                    player.name = xmlRecent.get(listView.currentIndex).name;
                    player.playing = true;
                    break;
                }
                default:
                    break;
                }
            }
        }
    }
}
