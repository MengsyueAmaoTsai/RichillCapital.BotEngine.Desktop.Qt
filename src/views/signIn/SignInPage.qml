
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Window
import '../../js.js' as JS

Item {
    id: root

    Page {
        id: page
        anchors.fill: parent 

        ColumnLayout {
            id: loginButtonGroupLayout

            Button {
                text: 'Continue with Microsoft'
                onClicked: () => { 
                    console.log('login msft') 
                    JS.switchPage('', '')
                }
            }
            
            Button {
                text: 'Continue with Google'
                onClicked: () => { console.log('login google') }
            }
        }
    }

}