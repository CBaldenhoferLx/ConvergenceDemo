import QtQuick 2.12
import QtQuick.Controls 1.4
import QtGraphicalEffects 1.0

ContentBase {
    id: root

    function handleActivate(prevState) {
        root.visible = true
        animRoot.opacity = 0
        fadeIn.start()
    }

    SequentialAnimation {
        id: fadeIn

        PauseAnimation {
            duration: 200
        }

        OpacityAnimator {
            target: animRoot
            from: 0
            to: 1
        }

        ScriptAction {
            script: {
                activated()
            }
        }
    }

    Image {
        visible: false
        source: "images/ORG_Navi.png"
    }

    Item {
        id: animRoot
        anchors.fill: parent

        ScrollView {
            id: scrollView

            anchors.left: parent.left
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.topMargin: 100

            height: 850

            Image {
                source: "images/Map_route.png"
            }

            horizontalScrollBarPolicy: Qt.ScrollBarAlwaysOff
            verticalScrollBarPolicy: Qt.ScrollBarAlwaysOff

            flickableItem.boundsBehavior: Flickable.StopAtBounds

            Component.onCompleted: {
                flickableItem.contentX = 1300
                flickableItem.contentY = 2500
            }
        }

        Image {
            anchors.left: parent.left
            anchors.top: parent.top

            source: "images/Map_overlay.png"
        }

        MyButton {
            id: backButton
            x: 30
            y: 48
            iconName: "back"
            backgroundImageSuffix: "_navi"

            onTriggered: {
                root.changeStateRequested("main")
            }
        }

        MyButton {
            id: listButton
            x: 30
            y: 747
            iconName: "list"
            backgroundImageSuffix: "_navi"
        }

        MyButton {
            id: voiceButton
            x: 240
            y: 747
            iconName: "voice"
            backgroundImageSuffix: "_navi"
        }

        MyButton {
            id: fsButton
            x: 452
            y: 747
            iconName: "fullscreen"
            backgroundImageSuffix: "_navi"
        }

        MyButton {
            id: cancelButton
            x: 1248
            y: 747
            iconName: "cancel"
            backgroundImageSuffix: "_navi"
        }
    }

    Image {
        anchors.left: parent.left
        anchors.top: parent.top

        source: "images/Map_screen_lower_part.png"
    }

}
