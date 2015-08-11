import QtQuick 2.3
import QtQuick.Window 2.2

Window {
    id: window
    visible: true
    width: 360
    height: 360
    color: "navy"
    title: "OwO"

    AnimatedImage {
        id: jake
        anchors.fill: parent
        source: "jake.gif"
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            jake.paused = !jake.paused
        }
    }

    Text {
        id: clock
        color: "white"
        font.family: "Calibri"
        font.bold: true
        font.pointSize: 48
        font.letterSpacing: 2
        text: "15:30"
        anchors.top: parent.top
        anchors.horizontalCenter:
        parent.horizontalCenter
        anchors.margins: 16
    }

    Timer {
        interval: 1000
        repeat: true
        running: true
        onTriggered: {
            var now = new Date()
            var hours = now.getHours()
            var minutes = now.getMinutes()
            var seconds = now.getSeconds()
            if (hours < 10) {
                hours = "0" + hours
            }
            if (minutes < 10) {
                minutes = "0" + minutes
            }
            if (seconds < 10) {
                seconds = "0" + seconds
            }
            clock.text = hours + ":" + minutes + ":" + seconds
            window.title = now.getFullYear() + "年" + (now.getMonth() + 1) + "月" + now.getDate() + "日"
        }
    }
}
