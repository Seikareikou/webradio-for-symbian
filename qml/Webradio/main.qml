import QtQuick 1.0
import QtMultimediaKit 1.1

Rectangle {
    XmlListModel {
         id: xmlRadio
         source: "database.xml"
         query: "/database/radio"

         XmlRole { name: "genre_name";  query: "name/string()" }
    }
    XmlListModel {
         id: xmlStations

         XmlRole { name: "radio_name"; query: "name/string()" }
         XmlRole { name: "radio_url";  query: "url/string()"  }
    }
    ListView {
        id: listView
        anchors.fill: parent
        model: xmlRadio
        delegate: genreListView
        highlight: Rectangle {
            color: "lightsteelblue";
            radius: 7
        }
        focus: false
        MouseArea {
            anchors.fill: parent
            onClicked: {
                listView.currentIndex = listView.indexAt(mouseX, listView.contentY + mouseY);
                if (listView.model == xmlRadio) {
                    xmlStations.query = "/database/" + xmlRadio.get(listView.currentIndex).genre_name;
                    xmlStations.source = xmlRadio.source;
                    listView.model = xmlStations;
                    listView.delegate = radioListView;
                }
                if (listView.model == xmlStations) {
                    player.stop();
                    player.source = xmlStations.get(listView.currentIndex).radio_url;
                    player.play();
                }
            }
        }
    }
    Component {
        id: genreListView
        Item {
            width: parent.width ; height: 25
            Column {
                Text { text: "<b>" + genre_name + "</b>"}
            }
        }
    }
    Component {
        id: radioListView
        Item {
            width: parent.width ; height: 25
            Column {
                Text { text: "<b>" + radio_name + "</b>"}
            }
        }
    }
    Audio {
        id: player
    }
}
