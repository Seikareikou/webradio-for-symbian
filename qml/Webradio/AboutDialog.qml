// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import com.nokia.symbian 1.1

Dialog {
    id: aboutDialog
    title:
        Text {
            text: "About"
            color: "white"
            anchors.centerIn: parent
        }

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
                text: "yar.fruct.org"
            }
        }
    buttons:
        ButtonRow {
            anchors.horizontalCenter: parent.horizontalCenter
            width: 100
            Button {
                text: "OK";
                onClicked: aboutDialog.accept()
            }
        }
}
