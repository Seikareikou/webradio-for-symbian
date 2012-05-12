// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import com.nokia.symbian 1.1

Page {
    id: recentList
    tools: toolBarLayout

    onStatusChanged: {
        xmlRecent.reload();
    }

    Rectangle {
        id: recentRect
        anchors.fill: parent
        XmlListModel {
             id: xmlRecent
             source: "recent.xml"
             query: "/database/station"

             XmlRole { name: "name";  query: "@name/string()" }
             XmlRole { name: "url";  query: "@url/string()" }
        }
        RadioListView {
            id: recentListView
        }

        Tabs {
            id: tabs
        }
        RectList {
            model: xmlRecent
            delegate: recentListView
            fRadio: 3
        }
    }
}
