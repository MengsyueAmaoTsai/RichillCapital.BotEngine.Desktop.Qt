
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Window
import '../../js.js' as JS


Flickable {
    id: root 
    
    contentHeight: Window.height < layout.implicitHeight ? layout.implicitHeight : Window.height

    Page {
        id: page
        anchors.fill: parent
        bottomPadding: 22
        background: Rectangle {
        }

        ColumnLayout {
            id: layout
            anchors.centerIn: parent
            width: 544

            Button {
                text: 'Sign-In with Microsoft'
                Layout.fillWidth: true
                Layout.preferredHeight: 40
                Layout.topMargin: 42
                onClicked: () => {
                    console.log('clicked')
                    // AppViewModel.sign_in_with_microsoft()
                    JS.switchPage(strategiesPage)
                }
                onFocusChanged: () => {
                    console.log('Focus changed')
                }
                Keys.onPressed: (event) => {
                }
            }
        }
    }
}