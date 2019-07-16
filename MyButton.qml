import QtQuick 2.0

Item {
    id: root

    signal triggered

    property string iconName: "back"

    width: imageBackground.paintedWidth
    height: imageBackground.paintedHeight

    Image {
        id: imageBackground
        source: "images/button_basic" + (mouseArea.pressed ? "_pressed" : "") + ".png"

        MouseArea {
            id: mouseArea
            anchors.fill: parent
            onClicked: root.triggered()
        }

        Image {
            anchors.centerIn: parent

            source: "images/icons/" + iconName + "_icon.png"
        }
    }
}
