import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Item {
    id: root
    property int currentSidebarWidth
    property int closedSidebarWidth
    property int arrowRotation
    signal clicked    
    implicitWidth: root.closedSidebarWidth
    implicitHeight: 60

    Pane {
        id: container
        padding: 0
        anchors.fill: parent
        background: Rectangle { 
            color: 'transparent' 
        }

        RowLayout {
            width: root.currentSidebarWidth + expandButton.width / 2.2
            height: parent.height
            spacing: 0

            Rectangle {
                id: profilePicture
            }

            Rectangle {
                id: expandButton
            }
        }
    }    
}