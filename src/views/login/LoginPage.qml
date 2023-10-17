
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Window

Item {
    id: root

    Page {
        id: page
        anchors.fill: parent 

        ColumnLayout {
            id: loginButtonGroupLayout

            Button {
                text: 'Continue with Microsoft'
                onClicked: () => { console.log('login msft') }
            }
            
            Button {
                text: 'Continue with Google'
                onClicked: () => { console.log('login google') }
            }
        }
    }

}