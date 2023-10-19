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
import './views/signIn' 
import './views/strategies' 

import './controls/sidebar'

import './js.js' as JS

import AppViewModel 

ApplicationWindow {
    id: root
    property int defaultMinWidth: 650
    property int sidebarMinWidth: 810
    property bool notifyAboutUpdates: true

    minimumWidth: 650
    minimumHeight: 400
    visible: true

    Shortcut {
    }

    RowLayout {
        id: layout
        anchors.fill: parent
        spacing: 0

        AppSideBar {
            id: sidebar
            visible: stackView.pageHasSideBar
            z: 1
        }

        // Content
        StackView {
            id: stackView
            property bool pageHasSideBar: false

            Layout.fillWidth: true
            Layout.fillHeight: true
            initialItem: signInPage

            popEnter: null
            popExit: null
            pushEnter: null
            pushExit: null
            replaceEnter: null
            replaceExit: null
        }
    }

    Component {
        id: signInPage
        SignInPage {}
    }

    Component {
        id: strategiesPage
        StrategiesPage {}
    }

    Timer {
        id: spamStopper
        property bool available: true
        interval: 1000
        onTriggered: spamStopper.available = true
    }
}