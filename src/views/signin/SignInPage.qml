import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import '../../js.js' as JS

Flickable {
    id: root

    Page {
        id: page
        anchors.fill: parent 
        background: Rectangle {
            color: '#005599'
        }
        
        ColumnLayout {
            width: parent.width
            spacing: 0

            Text {
                text: 'RichillCapital BotEngine Desktop'
            }

            Button {
                text: 'Sign-In with Microsoft'
                onClicked: JS.switchPage(botsPage)
            }
            
            Button {
                text: 'Sign-In with Google'
                onClicked: JS.switchPage(botsPage)
            }
        }
    }
}