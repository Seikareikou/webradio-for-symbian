import QtQuick 1.1
import com.nokia.symbian 1.1

QueryDialog {
    titleText: "Delete station"
    message: "Are you sure?\n"
    acceptButtonText: "Yes"
    rejectButtonText: "No"
    icon: ":Webradio80.png"
    onAccepted: {
        var url, name;
        url = xmlFave.get(listView.currentIndex).radio_url;
        name = xmlFave.get(listView.currentIndex).radio_name;
        player.addToFavorites(name, url)
        xmlFave.reload()
    }
}
