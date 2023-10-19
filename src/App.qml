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

    RowLayout {
        id: layout
        anchors.fill: parent
        spacing: 0
        // SideBar

        // Content
        StackView {
            id: stackView
            property bool hasSideBar: false

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
}