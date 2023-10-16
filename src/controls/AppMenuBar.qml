
import QtQuick 
import QtQuick.Layouts 
import QtQuick.Controls.Basic


MenuBar {
    id: root

    Menu {
        title: qsTr("&File")
        MenuSeparator {}
        Action { text: qsTr("&Quit"); onTriggered: Qt.quit() }
    }
}