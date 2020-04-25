import QtQuick 2.12

Item {
    id: time
    property real value
    property alias running: animation.running
    function getTime() {
        return new Date().getTime()/1000.;
    }
    QtObject {
        id: d
        property real offset: 0
        property real value
        onValueChanged: {
            time.value = getTime() - offset;
        }
    }
    onRunningChanged: {
        if (running) {
            d.offset += getTime()
        } else {
            d.offset -= getTime()
        }
    }
    NumberAnimation {
        id: animation
        target: d
        property: "value"
        duration: 1000
        from: 0
        to: 1
        loops: Animation.Infinite
        running: true
    }
}
