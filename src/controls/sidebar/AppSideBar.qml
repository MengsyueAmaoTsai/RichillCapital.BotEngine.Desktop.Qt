
import QtQuick 
import QtQuick.Controls
import QtQuick.Window
import QtQuick.Layouts


Item {
    id: root
    
    Pane {
        id: container
        anchors.fill: parent 
        padding: 0
        background: RowLayout {
            spacing: 0
            Rectangle {
                Layout.fillWidth: true
                Layout.fillHeight: true
                color: '#111111'
            }
            Rectangle {
                Layout.fillWidth: true
                Layout.fillHeight: true
                color: '#999999'
            }
        }

        Flickable {
            id: flick

            ColumnLayout {
                id: layout 
                width: parent.width
                height: container.height
                spacing: 0

                SideBarItem {
                    id: botsItem
                    text: 'Bots'
                    onClicked: () => {
                        console.log('bots')
                    }
                }

                SideBarItem {
                    id: monitorItem
                    text: 'Monitor'
                    onClicked: () => {
                        console.log('monitor')
                    }
                }    

                SideBarItem {
                    id: analyzerItem
                    text: 'Analyzer'
                    onClicked: () => {
                        console.log('analyzer')
                    }
                }                                     
            }
        }
    }
}