import QtQuick 2.12
import QtQuick.Controls 2.12
import "./Comp"

BlackBackground {
    signal back()
    ItemButton {
        iconUrl: gConfig.resPrefix + "Images/icon-back.png"
        height: parent.height
        implicitWidth: 56
        iconAtLeft: true
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        onClicked: back()
    }
}

