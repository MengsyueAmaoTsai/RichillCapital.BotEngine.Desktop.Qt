// Qt modules
import QtQuick 
import QtQuick.Layouts 
import QtQuick.Controls
import QtQuick.Window
import QtQuick.Controls.Material

// Custom modules
import core 

ApplicationWindow {
    id: root
    width: 800
    height: 400
    visible: true
    Material.theme: Material.Dark
    Material.accent: Material.Red

    MainViewModel {
        id: main_view_model
    }

    GridLayout {
        id: grid
        columns: 2
        rows: 3
    }
}
