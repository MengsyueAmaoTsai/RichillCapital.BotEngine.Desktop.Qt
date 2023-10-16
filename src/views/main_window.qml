/**
- Module (Namespace) Imports

import <Module> [Major.Minor] [as ModuleAlias]
ex.
import QtQuick
*/

/**
- C++ Module Imports.   
  Declared using 
    QML_IMPORT_NAME
    QML_IMPORT_MAJOR_VERSION 
    @QmlElement  
    @QmlNamedElement
*/

/**
- Directory Imports


*/

// Imports Qt modules
import QtQuick 
import QtQuick.Layouts 
import QtQuick.Controls
import QtQuick.Window
import QtQuick.Controls.Material

// Imports custom modules
import MainViewModel 

ApplicationWindow {
    id: root
    width: Screen.width * 0.8
    height: Screen.height * 0.8
    visible: true
    Material.theme: Material.Dark
    Material.accent: Material.Red

    MainViewModel {
        id: main_view_model
    }
}
