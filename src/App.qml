import QtQuick 
import QtQuick.LocalStorage
import QtQuick.Particles 
import QtQuick.Controls
import QtQuick.Layouts 
import QtQuick.Effects
import QtQuick.Window

import './views/signin'
import './views/bots'
import './views/monitor'
import './views/analyzer'
import './views/preferences'

import './controls/sidebar'

import './js.js' as JS


ApplicationWindow {
    id: root
    visible: true

    width: Screen.width * .8
    height: Screen.height * .8

    RowLayout {
        id: mainLayout
        anchors.fill: parent
        spacing: 0

        AppSideBar {
            id: sidebar
            visible: pages.currentItem.sidebarEnabled
        }

        StackView {
            id: pages

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

    QtObject {
        id: internal

        function reloadApplication() {
            console.log('RELOAD APP')
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
    Component {
        id: monitorPage
        MonitorPage {}
    }
    Component {
        id: analyzerPage
        AnalyzerPage {}
    }    
    Component {
        id: preferencesPage
        PreferencesPage {}
    }

    Component.onCompleted: () => {
        console.log('ON APP Completed.');
        appViewModel.load_bots();
    }
}