import QtQuick 2.4

Item {
    id: root
    width: 150
    height: 150
    clip: true

    property real angle: 33.3
    property color color: "royalblue"

    Rectangle {
        id: indicator
        transform: Rotation {
            angle: -90 + Math.max(0, Math.min(root.angle, 90))
            origin.y: indicator.height
        }
        width: Math.max(parent.width, parent.height)
        height: width
        y: parent.height - height
        color: root.color
    }
}
