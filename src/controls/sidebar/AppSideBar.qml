

import QtQuick
import QtQuick.Controls
import QtQuick.Window
import QtQuick.Layouts


Item {
    id: root

    implicitHeight: Window.height
    implicitWidth: this.closedWidth

    Pane {
        id: container 
        anchors.fill: parent
        padding: 0
        background: RowLayout {
            spacing: 0
            Rectangle {
                Layout.fillWidth: true
                Layout.fillHeight: true
                color: '#223322'
            }
            Rectangle {
                Layout.fillWidth: true
                Layout.fillHeight: true
                color: '#489661'
            }
        }

        Flickable {
            id: flickable
            anchors.fill: parent
            contentHeight: layout.implicitHeight

            ColumnLayout {
                id: layout
                width: parent.width
                height: container.height
                spacing: 0

                RowLayout {
                    id: logo
                }

                Rectangle {
                    id: topSeparator 
                    Layout.fillWidth: true
                    Layout.preferredHeight: 2
                    Layout.topMargin: 15
                    color: '#ffffff'
                }

                SideBarItem {
                    id: botsItem
                    Layout.topMargin: 16
                    Layout.leftMargin: 10
                    imageWidth: 31
                    imageUrl: '../../../static/logo.png'
                    text: 'Bots'
                }

                SideBarItem {
                    id: monitorItem
                    Layout.topMargin: 16
                    Layout.leftMargin: 10
                    imageWidth: 31
                    imageUrl: '../../../static/logo.png'
                    text: 'Monitor'
                }

                SideBarItem {
                    id: analyzerItem
                    Layout.topMargin: 16
                    Layout.leftMargin: 10
                    imageWidth: 31
                    imageUrl: '../../../static/logo.png'
                    text: 'Analyzer'
                }       

                SideBarItem {
                    id: settingsItem
                    Layout.topMargin: 16
                    Layout.leftMargin: 10
                    imageWidth: 31
                    imageUrl: '../../../static/logo.png'
                    text: 'Settings'
                }          

                SideBarItem {
                    id: quitItem
                    Layout.topMargin: 16
                    Layout.leftMargin: 10
                    imageWidth: 31
                    imageUrl: '../../../static/logo.png'
                    text: 'Quit'
                }                                                             
            }
        }
    }
    QtObject {
        id: this
        property int openedWidth: 232
        property int closedWidth: 72
        property bool isOpened: false

        property SideBarItem defaultItem
    }
}