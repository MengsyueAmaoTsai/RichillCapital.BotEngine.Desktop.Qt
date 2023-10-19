

import QtQuick
import QtQuick.Controls
import QtQuick.Window
import QtQuick.Layouts

import '../../js.js' as JS

Item {
    id: root

    implicitHeight: Window.height

    Pane {
        id: container
        anchors.fill: parent
        padding: 0
        background: RowLayout {
        }

        Flickable {
            id: flick
            anchors.fill: parent 
            contentHeight: layout.implicitHeight

            ColumnLayout {
                id: layout
                width: parent.width
                height: container.height
                spacing: 0

                // LOGO PART
                RowLayout {
                    id: logo
                    Layout.topMargin: 14
                    Layout.leftMargin: 14
                    spacing: 20

                    // LOGO
                    Rectangle {
                        id: logoIcon 
                        Layout.preferredWidth: 44
                        Layout.preferredHeight: 44
                    }

                    Label {
                        id: logoLabel
                        visible: false 
                        font.bold: true
                        font.pointSize: 16
                    }
                }

                Rectangle {
                    id: topSeparator
                    Layout.fillWidth: true
                    Layout.preferredHeight: 2
                    Layout.topMargin: 15
                }

                SideBarItem {
                    id: strategiesItem
                    Layout.topMargin: 16
                    Layout.leftMargin: 10
                    implicitWidth: 31
                    text: 'Strategies'
                    onClicked: JS.switchPage(strategiesPage)
                }

                Button {
                    text: 'test button'
                }
            }
        }
    }
}