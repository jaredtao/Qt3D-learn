import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import "./Comp"
Window {
    id: root
    visible: true
    width: 1024
    height: 768
    title: qsTr("Qt3D Learn")
    color: "#161616"

    Config {
        id: gConfig
        resPrefix: resPath
    }

    Loader {
        id: exampleLoader
        width: parent.width
        height: parent.height / 8 * 7
        onLoaded: {
            //每次加载完成后，设置一下focus，保证3D场景可以有焦点，鼠标、键盘事件得以处理
            focus = true
        }
    }
    FPS {
        id: fpsItem
        anchors.right: parent.right
        anchors.top: parent.top
        width: 35
        height: 80
        hidden: true
    }
    BackItem {
        id: backItem
        width: parent.width
        height: parent.height / 8
        anchors.bottom: parent.bottom
        visible: false
        onBack: {
            exampleLoader.source = ""
            backItem.visible = false
            fpsItem.hidden = true
            lv.visible = true
        }
    }

    ListView {
        id: lv
        anchors.fill: parent
        model: examples
        delegate: ItemButton {
            width: root.width
            height: root.height / 8
            text: modelData
            iconUrl: gConfig.resPrefix + "Images/icon-go.png"
            onClicked: {
                let qml = gConfig.resPrefix + String("Example/%1/%1.qml").arg(modelData)
                lv.visible = false
                backItem.visible = true
                fpsItem.hidden = false
                exampleLoader.source = qml
            }
        }
    }
}
