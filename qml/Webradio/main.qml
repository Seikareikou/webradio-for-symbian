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
    Rectangle {
        id: tabs
        width: parent.width
        height: 80
        color: "#222222"
        clip: true
        Rectangle {
            id: tab1
            width: parent.width/3
            height: parent.height
            x: 0
            color: "#333333"
        }
        Rectangle {
            id: tab2
            width: parent.width/3
            height: parent.height
            x: tab1.width
            color: "#555555"
        }
        Rectangle {
            id: tab3
            width: parent.width - tab1.width - tab2.width
            height: parent.height
            x: parent.width - tab3.width
            color: "#777777"
        }
    }

    Rectangle {
        width: parent.width
        height: parent.height - tabs.height - buttonBack.height
        y: 80
        z: 0
        clip: true
        color: "#CCCCCC"
        ListView {
            id: listView
            anchors.fill: parent
            model: xmlRadio
            delegate: genreListView
            highlight: Rectangle {
                color: "#55AAFF"
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
        Rectangle {
            id: buttonBack
            width: parent.width
            height: 80
            y: listView.y + listView.height
            z: 1
            color: "#112233"
            Text {
                    anchors.centerIn: parent
                    text: "Back"
                    color: "#6699FF"
                    font.pointSize: 36
            }
        }
    }
    Component {
        id: genreListView
        Item {
            width: parent.width
            height: 95
            Column {
                anchors.verticalCenter: parent.verticalCenter
                Text {
                    text: "<b>" + genre_name + "</b>"
                    x: 10
                    font.pointSize: 36
                    font.family: "Helvetica"
                    color: "darkblue"
                }
            }
        }
    }
    Component {
        id: radioListView
        Item {
            width: parent.width
            height: 80
            Column {
                anchors.verticalCenter: parent.verticalCenter
                Text {
                    text: "<b>" + radio_name + "</b>"
                    x: 10
                    font.pointSize: 36
                    color: "#111155"
                }
            }
            Rectangle {
                width: parent.width
                height: 1
                border.color: "black"
                border.width: 1
            }
        }
    }
    Audio {
        id: player
    }
}
