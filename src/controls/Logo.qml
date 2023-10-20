import QtQuick 
import QtQuick.Layouts


Item {
    id: root
    implicitHeight: 72
    implicitWidth: 72

    Rectangle {
        id: outerRectangle
        anchors.fill: parent
        radius: 4
        antialiasing: true

        Rectangle {
            id: innerRectangle
            width: parent.width / 2
            height: parent.height / 2
            anchors.centerIn: parent
            radius: width / 7
            antialiasing: true
        }
    }
}