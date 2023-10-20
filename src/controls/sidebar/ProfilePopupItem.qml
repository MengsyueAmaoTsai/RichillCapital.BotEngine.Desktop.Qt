
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls


Item {
    id: root
    property string imageUrl
    property int imageWidth: 15
    property string text
    property int textSpacing: 5
    signal clicked

    implicitHeight: layout.implicitHeight
    implicitWidth: 125

    RowLayout {
        id: layout
        anchors.fill: parent
        spacing: root.textSpacing
        opacity: mouseArea.pressed ? 0.8 : 1
        
        Image {
            id: icon
            source: root.imageUrl
            fillMode: Image.PreserveAspectFit
            sourceSize.width: root.imageWidth
        }
        
        Label {
            id: labels
            text: root.text
            color: '#ffffff'
            font.pointSize: 10.5
            font.weight: Font.Medium
        }
        
        Item { 
            Layout.fillWidth: true 
        }
    }

    MouseArea {
        id: mouseArea 
        anchors.fill: parent
        onClicked: () => {
            console.log("TEST")
            root.clicked()
        }
    }
}