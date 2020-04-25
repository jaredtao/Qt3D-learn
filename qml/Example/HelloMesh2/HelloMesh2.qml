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
        id: root
        position: Qt.vector3d(0, 0, 10)
        Entity {
            Mesh {
                id: mesh1
//                source: gConfig.resPrefix + "Assets/models/anime_character(high).obj"
                source: gConfig.resPrefix + "Assets/models/Intergalactic_Spaceship-(Wavefront).obj"
            }
            Transform {
                id: transform1
            }
            PhongMaterial {
                id: phongMaterial
            }
            components: [
                mesh1, transform1,phongMaterial
            ]
        }
    }
}
