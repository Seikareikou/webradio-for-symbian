// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import QtMultimediaKit 1.1

Rectangle {
    id: radioRect
    visible: true
    anchors.fill: parent
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
        height: 60
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
        id: listRect
        width: parent.width
        height: parent.height - tabs.height
        y: tabs.height
        z: 0
        clip: true
        color: "#CCCCCC"
        ListView {
            id: listView
            anchors.fill: parent
            model: xmlRadio
            delegate: genreListView
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
                    if (listView.model == xmlRadio) {
                        xmlStations.query = "/database/" + xmlRadio.get(listView.currentIndex).genre_name;
                        xmlStations.source = xmlRadio.source;
                        listView.model = xmlStations;
                        listView.delegate = radioListView;

                        buttonBackRadio.visible = true;
                        listRect.height -= buttonBackRadio.height;
                    }
                    else {
                        player.stop();
                        player.source = xmlStations.get(listView.currentIndex).radio_url;
                        player.play();

                        playerRect.visible = true;
                        radioRect.visible = false;
                    }
                }
            }
        }
    }
    Rectangle {
        id: buttonBackRadio
        visible: false
        width: parent.width
        height: parent.height * 0.11 < 60 ? 60 : parent.height * 0.11
        y: parent.height - height
        z: 1
        color: "#112233"
        Text {
                anchors.centerIn: parent
                text: "Back"
                color: "#6699FF"
                font.pixelSize: parent.height * 0.4
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                listView.model = xmlRadio;
                listView.delegate = genreListView;
                listRect.height += buttonBackRadio.height
                buttonBackRadio.visible = false
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
                    font.pixelSize: 36
                    font.family: "Helvetica"
                    color: "darkblue"
                }
            }
            Rectangle {
                width: parent.width
                height: 1
                border.color: "#AAAAAA"
                border.width: 2
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
                    font.pixelSize: 36
                    color: "#111155"
                }
            }
            Rectangle {
                width: parent.width
                height: 1
                border.color: "#AAAAAA"
                border.width: 2
            }
        }
    }
    Audio {
        id: player
    }
}
