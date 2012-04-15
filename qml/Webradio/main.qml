import QtQuick 1.0
import QtMultimediaKit 1.1

Rectangle {
    XmlListModel {
         id: xmlModel
         source: "http://dir.xiph.org/yp.xml"
         query: "/directory/entry"

         XmlRole { name: "server_name";  query: "server_name/string()"  }
         XmlRole { name: "listen_url";   query: "listen_url/string()"   }
         XmlRole { name: "server_type";  query: "server_type/string()"  }
         XmlRole { name: "genre";        query: "genre/string()"        }
         XmlRole { name: "current_song"; query: "current_song/string()" }
    }
    ListView {
        id: listView
        anchors.fill: parent
        model: xmlModel
        delegate: station
        highlight: Rectangle {
            color: "lightsteelblue";
            radius: 7
        }
        focus: false
        MouseArea {
            anchors.fill: parent
            onClicked: {
                listView.currentIndex = listView.indexAt (mouseX, listView.contentY + mouseY)
                console.debug(xmlModel.get(listView.currentIndex).server_name);
                player.stop();
                player.source = xmlModel.get(listView.currentIndex).listen_url;
                player.play();
            }
        }
    }
    Component {
        id: station
        Item {
            width: parent.width ; height: 55
            Column {
                Text { text: '<b>Name:</b> ' + server_name }
                Text { text: '<b>Song:</b> ' + current_song }
            }
        }
    }
    Audio {
        id: player
    }
}
