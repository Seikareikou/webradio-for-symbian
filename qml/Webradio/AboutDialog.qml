import QtQuick 1.1
import com.nokia.symbian 1.1

QueryDialog {
    id: aboutDialog
    titleText: "Webradio: yar.fruct.org"
    icon: ":Webradio80.png"
    message: "Ivan Kornilov:\nvano468@gmail.com\n\nMurad Yusufov:\nflood4life@gmail.com\n"
    TextField {
                    id: edPassword
                    anchors.left:  parent.left
                    anchors.right: parent.right
                    echoMode: showClearPassword ? TextInput.Normal : TextInput.Password
                    placeholderText: qsTr( "Enter password" )
                    onTextChanged: hintArea.state = "Hide"
                }
    acceptButtonText: "Close"
}
