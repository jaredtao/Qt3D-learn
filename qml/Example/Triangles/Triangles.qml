import QtQuick 2.12

import Qt3D.Core 2.12
import Qt3D.Render 2.12
import Qt3D.Input 2.12

import QtQuick.Scene3D 2.12
import "./FuncComponent"
import ".."

Item {
    id: r
    anchors.fill: parent

    Scene3D {
        id: scene1
        width: parent.width / 2
        height: parent.height / 2
        aspects: ["logic"]
        DefaultRootEntity {
            TriangleVertex{
            }
        }
    }
    Scene3D {
        id: scene2
        width: parent.width / 2
        height: parent.height / 2
        x: width
        DefaultRootEntity {
            clearColor: Qt.rgba(1, 0, 0, 1)
            TriangleIndex {
            }
        }
    }
    Scene3D {
        id: scene3
        width: parent.width / 2
        height: parent.height / 2
        y: height
        DefaultRootEntity {
            clearColor: Qt.rgba(1, 1, 0, 1)
            TriangleDouble {
            }
        }
    }
    Scene3D {
        id: scene4
        width: parent.width / 2
        height: parent.height / 2
        x: width
        y: height
        DefaultRootEntity {
            clearColor: Qt.rgba(1, 0, 1, 1)
            TriangleMulitColor {
            }
        }
    }
}
