import QtQuick 1.1
import com.nokia.symbian 1.1

Menu {
    id: mainMenu
    content: MenuLayout {
        MenuItem {
            text: "Add station"
            onClicked: addStation.open();
        }
        MenuItem {
            text: "About"
            onClicked: aboutDialog.open();
        }
        MenuItem {
            text: "Exit"
            onClicked: exitDialog.open();
        }
    }
}
