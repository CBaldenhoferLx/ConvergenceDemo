pragma Singleton

import QtQuick 2.0
import QtMultimedia 5.13

Item {
    id: root

    readonly property string currentTitle: _songListModel.get(myPlaylist.currentIndex).title
    readonly property string currentArtist: _songListModel.get(myPlaylist.currentIndex).artist
    readonly property int currentMs: player.position
    readonly property int currentDurationMs: myPlaylist.durations[myPlaylist.currentIndex]
    readonly property double currentProgress: currentDurationMs>0 ? currentMs / currentDurationMs : 0

    property alias songCount: myPlaylist.itemCount
    readonly property bool isPlaying: player.playbackState===Audio.PlayingState

    property alias playlistListModel: _playlistListModel

    property int currentPlaylistIndex: 0
    readonly property string currentPlaylistName: _playlistListModel.get(currentPlaylistIndex).name

    onCurrentProgressChanged: {
        console.log("progress", currentProgress)
    }

    function playPause() {
        if (isPlaying) {
            player.pause()
        } else {
            player.play()
        }
    }

    function nextTrack() {
        myPlaylist.next()
    }

    function prevTrack() {
        myPlaylist.previous()
    }

    function switchPlaylist(newPlaylistIndex) {
        currentPlaylistIndex = newPlaylistIndex
        console.log("new PL", currentPlaylistName)
    }

    MediaPlayer {
        id: player
        playlist: myPlaylist

        onError: {
            console.error(errorString)
        }
    }

    ListModel {
        id: _playlistListModel

        ListElement {
            name: "Electro Beats"
        }
        ListElement {
            name: "Chilled Bass"
        }
        ListElement {
            name: "Summer Tunes"
        }
        ListElement {
            name: "Jazz Moods"
        }
        ListElement {
            name: "HipHop Classics"
        }
        ListElement {
            name: "Trash"
        }
    }

    ListModel {
        id: _songListModel

        ListElement {
            title: "Title ABC1"
            artist: "Artist ABC1"
        }
        ListElement {
            title: "Title ABC2"
            artist: "Artist ABC2"
        }
        ListElement {
            title: "Title ABC3"
            artist: "Artist ABC3"
        }
        ListElement {
            title: "Title ABC4"
            artist: "Artist ABC4"
        }
        ListElement {
            title: "Title ABC5"
            artist: "Artist ABC5"
        }
        ListElement {
            title: "Title ABC6"
            artist: "Artist ABC6"
        }
        ListElement {
            title: "Title ABC7"
            artist: "Artist ABC7"
        }
        ListElement {
            title: "Title ABC8"
            artist: "Artist ABC8"
        }
        ListElement {
            title: "Title ABC9"
            artist: "Artist ABC9"
        }
        ListElement {
            title: "Title ABC10"
            artist: "Artist ABC10"
        }
    }

    Playlist {
        id: myPlaylist

        playbackMode: Playlist.Loop

        items:  [
            PlaylistItem { source: "media/Track (1).mp3"; },
            PlaylistItem { source: "media/Track (2).mp3"; },
            PlaylistItem { source: "media/Track (3).mp3"; },
            PlaylistItem { source: "media/Track (4).mp3"; },
            PlaylistItem { source: "media/Track (5).mp3"; },
            PlaylistItem { source: "media/Track (6).mp3"; },
            PlaylistItem { source: "media/Track (7).mp3"; },
            PlaylistItem { source: "media/Track (8).mp3"; },
            PlaylistItem { source: "media/Track (9).mp3"; },
            PlaylistItem { source: "media/Track (10).mp3"; }
        ]

        readonly property var durations: [
            142000,
            133000,
            138000,
            109000,
            149000,
            108000,
            139000,
            244000,
            91000,
            105000
        ]
    }
}
