import QtQuick 2.12

QtObject {
    property string resPrefix: "qrc:/qml/"
    property bool isMobile: Qt.platform.os === "android" || Qt.platform.os === "ios"
    property int frame: 0
    property string shaderVersionString: isMobile ? '#version 300 es
precision mediump float;
' : '#version 430 core'
}


