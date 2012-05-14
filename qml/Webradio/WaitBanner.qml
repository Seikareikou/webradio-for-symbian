// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import com.nokia.extras 1.1

InfoBanner {
    id: waitBanner
    timeout: 0
    height: 90
    Text {
        text: "<b>Loading. Please wait.</b>"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        font.pixelSize: 30
        color: "white"
    }
}
