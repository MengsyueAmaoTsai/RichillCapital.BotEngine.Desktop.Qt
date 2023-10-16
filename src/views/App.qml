//#region Qt Imports 

import QtQuick 
import QtQuick.LocalStorage
import QtQuick.Particles 
import QtQuick.Controls
import QtQuick.Layouts 
// import QtQuick.Tests
import QtQuick.Effects
import QtQuick.Window
import QtQuick.Controls.Fusion
import Qt.labs.qmlmodels
import QtTest
//#endregion

//#region Custom Imports
import "../controls" 1.0 as Controls


//#endregion
ApplicationWindow {
    id: root
    width: Screen.width * 0.8
    height: Screen.height * 0.8
    visible: true

    menuBar: Controls.AppMenuBar {
    }

    Button {
        id: button
        width: 36
        height: 36
        text: "Hello"
        background: Rectangle {
            implicitHeight: 32
            implicitWidth: 32
            color: button.pressed ? "dodgerblue" : "transparent" 
        }
        anchors.fill: parent

        contentItem: Text {
            text: button.text
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.family: "Microsoft Jheng Hei UI"
            font.pixelSize: 36 
            color: button.pressed ? "white" : (button.hovered ? "dodgerblue" : "white")
            renderType: Text.NativeRendering
        }
    }
}
