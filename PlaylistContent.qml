import QtQuick 2.12
import QtQuick.Layouts 1.3

import com.luxoft.demo 1.0

ContentBase {
    id: root

    width: 2160
    height: 1080

    property bool isDebug: false

    Image {
        id: debugBackground
        source: "images/ORG_Playlist.png"
        visible: isDebug
    }

    Image {
        id: mediaBackground
        x: 29
        y: 258

        source: "images/playlist_area_bg.png"

        ListView {
            anchors.fill: parent
            anchors.rightMargin: 100
            anchors.leftMargin: 5
            anchors.topMargin: 5
            anchors.bottomMargin: 5

            snapMode: ListView.SnapToItem
            clip: true

            delegate: Item {
                id: rootDelegate

                width: 1365
                height: 138

                MouseArea {
                    anchors.fill: parent

                    onClicked: {
                        MyMediaPlayer.switchPlaylist(index)
                        root.changeStateRequested("media")
                    }
                }

                MyLabel {
                    id: nameLabel

                    text: name
                    font.pointSize: 21
                    font.bold: false

                    anchors.left: parent.left
                    anchors.leftMargin: 100
                    anchors.verticalCenter: parent.verticalCenter
                }

                Image {
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 20

                    source: "images/icon_play_list.png"
                    visible: MyMediaPlayer.currentPlaylistIndex===index
                }

            }

            model: MyMediaPlayer.playlistListModel
        }
    }

    MyButton {
        id: backButton
        x: 28
        y: 46

        iconName: "back"

        onTriggered: {
            root.changeStateRequested("media")
        }

        Image {
            source: "images/Playlists.png"

            anchors.left: parent.right
            anchors.leftMargin: 48
            anchors.verticalCenter: parent.verticalCenter
        }
    }
}
