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
import './views/bots' 
import './views/signin' 

import './controls/sidebar'

import './js.js' as JS

import AppViewModel 

ApplicationWindow {
    id: root
    
    visible: true
    height: Screen.height * .8
    width: Screen.width * .8

    RowLayout {
        id: layout
        anchors.fill: parent
        spacing: 0

        AppSideBar {
            id: sidebar
            visible: true
            z: 1
        }

        StackView {
            id: content
            initialItem: signInPage
            Layout.fillWidth: true
            Layout.fillHeight: true
            background: Rectangle {
                color: '#009900'
            }
        }
    }

    Component {
        id: signInPage
        SignInPage {}
    }

    Component {
        id: botsPage
        BotsPage {}
    }
}