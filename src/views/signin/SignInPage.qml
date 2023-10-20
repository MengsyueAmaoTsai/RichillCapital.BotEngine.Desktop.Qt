
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Window

import '../../js.js' as JS

Flickable {
    id: root
    
    property bool sidebarEnabled: false
    
    Page {
        id: page
        anchors.fill: parent
        background: {
            color: '#999999'
        }

        ColumnLayout {
            id: layout
            anchors.centerIn: parent
            width: 544

            Label {
                text: 'RichillCapital BotEngine Desktop'
            }

            Button {
                text: 'Sign-in with Microsoft'
                onClicked: () => {
                    JS.switchPage(botsPage)
                }                
            }
            Button {
                text: 'Sign-in with Google'
                onClicked: () => {
                    JS.switchPage(botsPage)
                }                
            }
        }
    }
}