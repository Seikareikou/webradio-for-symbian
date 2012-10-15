import QtQuick 1.1
import com.nokia.symbian 1.1

QueryDialog {
    id: addStation
    titleText: "Add custom station"
    acceptButtonText: "Add"
    rejectButtonText: "Cancel"
    icon: ":Webradio80.png"
    content:
    Item {
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        height: itemName.height + itemUrl.height + 40
        AddStationDialogItem {
            id: itemName
            anchors.top: parent.top
            text: "Name:"
        }
        AddStationDialogItem {
            id: itemUrl
            anchors.top: itemName.bottom
            text: "URL: "
            anchors.bottomMargin: 30
            anchors.bottom: parent.bottom
        }
    }
    onAccepted: {
        if (itemName.inputData != "" && itemUrl.inputData != "")
            player.addToFavorites(itemName.inputData, itemUrl.inputData)
        xmlFave.reload()
    }
}
