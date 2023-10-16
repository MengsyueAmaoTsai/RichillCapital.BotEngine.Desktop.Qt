//#region Qt Imports 

import QtQuick 
import QtQuick.LocalStorage
import QtQuick.Particles 
import QtQuick.Controls
import QtQuick.Layouts 
// import QtQuick.Tests
import QtQuick.Effects
import QtQuick.Window
import QtQuick.Controls.Material
import Qt.labs.qmlmodels
import QtTest
//#endregion

//#region Custom Imports
import "../controls" 1.0 as Controls
import "../interop/js/base.js" as JSInterop

//#endregion
ApplicationWindow {
    id: root
    width: Screen.width * 0.8
    height: Screen.height * 0.8
    visible: true

    Controls.AppMenuBar {
    }

    Button {
        onClicked: JSInterop.ddd()
    }
}
