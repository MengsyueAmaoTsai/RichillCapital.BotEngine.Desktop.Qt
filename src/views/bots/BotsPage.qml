
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Window
import Qt.labs.qmlmodels

Flickable {
    id: root
    property bool sidebarEnabled: true

    Page {
        id: page
        anchors.fill: parent
        background: Rectangle {
            color: '#999999'
        }

        ColumnLayout {
            id: layout
            anchors.centerIn: parent
            width: 544

            Label {
                text: 'Bots'
                Layout.fillHeight: true
                Layout.fillWidth: true
                font.pointSize: 20
            }

            HorizontalHeaderView {
                id: tableHeader
                Layout.fillWidth: true
                Layout.fillHeight: true
                syncView: tableBody                
            }

            TableView {
                id: tableBody

                Layout.fillWidth: true
                Layout.fillHeight: true

                model: TableModel {
                    TableModelColumn {
                        display: 'id'
                    }
                    TableModelColumn {
                        display: 'name'
                    }
                    rows: [
                        {
                            "id": "id1",
                            "name": "name1"
                        },
                        {
                            "id": "id2",
                            "name": "name2"
                        },
                    ]
                }

                delegate: Rectangle {
                    Text {
                        text: display
                        anchors.centerIn: parent
                    }
                }
            }
        }
    }
}