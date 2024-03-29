import QtQuick 2.12
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0

import com.luxoft.demo 1.0

ContentBase {
    id: root

    function handleActivate(prevState) {
        if (prevState==="main") {
            root.opacity = 0
            root.visible = true
            fadeIn.start()
        } else {
            root.opacity = 0
            root.scale = 1.2
            root.visible = true
            fadeInZoom.start()
        }
    }

    function formatMsAsTrackTime(ms) {
        var d = new Date(null);
        d.setMilliseconds(ms);
        return d.toISOString().substr(14, 5);
    }

    SequentialAnimation {
        id: fadeIn

        ParallelAnimation {

            OpacityAnimator {
                target: root
                from: 0
                to: 1
            }

            ScaleAnimator {
                target: root
                from: 0.8
                to: 1
            }

        }

        ScriptAction {
            script: {
                activated()
            }
        }
    }

    SequentialAnimation {
        id: fadeInZoom

        ParallelAnimation {

            OpacityAnimator {
                target: root
                from: 0
                to: 1
            }

            ScaleAnimator {
                target: root
                from: 1.2
                to: 1
            }

        }

        ScriptAction {
            script: {
                activated()
            }
        }
    }

    Image {
        id: mediaBackground
        x: 29
        y: 339

        source: "images/music_area_bg.png"

        Rectangle {
            id: progressBar

            anchors.bottom: parent.top
            anchors.bottomMargin: 1

            width: 1000 * MyMediaPlayer.currentProgress

            height: 6
            color: "white"
            anchors.left: parent.left
            anchors.leftMargin: 228
        }

        MyLabel {
            anchors.bottom: parent.top
            anchors.bottomMargin: 30
            anchors.left: parent.left
            anchors.leftMargin: 228

            text: MyMediaPlayer.currentPlaylistName
            // text: "Summer Tunes"

            font.pointSize: 21
            font.bold: false

            color: "#8C939D"
        }

        MyLabel {
            anchors.left: parent.left
            anchors.leftMargin: 228
            anchors.top: parent.top
            anchors.topMargin: 80

            //text: "Wish you well"
            text: MyMediaPlayer.currentTitle

            font.pointSize: 32
            font.bold: false

            smallLetterSpacing: true

            MyLabel {
                anchors.left: parent.left
                anchors.top: parent.bottom
                anchors.topMargin: 46

                //text: "Sigala, Becky Hill"
                text: MyMediaPlayer.currentArtist

                font.pointSize: 21
                font.bold: false

                smallLetterSpacing: true
            }
        }

        MyLabel {
            anchors.right: parent.right
            anchors.rightMargin: 152
            anchors.bottom: parent.top
            anchors.bottomMargin: 30

            width: 295

            font.pointSize: 21
            font.bold: false
            color: "#8C939D"

            text: formatMsAsTrackTime(MyMediaPlayer.currentMs)

            MyLabel {
                anchors.right: parent.right
                anchors.bottom: parent.bottom

                width: 113

                font.pointSize: 17
                font.bold: false
                color: "#8C939D"

                text: formatMsAsTrackTime(MyMediaPlayer.currentDurationMs)

                MyLabel {
                    anchors.right: parent.left
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 6

                    font.pointSize: 21
                    font.bold: false
                    color: "#8C939D"

                    text: "/"
                }
            }
        }

        Image {
            id: albumCover
            source: "images/covers/cover_1.png"
            smooth: true
            visible: false
            anchors.bottom: parent.bottom
            anchors.left: parent.left
        }

        Image {
            id: mask
            source: "images/cover_mask.png"
            smooth: true
            visible: false
        }

        OpacityMask {
            anchors.fill: albumCover

            anchors.bottomMargin: 5
            anchors.leftMargin: 3

            source: albumCover
            maskSource: mask
        }

    }

    MyButton {
        id: backButton
        x: 28
        y: 46

        iconName: "back"

        onTriggered: {
            root.changeStateRequested("main")
        }

        Image {
            source: "images/MUSIC.png"

            anchors.left: parent.right
            anchors.leftMargin: 48
            anchors.verticalCenter: parent.verticalCenter
        }
    }

    MyButton {
        id: listButton
        x: 466
        y: 684

        iconName: "list"

        onTriggered: {
            changeStateRequested("playlist")
        }
    }

    MyButton {
        id: skipBackButton
        x: 698
        y: 684

        iconName: "skip_backwards"

        onTriggered: {
            MyMediaPlayer.prevTrack()
        }
    }

    MyButton {
        id: playButton
        x: 929
        y: 684

        iconName: MyMediaPlayer.isPlaying ? "pause" : "play"

        onTriggered: {
            MyMediaPlayer.playPause();
        }
    }

    MyButton {
        id: skipForwardButton
        x: 1159
        y: 684

        iconName: "skip_forwards"

        onTriggered: {
            MyMediaPlayer.nextTrack()
        }
    }
}
