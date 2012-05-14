// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import com.nokia.symbian 1.1

Menu {
    id: mainMenu
    content: MenuLayout {
        MenuItem {
            text: "About"
            onClicked: aboutDialog.open()
        }
        MenuItem {
            text: "Exit"
            onClicked: Qt.quit()
        }
    }
}
