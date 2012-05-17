// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import com.nokia.symbian 1.1

QueryDialog {
    id: errorDialog
    titleText: "Error"
    message: "Cannot play current station.\nCheck your internet connection.\n"
    acceptButtonText: "Ok"
}
