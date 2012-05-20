import QtQuick 1.1
import com.nokia.symbian 1.1

QueryDialog {
    titleText: "Web Radio"
    message: "Are you sure you want to quit?\n"
    acceptButtonText: "Yes"
    rejectButtonText: "No"
    onAccepted: Qt.quit()
}
