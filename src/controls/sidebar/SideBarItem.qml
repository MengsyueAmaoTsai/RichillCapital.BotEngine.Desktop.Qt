


import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    id: root

    property string text
    property bool selected: false
    
    property int imageWidth: 30
    property int imageHeight
    property bool preserveImageFit: true
    property alias openAnimation: openAnimation
    property alias closeAnimation: closeAnimation
    property alias labelVisibility: label.visible
    property real textOpacity: 0

    signal clicked()

    implicitWidth: (labelVisibility ? internal.openedWidth : internal.closedWidth)
    implicitHeight: 44
    
    Pane {
        id: container 
        anchors.fill: parent
        padding: 0
        background: Rectangle {
            radius: 4
        }

        RowLayout {
            id: layout
            height: parent.height
            spacing: 0

            Rectangle {
                id: iconContainer
                Layout.preferredWidth: 52
                Layout.preferredHeight: 44
                radius: 4
                color: 'transparent'
            }

            Image {
                id: icon
                anchors.centerIn: parent
            }

            Label {
                id: label
                text: root.text
                Layout.leftMargin: 10
                visible: false
                font.weight: Font.Medium
                font.pointSize: 13
            }
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: root.clicked()
    }

    PropertyAnimation {
        id: openAnimation
        target: container
        property: "width"
        to: internal.openedWidth
        duration: 250
        easing.type: Easing.InOutQuad
    }
    
    PropertyAnimation {
        id: closeAnimation
        target: container
        property: "width"
        to: internal.closedWidth
        duration: 250
        easing.type: Easing.InOutQuad
    }

    QtObject {
        id: internal
        property int closedWidth: 52
        property int openedWidth: 177
    }
}