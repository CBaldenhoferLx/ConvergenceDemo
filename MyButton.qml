import QtQuick 2.0

Item {
    id: root

    signal triggered

    property string backgroundImageSuffix: ""
    property string iconName: "back"

    width: imageBackground.paintedWidth
    height: imageBackground.paintedHeight

    Image {
        id: imageBackground
        source: mouseArea.pressed ? "images/button_basic_pressed.png" : "images/button_basic" + backgroundImageSuffix + ".png"

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
