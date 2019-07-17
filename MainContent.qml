import QtQuick 2.12
import QtQuick.Layouts 1.3

import com.luxoft.demo 1.0

ContentBase {
    id: root

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
            anchors.topMargin: 30
            anchors.bottomMargin: 30
            anchors.leftMargin: 24

            spacing: 0

            MyLabel {
                //text: "Wish you well"
                text: MyMediaPlayer.currentTitle

                font.pointSize: 32
                Layout.fillWidth: true
                Layout.fillHeight: true
                font.letterSpacing: -3.33
                font.bold: false
            }

            MyLabel {
                //text: "Sigala, Becky Hill"
                text: MyMediaPlayer.currentArtist

                font.pointSize: 22
                Layout.fillWidth: true
                Layout.fillHeight: true
                font.letterSpacing: -3.33
                font.bold: false
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

            text: "1,3 km"
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
            verticalAlignment: Text.AlignVCenter

            text: "4 Messages"
            font.letterSpacing: -3.33
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
            verticalAlignment: Text.AlignVCenter

            text: "16 on road"
            font.letterSpacing: -3.33
            font.bold: false
        }
    }
}
