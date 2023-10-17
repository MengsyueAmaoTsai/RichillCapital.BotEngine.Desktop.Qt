
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    id: root
    implicitHeight: 44
    implicitWidth: 200

    property string text 
    
    signal clicked()


    Pane {
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

                Image {
                    id: icon
                    // sourceSize.width: root.imageWidth
                    sourceSize.height: root.imageHeight
                    // fillMode: 
                    anchors.centerIn: parent
                    antialiasing: false
                }
            }

            Label {
                id: label
                Layout.leftMargin: 10
                visible: true
                text: 'text'
                // font.pointSize: 13
                // font.weight: Font.Medium
                // opacity: root.textOpacity
            }
        }
    }

    MouseArea {
        anchors.fill: parent 
        onClicked: root.clicked() 
    }
    

}