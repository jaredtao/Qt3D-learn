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
        position: Qt.vector3d(0, 20, 50)
//        Entity {
//            id: plane
//            components: [
//                PlaneMesh {
//                    width: 100
//                    height: 100
//                },
//                Transform {
//                    translation: Qt.vector3d(0.0, -1.0, 0.0)
//                },
//                PhongMaterial {
//                    ambient: "black"
//                    diffuse: "coral"
//                }
//            ]
//        }
//        DirectionalLight {
//            id: directLight1
//            worldDirection: Qt.vector3d(0.0, 0.0, 10.0)
//            color: "white"
//        }
//        DirectionalLight {
//            id: directLight2
//            worldDirection: Qt.vector3d(0.0, 0.0, -10.0)
//            color: "white"
//        }
        NormalDiffuseSpecularMapMaterial {
            id: armMaterial
            diffuse: Texture2D {
                TextureImage {
                    source: gConfig.resPrefix + "Assets/nanosuit/arm_dif.png"
                }
            }
            normal: Texture2D {
                TextureImage {
                    source: gConfig.resPrefix + "Assets/nanosuit/arm_showroom_ddn.png"
                }
            }
            specular: Texture2D {
                TextureImage {
                    source: gConfig.resPrefix + "Assets/nanosuit/arm_showroom_spec.png"
                }
            }
        }
        NormalDiffuseSpecularMapMaterial {
            id: bodyMaterial
            diffuse: Texture2D {
                TextureImage {
                    source: gConfig.resPrefix + "Assets/nanosuit/body_dif.png"
                }
            }
            normal: Texture2D {
                TextureImage {
                    source: gConfig.resPrefix + "Assets/nanosuit/body_showroom_ddn.png"
                }
            }
            specular: Texture2D {
                TextureImage {
                    source: gConfig.resPrefix + "Assets/nanosuit/body_showroom_spec.png"
                }
            }
        }
        NormalDiffuseMapMaterial {
            id: glassMaterial
            diffuse: Texture2D {
                TextureImage {
                    source: gConfig.resPrefix + "Assets/nanosuit/glass_dif.png"
                }
            }
            normal: Texture2D {
                TextureImage {
                    source: gConfig.resPrefix + "Assets/nanosuit/glass_ddn.png"
                }
            }
        }
        NormalDiffuseSpecularMapMaterial {
            id: handMaterial
            diffuse: Texture2D {
                TextureImage {
                    source: gConfig.resPrefix + "Assets/nanosuit/hand_dif.png"
                }
            }
            normal: Texture2D {
                TextureImage {
                    source: gConfig.resPrefix + "Assets/nanosuit/hand_showroom_ddn.png"
                }
            }
            specular: Texture2D {
                TextureImage {
                    source: gConfig.resPrefix + "Assets/nanosuit/hand_showroom_spec.png"
                }
            }
        }
        NormalDiffuseSpecularMapMaterial {
            id: helmetMaterial
            diffuse: Texture2D {
                TextureImage {
                    source: gConfig.resPrefix + "Assets/nanosuit/helmet_diff.png"
                }
            }
            normal: Texture2D {
                TextureImage {
                    source: gConfig.resPrefix + "Assets/nanosuit/helmet_showroom_ddn.png"
                }
            }
            specular: Texture2D {
                TextureImage {
                    source: gConfig.resPrefix + "Assets/nanosuit/helmet_showroom_spec.png"
                }
            }
        }
        NormalDiffuseSpecularMapMaterial {
            id: legMaterial
            diffuse: Texture2D {
                TextureImage {
                    source: gConfig.resPrefix + "Assets/nanosuit/leg_dif.png"
                }
            }
            normal: Texture2D {
                TextureImage {
                    source: gConfig.resPrefix + "Assets/nanosuit/leg_showroom_ddn.png"
                }
            }
            specular: Texture2D {
                TextureImage {
                    source: gConfig.resPrefix + "Assets/nanosuit/leg_showroom_spec.png"
                }
            }
        }
        Entity {
            Mesh {
                id: mesh0
                source: gConfig.resPrefix + "Assets/nanosuit/nanosuit.obj"
            }
            Transform {
                id: transform0
                rotation: fromAxisAndAngle(Qt.vector3d(0, 1.0, 0.0),time.value % 360 * 50)
                Time {
                    id: time
                }
            }
            components: [
                mesh0, transform0, armMaterial, bodyMaterial, glassMaterial, handMaterial, helmetMaterial, legMaterial
            ]
        }
//        Entity {
//            Mesh {
//                id: mesh1
//                source: gConfig.resPrefix + "Assets/nanosuit/nanosuit.obj"
//            }
//            Transform {
//                id: transform1
//                translation: Qt.vector3d(-30.0, 0.0, 0.0)
//                rotation: fromAxisAndAngle(Qt.vector3d(0.0 ,1.0 ,0.0), 60.0)
//            }
//            components: [
//                mesh1, transform1, armMaterial
//            ]
//        }
//        Entity {
//            Mesh {
//                id: mesh2
//                source: gConfig.resPrefix + "Assets/nanosuit/nanosuit.obj"
//            }
//            Transform {
//                id: transform2
//                translation: Qt.vector3d(-20.0, 0.0, 0.0)
//                rotation: fromAxisAndAngle(Qt.vector3d(0.0 ,1.0 ,0.0), 40.0)
//            }
//            components: [
//                mesh2, transform2, bodyMaterial
//            ]
//        }
//        Entity {
//            Mesh {
//                id: mesh3
//                source: gConfig.resPrefix + "Assets/nanosuit/nanosuit.obj"
//            }
//            Transform {
//                id: transform3
//                translation: Qt.vector3d(-10.0, 0.0, 0.0)
//                rotation: fromAxisAndAngle(Qt.vector3d(0.0 ,1.0 ,0.0), 20.0)
//            }
//            components: [
//                mesh3, transform3, glassMaterial
//            ]
//        }
//        Entity {
//            Mesh {
//                id: mesh4
//                source: gConfig.resPrefix + "Assets/nanosuit/nanosuit.obj"
//            }
//            Transform {
//                id: transform4
//                translation: Qt.vector3d(10.0, 0.0, 0.0)
//                rotation: fromAxisAndAngle(Qt.vector3d(0.0 ,1.0 ,0.0), -20.0)
//            }
//            components: [
//                mesh4, transform4, handMaterial
//            ]
//        }
//        Entity {
//            Mesh {
//                id: mesh5
//                source: gConfig.resPrefix + "Assets/nanosuit/nanosuit.obj"
//            }
//            Transform {
//                id: transform5
//                translation: Qt.vector3d(20.0, 0.0, 0.0)
//                rotation: fromAxisAndAngle(Qt.vector3d(0.0 ,1.0 ,0.0), -40.0)
//            }
//            components: [
//                mesh5, transform5, helmetMaterial
//            ]
//        }
//        Entity {
//            Mesh {
//                id: mesh6
//                source: gConfig.resPrefix + "Assets/nanosuit/nanosuit.obj"
//            }
//            Transform {
//                id: transform6
//                translation: Qt.vector3d(30.0, 0.0, 0.0)
//                rotation: fromAxisAndAngle(Qt.vector3d(0.0 ,1.0 ,0.0), -60.0)
//            }
//            components: [
//                mesh6, transform6, legMaterial
//            ]
//        }
    }
}
