import QtQuick.Scene3D 2.12
import Qt3D.Core 2.12
import Qt3D.Render 2.12
import Qt3D.Input 2.12
import Qt3D.Extras 2.12
import Qt3D.Logic 2.12
import ".."
DefaultScene {
    OrbitRootEntity{
        position: Qt.vector3d(0.0, 0.0, 20.0)
        Time {
            id: t
        }
        Entity {
            components: [
                ExtrudedTextMesh {
                    text: "涛哥"
                    depth: 0.6
                },
                Transform {
                    matrix: {
                        let m = Qt.matrix4x4()
                        m.translate(-2, -0.5, 0)
                        m.rotate(t.value % 360 * 300, Qt.vector3d(1, 0, 0))
//                        m.translate(Qt.vector3d(-2, 0, 0))
                        return m
                    }
                },
                PhongMaterial {
                    ambient: "red"
                }
            ]
        }
        Entity {
            components: [
                ExtrudedTextMesh {
                    text: "威武"
                    depth: 0.6
                },
                Transform {
                    matrix: {
                        let m = Qt.matrix4x4()
                        m.translate(2, -0.5, 0)
                        m.rotate(-t.value % 360 * 300, Qt.vector3d(1, 0, 0))
                        return m
                    }
                },
                PhongMaterial {
                    ambient: "blue"
                }
            ]
        }
    }
}


