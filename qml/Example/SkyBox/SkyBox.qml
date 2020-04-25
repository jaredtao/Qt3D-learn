import QtQuick.Scene3D 2.12
import Qt3D.Core 2.12
import Qt3D.Render 2.12
import Qt3D.Input 2.12
import Qt3D.Extras 2.12
import Qt3D.Logic 2.12

import ".."
DefaultScene {
    cameraAspectRatioMode: Scene3D.AutomaticAspectRatio
    OrbitRootEntity {
        SkyboxEntity {
            baseName: gConfig.resPrefix + "Assets/SkyBox/box"
            extension: ".jpg"
        }

        Entity {
            components: [
                PhongMaterial {
                    id: phoneMaterial
                },
                CuboidMesh {
                    id: cube
                    xExtent: 10
                    yExtent: 10
                    zExtent: 10
                },
                Transform {
                    id: cubeTrans
                    matrix: {
                        let m = Qt.matrix4x4();
                        m.rotate(t.value % 360 * 50, Qt.vector3d(1, 0, 0))
                        m.translate(Qt.vector3d(5, 0, 0))
                        return m;
                    }
                    Time {
                        id: t
                        running: true
                    }
                }
            ]
        }
    }
}
