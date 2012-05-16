// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import com.nokia.symbian 1.1

Dialog {
    id: errorDialog
    title:
        Text {
            text: "Error"
            color: "white"
            anchors.centerIn: parent
        }
    content:
        Item {
            id: name
            height: 50
            width: parent.width
            Text {
                font.pixelSize: 28
                color: "white"
                text: "Cannot play current station.<br />Check your connection."
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
