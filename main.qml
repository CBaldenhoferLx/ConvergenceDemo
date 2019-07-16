import QtQuick 2.12
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0

Item {
    id: root
    visible: true
    width: 2160
    height: 1080

    readonly property bool isDebug: false

    state: "main"

    states: [
        State {
            name: "main"
        },
        State {
            name: "media"
        }
    ]

    Rectangle {
        state: parent.state

        anchors.fill: parent
        color: "black"

        Image {
            id: image

            state: parent.state

            states: [
                State {
                    name: "main"
                    PropertyChanges {
                        target: image
                        source: isDebug ? "images/ORG_Main.png" : "images/bg.png"
                    }
                },
                State {
                    name: "media"
                    PropertyChanges {
                        target: image
                        source: isDebug ? "images/ORG_Media.png" : "images/bg.png"
                    }
                }
            ]

            //source: isDebug ? "images/ORG_Main.png" : "images/bg.png"
            //source: "images/ORG_Media.png"
            //source: "images/background_main.png"
        }

        Gauge {
            id: gauge
            x: 641
            y: 103

            state: root.state

            transitions: Transition {
                NumberAnimation { properties: "x,y,scale"; easing.type: Easing.InOutQuad }
            }

            states: [
                State {
                    name: "main"
                },
                State {
                    name: "media"
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

        MainContent {
            state: root.state
            anchors.fill: parent
            visible: root.state==="main"

            onChangeStateRequested: {
                root.state = newState
            }
        }


        MediaContent {
            state: root.state
            anchors.fill: parent
            visible: root.state==="media"

            onChangeStateRequested: {
                root.state = newState
            }
        }

    }

    focus: true

    Keys.onEscapePressed: {
        Qt.quit()
    }
}
