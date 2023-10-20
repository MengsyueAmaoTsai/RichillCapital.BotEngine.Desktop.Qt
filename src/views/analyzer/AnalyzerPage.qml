
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Window

Flickable {
    id: root

    property bool sidebarEnabled: true
    Page {
        id: page
        anchors.fill: parent
        background: Rectangle {
            color: '#999999'
        }
    }
}