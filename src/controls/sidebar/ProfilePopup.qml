import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Popup {
    id: root
    implicitWidth: 170
    implicitHeight: 130
    padding: 0

    background: Rectangle {
        anchors.fill: parent
        color: '#888888'
        radius: 5
        // border.color: Style.colorContainerBorder
        antialiasing: true
    }        

    ColumnLayout {
        id: layout
        width: parent.width

        ProfilePopupItem {
            id: signOutItem
            Layout.fillWidth: true
            Layout.topMargin: 15
            Layout.leftMargin: 15
            imageUrl: '../../../static/images/sidebar/log_out_icon.svg'
            text: "Sign Out"
            imageWidth: 20
            textSpacing: 11
            
            onClicked: () => {
                console.log('test')
                root.signOut()
            }
        }
    }

    MouseArea {
        id: closeManagement
        anchors.fill: parent
        hoverEnabled: true
        onContainsMouseChanged: () => {
            if(!containsMouse) 
                root.close();
        }        
    }

    function signOut() {
        loadPage(signInPage);
        root.close();
        sidebar.reset();
    }
}