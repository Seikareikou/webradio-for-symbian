import QtQuick 1.1
import com.nokia.extras 1.1
import com.nokia.symbian 1.1

Rectangle {
    id: listRect

    property XmlListModel model : xmlRadio
    property Component delegate : radioListView
    property int fRadio         : 0

    width: parent.width
    height: parent.height - tabs.height
    y: tabs.height
    z: 0
    clip: true
    color: "#BBBBBB"
    Connections {
        target: player
        ignoreUnknownSignals: true
        onAudioChanged: {
            loadingIndicator.visible = false;
            if (!player.signalsFilter()) {
                window.pageStack.push(radioPlayer);
                player.addToRecent();
            }
        }
        onErrorFound: {
            loadingIndicator.visible = false;
            if (!player.signalsFilter()) {
                if (window.pageStack.currentPage == radioPlayer)
                    window.pageStack.pop();
                player.playing = false;
                player.clearData();
                errorDialog.open();
            }
        }
        onStChanged: {
            if (window.pageStack.currentPage != radioPlayer)
                loadingIndicator.visible = true;
        }
    }
    ErrorDialog {
        id: errorDialog
    }
    ListView {
        id: listView
        anchors.fill: parent
        model: parent.model
        delegate: parent.delegate
        highlightMoveDuration: 1
        highlight: Rectangle {
            width: listRect.width
            height: fRadio === 0 ? 95 : 80
            color: Qt.rgba(0.6, 0.6, 0.9, 0.7)
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
                    stationRectList.x = 0;
                    window.tabText = xmlRadio.get(listView.currentIndex).name;
                    break;
                }
                case 1:
                {
                    if (player.url != xmlStation.get(listView.currentIndex).radio_url || player.playing == false) {
                        player.playing = false;
                        player.url  = xmlStation.get(listView.currentIndex).radio_url;
                        player.name = xmlStation.get(listView.currentIndex).radio_name;
                        player.playing = true;
                    } else window.pageStack.push(radioPlayer);
                    break;
                }
                case 2:
                {
                    if (player.url != xmlFave.get(listView.currentIndex).radio_url || player.playing == false) {
                        player.playing = false;
                        player.url  = xmlFave.get(listView.currentIndex).radio_url;
                        player.name = xmlFave.get(listView.currentIndex).radio_name;
                        player.playing = true;
                    } else window.pageStack.push(radioPlayer);
                    break;
                }
                case 3:
                {
                    if (player.url != xmlRecent.get(listView.currentIndex).radio_url || player.playing == false) {
                        player.playing = false;
                        player.url  = xmlRecent.get(listView.currentIndex).radio_url;
                        player.name = xmlRecent.get(listView.currentIndex).radio_name;
                        player.playing = true;
                    } else window.pageStack.push(radioPlayer);
                    break;
                }
                default:
                    break;
                }
            }
        }
    }
}
