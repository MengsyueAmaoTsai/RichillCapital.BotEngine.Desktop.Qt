import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Item {
    id: root
    property int currentSidebarWidth
    property int closedSidebarWidth
    property int arrowRotation
    signal clicked    
    implicitWidth: root.closedSidebarWidth
    implicitHeight: 60

    Pane {
        id: container
        padding: 0
        anchors.fill: parent
        background: Rectangle { 
            color: 'transparent' 
        }

        RowLayout {
            width: root.currentSidebarWidth + expandButton.width / 2.2
            height: parent.height
            spacing: 0

            Rectangle {
                id: profilePicture
                Layout.preferredWidth: 36
                Layout.preferredHeight: 36
                Layout.alignment: Qt.AlignVCenter
                Layout.leftMargin: 18
                radius: width
                antialiasing: true

                Label {
                    id: initials
                    anchors.centerIn: parent
                    visible: true
                    text: 'Amao'
                    font.pointSize: 12
                    font.bold: true
                }
                Image {
                    id: profileImage
                    visible: true
                }                
                MouseArea {
                    anchors.fill: parent
                    onClicked: root.clicked()
                }                
            }

            Rectangle {
                id: expandButton
                Layout.preferredWidth: 23
                Layout.preferredHeight: 24
                Layout.alignment: Qt.AlignVCenter | Qt.AlignRight
                opacity: expandButtonMouseArea.pressed ? 0.8 : 1
                radius: 2
                border.width: 1
                
                Image {
                    id: arrowImage
                    rotation: root.arrowRotation
                    sourceSize.width: 20
                    sourceSize.height: 20
                    anchors.centerIn: parent
                    source: '../../../static/images/arrows/arrowhead_next_icon.svg'
                    cache: false
                }                

                MouseArea {
                    id: expandButtonMouseArea
                    anchors.fill: parent
                    onClicked: () => {
                        sidebar.open();
                    }
                }                   
            }
        }
    }    
}