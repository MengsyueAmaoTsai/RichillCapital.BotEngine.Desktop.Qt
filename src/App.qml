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
import './views/login' as Login

import AppViewModel 

//#endregion
ApplicationWindow {
    id: root
    visible: true
    visibility: Window.Maximized
    width: Screen.width * 0.8
    height: Screen.height * 0.8
    minimumHeight: 400
    minimumWidth: 650

    // Python Types
    AppViewModel {
        id: viewModel
        value: "New value"
    }

    function openSideBar(params) {
        console.log("open the side bar")
    }

    function closeSideBar(params) {
        console.log("close the side bar")
    }


    RowLayout {
        id: rootLayout
        anchors.fill: parent
        spacing: 0
        // Side bar here
        StackView {
            id: stackView
            Layout.fillWidth: true
            Layout.fillHeight: true

            initialItem: loginPage
        }
    }

    // Page wrappers.
    Component {
        id: loginPage
        Login.LoginPage {}
    }

    // Define methods
    function loadPage(page, sideBarItem, doSamePageCheck = true) {
        console.log('load page')
    }

    QtObject {
        id: internal
        function reloadApplication() {

        }
    }
}
