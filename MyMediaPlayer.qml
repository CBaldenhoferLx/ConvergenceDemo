pragma Singleton

import QtQuick 2.0
import QtMultimedia 5.13

Item {
    id: root

    readonly property string currentTitle: myPlaylist.titles[myPlaylist.currentIndex]
    readonly property string currentArtist: myPlaylist.artists[myPlaylist.currentIndex]

    property alias songCount: myPlaylist.itemCount
    readonly property bool isPlaying: player.playbackState===Audio.PlayingState

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

    Audio {
        id: player
        playlist: myPlaylist
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

        readonly property var titles: [
            "Title ABC1",
            "Title ABC2",
            "Title ABC3",
            "Title ABC4",
            "Title ABC5",
            "Title ABC6",
            "Title ABC7",
            "Title ABC8",
            "Title ABC9",
            "Title ABC10",
        ]

        readonly property var artists: [
            "Artist ABC1",
            "Artist ABC2",
            "Artist ABC3",
            "Artist ABC4",
            "Artist ABC5",
            "Artist ABC6",
            "Artist ABC7",
            "Artist ABC8",
            "Artist ABC9",
            "Artist ABC10",
        ]
    }
}
