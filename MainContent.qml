import QtQuick 2.12
import QtQuick.Layouts 1.3

import com.luxoft.demo 1.0

ContentBase {
    id: root

    function handleActivate(prevState) {
        root.opacity = 0
        root.visible = true
        fadeIn.start()
    }

    SequentialAnimation {
        id: fadeIn

        PauseAnimation {
            duration: 200
        }

        OpacityAnimator {
            target: root
            from: 0
            to: 1
            duration: 300
        }

        ScriptAction {
            script: {
                activated()
            }
        }
    }


    MainButton {
        id: leftTop
        x: 28
        y: 204

        suffix: "lt"

        onTriggered: {
            changeStateRequested("media")
        }

        ColumnLayout {
            anchors.fill: parent
            anchors.topMargin: 85
            anchors.bottomMargin: 70
            anchors.leftMargin: 40

            spacing: 0

            MyLabel {
                //text: "Wish you well"
                text: MyMediaPlayer.currentTitle

                font.pointSize: 32
                Layout.fillWidth: true
                Layout.fillHeight: true
                font.bold: false

                smallLetterSpacing: true
            }

            MyLabel {
                //text: "Sigala, Becky Hill"
                text: MyMediaPlayer.currentArtist

                font.pointSize: 22
                Layout.fillWidth: true
                Layout.fillHeight: true
                font.bold: false

                smallLetterSpacing: true
            }
        }
    }

    Image {
        source: "images/MUSIC.png"

        anchors.left: leftTop.left
        anchors.leftMargin: 30
        anchors.bottom: leftTop.top
        anchors.bottomMargin: 30
    }


    MainButton {
        id: leftBottom
        x: 28
        y: 540

        suffix: "lb"

        Image {
            x: 44
            y: 60
            source: "images/Tbt_arrow.png"
        }

        MyLabel {
            x: 290

            anchors.top: parent.top
            anchors.bottom: parent.bottom
            verticalAlignment: Text.AlignVCenter

            font.pointSize: 32
            font.bold: false

            text: "1,3 km"
        }

        onTriggered: {
            changeStateRequested("navi")
        }
    }

    Image {
        source: "images/NAVI.png"

        anchors.left: leftBottom.left
        anchors.leftMargin: 30
        anchors.top: leftBottom.bottom
        anchors.topMargin: 30
    }


    MainButton {
        id: rightTop
        x: 1404
        y: 204

        suffix: "rt"

        MyLabel {
            x: 180
            font.pointSize: 32

            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            anchors.rightMargin: 40
            verticalAlignment: Text.AlignVCenter

            text: "4 Messages"
            font.bold: false
        }
    }

    Image {
        source: "images/PHONE.png"

        anchors.right: rightTop.right
        anchors.rightMargin: 30
        anchors.bottom: rightTop.top
        anchors.bottomMargin: 30
    }


    MainButton {
        id: rightBottom
        x: 1404
        y: 540

        suffix: "rb"

        MyLabel {
            x: 180
            font.pointSize: 32

            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            anchors.rightMargin: 40
            verticalAlignment: Text.AlignVCenter

            text: "16 on road"
            font.bold: false
        }
    }
}
