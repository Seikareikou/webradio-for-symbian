import QtQuick 1.0
import QtMultimediaKit 1.1

Rectangle {
    XmlListModel {
         id: xmlGenres
         source: "http://dl.dropbox.com/u/72655866/database.xml"
         query: "/database/genre"

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
        model: xmlGenres
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
                if (listView.model == xmlGenres) {
                    xmlStations.query = "/database/" + xmlGenres.get(listView.currentIndex).genre_name;
                    xmlStations.source = xmlGenres.source;
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
