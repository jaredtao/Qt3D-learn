import QtQuick 2.12
import QtQuick.Controls 2.12

Button {
    id: button
    property url iconUrl

    property bool iconAtLeft: false
    property int iconPadding: 10
    background: BlackBackground {
        pressed: button.pressed
    }
    contentItem: Item {
        Text {
            text: button.text
            anchors.centerIn: parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
        }
        Image {
            x: iconAtLeft ? iconPadding : button.width - width - iconPadding
            anchors.verticalCenter: parent.verticalCenter
            source: button.iconUrl
        }
    }
}
