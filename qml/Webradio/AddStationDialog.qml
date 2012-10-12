import QtQuick 1.1
import com.nokia.symbian 1.1

QueryDialog {
    id: addStation
    titleText: "Add your station"
    acceptButtonText: "Add"
    rejectButtonText: "Close"
    content:
        Item {
            id: stationName
            width: parent.width
            TextInput {
                id: textInput
                text: "name"
                color: "white"
                activeFocusOnPress: false
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if (!textInput.activeFocus) {
                            textInput.forceActiveFocus();
                            textInput.openSoftwareInputPanel();
                            textInput.text = ""
                        } else textInput.focus = false;
                    }
                    onPressAndHold: textInput.closeSoftwareInputPanel();
                }
            }

        }

}
