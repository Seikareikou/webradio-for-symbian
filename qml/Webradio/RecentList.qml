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

             XmlRole { name: "radio_name";  query: "@name/string()" }
             XmlRole { name: "radio_url";  query: "@url/string()" }
        }
        StationListView {
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
