

import QtQuick
import QtQuick.Controls
import QtQuick.Window
import QtQuick.Layouts

import '../'
import '../../js.js' as JS

Item {
    id: root

    property SideBarItem currentItem: internal.defaultItem
    property bool isOpened: false

    implicitHeight: Window.height
    implicitWidth: internal.closedWidth

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
            flickableDirection: Flickable.VerticalFlick
            boundsMovement: Flickable.StopAtBounds
            maximumFlickVelocity: 1000
            flickDeceleration: 5000

            ColumnLayout {
                id: layout
                width: parent.width
                height: container.height
                spacing: 0

                RowLayout {
                    id: logo
                    Layout.topMargin: 14
                    Layout.leftMargin: 14
                    spacing: 20

                    Logo {
                        id: icon
                        Layout.preferredWidth: 44
                        Layout.preferredHeight: 44
                    }

                    Label {
                        id: logoLabel
                        visible: false
                        text: 'BotEngine Desktop'
                        font.bold: true
                        font.pointSize: 16
                    }
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

                    onClicked: () => {
                        JS.switchPage(botsPage)
                        changeSelectedItem(botsItem)
                    }
                }

                SideBarItem {
                    id: monitorItem
                    Layout.topMargin: 16
                    Layout.leftMargin: 10
                    imageWidth: 31
                    imageUrl: '../../../static/logo.png'
                    text: 'Monitor'
                    onClicked: () => {
                        JS.switchPage(monitorPage)
                        changeSelectedItem(monitorItem)
                    }
                }

                SideBarItem {
                    id: analyzerItem
                    Layout.topMargin: 16
                    Layout.leftMargin: 10
                    imageWidth: 31
                    imageUrl: '../../../static/logo.png'
                    text: 'Analyzer'
                    onClicked: () => {
                        JS.switchPage(analyzerPage)
                        changeSelectedItem(analyzerItem)
                    }
                }       

                SideBarItem {
                    id: preferencesItem
                    Layout.topMargin: 16
                    Layout.leftMargin: 10
                    imageWidth: 31
                    imageUrl: '../../../static/logo.png'
                    text: 'Preferences'
                    onClicked: () => {
                        JS.switchPage(preferencesPage)
                        changeSelectedItem(preferencesItem)
                    }
                }          

                SideBarItem {
                    id: quitItem
                    Layout.topMargin: 16
                    Layout.leftMargin: 10
                    imageWidth: 31
                    imageUrl: '../../../static/logo.png'
                    text: 'Quit'
                    onClicked: () => {
                        changeSelectedItem(quitItem)
                    }
                }                

                Rectangle {
                    id: bottomSeparator
                    Layout.fillWidth: true
                    Layout.preferredHeight: 2
                    color: '#ffffff'
                }

                ProfileBox {
                    id: profileBox
                    currentSidebarWidth: root.width
                    closedSidebarWidth: internal.closedWidth
                    Layout.alignment: Qt.AlignBottom
                    Layout.topMargin: 2

                    onClicked: () => {
                        if(profilePopup.opened)
                            profilePopup.close();
                        else
                            profilePopup.open();
                    }                    
                }

                ProfilePopup {
                    id: profilePopup
                    x: 12
                    y: profileBox.y - implicitHeight + 6
                } 
            }
        }

        SideBarAnimations {
            id: animations
            // sidebar: root
            closedSidebarWidth: internal.closedWidth
            openedSidebarWidth: internal.openedWidth
        }
    }

    QtObject {
        id: internal
        property int openedWidth: 232
        property int closedWidth: 72
        property bool isOpened: false

        property SideBarItem defaultItem: botsItem
    }

    Shortcut {
        sequence: "Ctrl+O"
        onActivated: () => {
            root.open()
        }
    }    

    Component.onCompleted: () => {
        root.changeSelectedItem(botsItem)
    }

    function changeSelectedItem(item: SideBarItem) {
        root.currentItem.selected = false
        root.currentItem = item
        root.currentItem.selected = true
    }

    function open() {
        animations.openAnimation.start()
        root.currentItem.openAnimation.start()
        root.isOpened = true
        console.log(root.isOpened)
    }

    function close() {
        animations.closeAnimation.start()
        root.currentItem.closeAnimation.start()
        root.isOpened = false
        console.log(root.isOpened)
    }

    function reset() {
        close();
        changeSelectedItem(internal.defaultItem);
        root.open = false;
    }
}