//#region Qt Imports 

import QtQuick 
import QtQuick.LocalStorage
import QtQuick.Particles 
import QtQuick.Controls
import QtQuick.Layouts 
// import QtQuick.Tests
import QtQuick.Effects
import QtQuick.Window
// import QtQuick.Controls.Fusion
import Qt.labs.qmlmodels
import QtTest
//#endregion

//#region Custom Imports
// import "./controls" 1.0 as Controls
import AppViewModel 

//#endregion
ApplicationWindow {
    id: root
    visible: true
    visibility: Window.Maximized
    width: Screen.width * 0.8
    height: Screen.height * 0.8
    minimumHeight: 400
    minimumWidth: 650

    // Python Types
    AppViewModel {
        id: viewModel
        value: "New value"
    }

    // UI 
    Item {
        id: sidebar
        implicitHeight: Window.height
        // implicitWidth: 

        Pane {
            id: sidebarContainer
            anchors.fill: parent
            padding: 0
            background: RowLayout {
                spacing: 0

                Rectangle {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    // color:
                }

                Rectangle {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    // color:
                }
            }
        }
    }
}
