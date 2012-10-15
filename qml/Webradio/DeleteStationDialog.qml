import QtQuick 1.1
import com.nokia.symbian 1.1

QueryDialog {
    titleText: "Delete station"
    message: "Are you sure?\n"
    acceptButtonText: "Yes"
    rejectButtonText: "No"
    icon: ":Webradio80.png"
    onAccepted: {
        Qt.quit()
    }
}
