import QtQuick 2.0
import QtGraphicalEffects 1.0


Item {
    id: root

    width: 879
    height: 879

    readonly property double currentTorque: _internal.currentTorque
    readonly property int currentSpeed: _internal.currentSpeed

    function updateTorque(newValue) {
        _internal.currentTorque = min(_internal.torqueMax, max(newValue, torqueMin))
    }

    SequentialAnimation {
        running: true
        loops: Animation.Infinite

        ParallelAnimation {
            NumberAnimation { target: _internal; property: "currentTorque"; to: _internal.torqueMax; duration: 5000 }
            NumberAnimation { target: _internal; property: "currentSpeed"; to: _internal.speedMax; duration: 5000 }
        }

        NumberAnimation { target: _internal; property: "currentTorque"; to: _internal.torqueMin; duration: 800 }

        NumberAnimation { target: _internal; property: "currentSpeed"; to: _internal.speedMin; duration: 4000 }

        NumberAnimation { target: _internal; property: "currentTorque"; to: 0; duration: 500 }

        PauseAnimation { duration: 1000 }
    }

    QtObject {
        id: _internal
        property double currentTorque: 0
        readonly property double torqueMax: 4.4
        readonly property double torqueMin: -0.7

        property int currentSpeed: speedMin
        readonly property double speedMax: 25
        readonly property double speedMin: 0
    }

    MyLabel {
        id: speed

        anchors.centerIn: parent
        anchors.verticalCenterOffset: 12

        text: currentSpeed

        font.pointSize: 101
        font.italic: true
    }

    Image {
        id: bg
        source: "images/gauge_base.png"

        Image {
            id: dummyGauge
            source: "images/gauge_power_charge.png"
            visible: false
        }

        Image {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 192

            source: _internal.currentTorque <0 ? "images/CHARGE.png" : "images/POWER.png"
        }

        Canvas {
            id: canvasPositive
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: -20

            readonly property double baseAngle: 2.8

            readonly property double currentAngle: baseAngle + root.currentTorque
            readonly property bool isNegative: _internal.currentTorque<0

            onCurrentAngleChanged: {
                canvasPositive.requestPaint()
            }

            width: dummyGauge.paintedWidth
            height: dummyGauge.paintedHeight

            /*
            Rectangle {
                color: "transparent"

                border.width: 2
                border.color: "red"
                anchors.fill: parent
            }*/

            onPaint: {
                var ctx = getContext("2d")

                var scaledW = width/2
                var scaledH = height/2

                ctx.save()

                ctx.clearRect(0, 0, canvasPositive.width, canvasPositive.height);

                ctx.beginPath()
                //ctx.strokeStyle = 'red'
                //ctx.fillStyle = 'red'
                ctx.moveTo(scaledW, scaledH);
                ctx.lineTo(scaledW, scaledH);
                ctx.arc(scaledW,scaledH*1.1,scaledH*1.1,baseAngle,currentAngle,isNegative);
                ctx.lineTo(scaledW,scaledH);
                //ctx.fill();
                ctx.closePath()
                ctx.clip()

                ctx.drawImage('images/gauge_power_charge.png', 0, 0, dummyGauge.paintedWidth, dummyGauge.paintedHeight)

                ctx.restore()
            }

            Component.onCompleted: {
                loadImage("images/gauge_power_charge.png")
            }
        }
    }
}
