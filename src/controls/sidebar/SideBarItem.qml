import QtQuick
import QtQuick.Controls
import QtQuick.Layouts


Item {
    id: root
    property bool selected: false
    property string text
    property string imageUrl
    property int imageWidth: 30
    property int imageHeight
    property bool preserveImageFit: true

    signal clicked()

    implicitHeight: 44
    implicitWidth: internal.closedWidth

    Pane {
        id: container 
        anchors.fill: parent
        padding: 0
        background: Rectangle {
            color: '#555555'
        }

        RowLayout {
            id: layout
            height: parent.height
            spacing: 0

            Rectangle {
                id: imageContainer 
                Layout.preferredWidth: 52
                Layout.preferredHeight: 44
                radius: 4
                color: 'transparent'

                Image {
                    id: icon
                    sourceSize.width: root.imageWidth
                    sourceSize.height: root.imageHeight
                    fillMode: root.preserveImageFit ? Image.PreserveAspectFit : Image.Stretch
                    anchors.centerIn: parent
                    source: root.imageUrl
                    antialiasing: false
                }
            }

            Label {
                id: label
                Layout.leftMargin: 10
                text: root.text
                visible: true
                font.weight: Font.Medium
                font.pointSize: 14
            }
        }
    }
    
    QtObject {
        id: internal 
        property int openedWidth: 177
        property int closedWidth: 52
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
}