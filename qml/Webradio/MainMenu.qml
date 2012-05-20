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
