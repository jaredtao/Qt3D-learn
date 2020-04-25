import QtQuick.Scene3D 2.12
import Qt3D.Core 2.12
import Qt3D.Render 2.12
import Qt3D.Input 2.12
import Qt3D.Extras 2.12
import Qt3D.Logic 2.12
import ".."

DefaultScene {
    id: scene
    cameraAspectRatioMode: Scene3D.AutomaticAspectRatio
    OrbitRootEntity {
        position: Qt.vector3d(0, 30, 30)
        Entity {
            id: cube
            CuboidMesh {
                id: cubeGeo
                xExtent: 10
                yExtent: 10
                zExtent: 10
            }
            Transform {
                id: cubeTransform
                matrix: {
                    let m = Qt.matrix4x4()
                    m.translate(0, 0, 0)
                    m.rotate(time.value % 360 * 50, Qt.vector3d(0.5, 1.0, 0.0))
                    return m
                }
                Time {
                    id: time
                }
            }
            TextureMaterial {
                id: cuebMaterial
                texture: Texture2D {
                    generateMipMaps: true
                    minificationFilter: Texture.Linear
                    magnificationFilter: Texture.Linear
                    wrapMode {
                        x: WrapMode.Repeat
                        y: WrapMode.Repeat
                    }
                    TextureImage {
                        mipLevel: 0
                        source: gConfig.resPrefix + "Assets/qingzhi.jpg"
                    }
                }
            }
            components: [cubeGeo, cubeTransform, cuebMaterial]
        }
    }
}
