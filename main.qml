import QtQuick 2.12
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0

Item {
    id: root
    visible: true
    width: 2160
    height: 1080

    state: "main"

    states: [
        State {
            name: "main"
        },
        State {
            name: "media"
        },
        State {
            name: "playlist"
        }
    ]

    property var lastChange: 0      // hack
    property int currentWait: 0

    function requestChangeState(newState, oldTarget, activateTarget, activationTime) {
        console.log("Change State", newState)

        if (Date.now() - lastChange < currentWait) {
            console.log("Rejected", lastChange, Date.now())
            return false;
        } else {
            console.log("Switch", lastChange, Date.now())
        }

        currentWait = activationTime
        lastChange = Date.now()

        var oldState = state
        root.state = newState
        oldTarget.deactivate()
        activateTarget.activate(oldState)
        return true;
    }

    Rectangle {
        state: parent.state

        anchors.fill: parent
        color: "black"

        Image {
            id: image

            state: parent.state

            source: "images/bg.png"
        }

        Gauge {
            id: gauge
            x: 641
            y: 103

            state: root.state

            transitions: Transition {
                id: gaugeTransition

                NumberAnimation {
                    id: gaugeAnimation

                    properties: "x,y,scale"
                    easing.type: Easing.InOutQuad
                }
            }

            states: [
                State {
                    name: "main"
                },
                State {
                    when: root.state!=="main"

                    PropertyChanges {
                        target: gauge
                        x: 1360
                        y: 217
                        scale: 0.72
                    }
                }
            ]
        }

        MyLabel {
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 20
            anchors.horizontalCenter: parent.horizontalCenter

            text: new Date().toLocaleTimeString(Qt.locale(), Locale.ShortFormat)

            font.pointSize: 24

            color: "#8C939D"
        }

        Image {
            id: tbtNavi
            x: 1632
            y: 108

            source: "images/Tbt_arrow.png"

            visible: root.state!=="main"

            MyLabel {
                id: tbtNaviLabel

                anchors.left: parent.right
                anchors.leftMargin: 36
                anchors.verticalCenter: parent.verticalCenter

                font.pointSize: 32
                font.bold: false
                font.letterSpacing: -3.33

                text: "1,3 km"
            }
        }

        MainContent {
            id: mainContent

            state: root.state
            anchors.fill: parent

            onChangeStateRequested: {
                switch(newState) {
                case "media":
                    root.requestChangeState(newState, mainContent, mediaContent, 1200)
                    break;
                }
            }

            onActivated: {
            }
        }


        MediaContent {
            id: mediaContent

            state: root.state
            anchors.fill: parent
            visible: false

            onChangeStateRequested: {
                switch(newState) {
                case "main":
                    root.requestChangeState(newState, mediaContent, mainContent, 500)
                    break;
                case "playlist":
                    root.requestChangeState(newState, mediaContent, playlistContent, 10)
                    break;
                }
            }

            onActivated: {
            }
        }

        PlaylistContent {
            id: playlistContent

            state: root.state
            anchors.fill: parent
            visible: false

            onChangeStateRequested: {
                root.requestChangeState(newState, playlistContent, mediaContent, 10)
            }

            onActivated: {
            }
        }
    }

    focus: true

    Keys.onEscapePressed: {
        Qt.quit()
    }
}
