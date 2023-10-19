import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    id: root

    property string text

    signal clicked()

    Pane {
        id: container
        anchors.fill: parent

        background: Rectangle {
            color: '#555555'
        }

        // Icon image
        Rectangle {
            id: iconContainer
            anchors.fill: parent
            color: '#990000'

            Image {
                id: icon
            }
        }

        // Icon body
        Label {
            id: label 
            visible: true
            text: root.text
            font.weight: Font.Medium
            font.pointSize: 13
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: root.clicked()
    }
}