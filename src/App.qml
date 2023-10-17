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
import "./controls/sidebar" 1.0 as SideBar
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

                Flickable {
                    id: flickable
                    flickableDirection: Filickable.VerticalFlick
                    boundsMovement: Flickable.StopAtBonds
                    maximumFlickVelocity: 1000
                    flickDeceleration: 5000
                    anchors.fill: parent
                    contentHeight: layout.implicitHeight

                    ColumnLayout {
                        SideBar.SideBarItem {
                            id: testSideBarItem
                            text: "Hello"
                            Layout.topMargin: 16
                            Layout.leftMargin: 10
                            // imageWidth: 31
                            // image: Icons.sidebarDownload

                            onClicked: console.log("CCCC")
                        }

                        Rectangle {
                            id: smallSeperator1
                            Layout.preferredWidth: parent.width * 0.61
                            Layout.preferredHeight: 2
                            Layout.alignment: Qt.AlignHCenter
                            Layout.topMargin: 16

                        }
                        
                        SideBar.SideBarItem {
                            id: testSideBarItem2
                            text: "Hello2"
                            Layout.topMargin: 16
                            Layout.leftMargin: 10
                            // imageWidth: 31
                            // image: Icons.sidebarDownload

                            onClicked: console.log("CCCC2")
                        }                        
                    }
                }
            }
        }
    }
}
