import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Qt.labs.qmlmodels

Flickable {
    id: root

    Page {
        id: page
        anchors.fill: parent 
        background: Rectangle {
            color: '#005599'
        }

        ColumnLayout {
            id: tableLayout
            anchors.fill: parent

            TableView {
                id: tableBody
                anchors.fill: parent

                model: TableModel {
                }
            }
        }
    }
}