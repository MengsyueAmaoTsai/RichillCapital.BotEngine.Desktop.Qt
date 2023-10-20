import QtQuick 
import QtQuick.Layouts


Item {
    id: root
    implicitHeight: 72
    implicitWidth: 72

    Rectangle {
        id: outerRectangle
        anchors.fill: parent
        
        Rectangle {
            id: innerRectangle
            width: parent.width / 2
            height: parent.height / 2
        }
    }
}