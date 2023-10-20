
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    id: root
    // required property var sidebar
    property int closedSidebarWidth
    property int openedSidebarWidth
    // property alias closeAnimation: closeAnimation
    property alias openAnimation: openAnimation
    
    ParallelAnimation {
        id: openAnimation

        PropertyAnimation {
            target: sidebar
            property: 'implicitWidth'
            from: root.closedSidebarWidth
            to: root.openedSidebarWidth
            duration: internal.slowDuration
            easing.type: internal.easingType
        }

        PropertyAnimation {
            target: logoLabel
            property: 'visible'
            to: true
            duration: internal.fastDuration
            easing.type: internal.easingType
        }

        PropertyAnimation {
            targets: [botsItem, monitorItem, analyzerItem, preferencesItem, quitItem]
            properties: 'labelVisibility'
            to: true
            duration: internal.slowDuration
            easing.type: internal.easingType
        }

        PropertyAnimation
        {
            targets: [botsItem, monitorItem, analyzerItem, preferencesItem, quitItem]
            property: "textOpacity"
            from: 0
            to: 1
            duration: internal.slowDuration * 2.5
            easing.type: internal.easingType
        }        

        onFinished: () => {
            console.log('Start animation finished');
        }
    }
    
   
    ParallelAnimation {
        id: closeAnimation
        
        PropertyAnimation {
            target: sidebar
            property: "implicitWidth"
            to: root.closedSidebarWidth
            duration: internal.slowDuration
            easing.type: internal.easingType
        }
        
        PropertyAnimation {
            target: logoLabel
            property: "visible"
            to: false
            duration: internal.fastDuration
            easing.type: internal.easingType
        }
        
        PropertyAnimation {
            targets: [botsItem, monitorItem, analyzerItem, preferencesItem, quitItem]
            property: "labelVisibility"
            to: false
            duration: internal.fastDuration
            easing.type: internal.easingType
        }
        
        onFinished: () => {
            console.log('Close animation finished');
        }
    }
    
    QtObject {
        id: internal
        property int slowDuration: 250
        property int fastDuration: 100
        property int easingType: Easing.InOutQuad
    }    
}
