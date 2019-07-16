import QtQuick 2.12

Item {
    id: root

    signal triggered

    width: image.paintedWidth
    height: image.paintedHeight

    property string suffix: "lt"

    states: State {
        name: "pressed"
        when: mouseArea.pressed
        PropertyChanges { target: root; scale: 0.95 }
    }

    transitions: Transition {
        NumberAnimation { properties: "scale"; easing.type: Easing.OutQuad; duration: 200 }
    }

    Image {
        id: image

        source: "images/tile_" + suffix + (mouseArea.pressed ? "_focused"  : "") + ".png"
        smooth: true

        MouseArea {
            id: mouseArea

            anchors.fill: parent

            onClicked: root.triggered()
        }
    }

}
