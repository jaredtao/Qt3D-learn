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
        position: Qt.vector3d(0, 50, 50)
//        clearColor: Qt.rgba(0, 0, 0, 1)
//        Entity {
//            PlaneMesh {
//                id: groundMesh
//                width: 50
//                height: width
//                meshResolution: Qt.size(2, 2)
//            }
//            Transform {
//                id: groundTransform
//                translation: Qt.vector3d(0, -5, 0)
//            }
//            PhongMaterial {
//                id: material
//            }
//            components: [
//                groundMesh,
//                groundTransform,
//                material
//            ]
//        }
        //Adding light
//        Entity {
//            components: [
//                PointLight {
//                    id: pointLight
//                    color: "#5aa7da"

//                    intensity: 1
//                    constantAttenuation: 1.0
//                    linearAttenuation: 0.0
//                    quadraticAttenuation: 0.0025
//                },
//                Transform {
//                    translation: Qt.vector3d(0.0, 5.0, 5.0)
//                }
//            ]
//        }
        Entity {
            components: [
                PhongMaterial {
                    ambient: "#329a49"
                },
                CuboidMesh {    //立方体
                    xExtent: 8
                    yExtent: 8
                    zExtent: 8
                },
                Transform {
                    translation: Qt.vector3d(-30, 0, 0)
                }
            ]
        }
        Entity {
            components: [
                PhongMaterial {
                    ambient: "#d46c2c"
                },
                ConeMesh {  //圆锥
                    bottomRadius: 6
                    slices: 36
                    topRadius: 0
                    length: 8
                    rings: 12
                },
                Transform {
                    translation: Qt.vector3d(-15, 0, 0)
                }
            ]
        }
        Entity {
            components: [
                PhongMaterial {
                    ambient: "#2785be"
                },
                CylinderMesh {  //圆柱
                    length: 8
                    radius: 6
                    slices: 36
                },
                Transform {
                    translation: Qt.vector3d(0, 0, 0)
                }
            ]
        }
        Entity {
            components: [
                PhongMaterial {
                    ambient: "#279d45"
                },
                SphereMesh {  //球
                    radius: 6
                    slices: 36
                },
                Transform {
                    translation: Qt.vector3d(15, 0, 0)
                }
            ]
        }
        Entity {
            components: [
                PhongMaterial {
                    ambient: "#d2c71a"
                },
                TorusMesh {
                    radius: 6
                    minorRadius: 1.5
                    slices: 128
                    rings: 12
                },
                Transform {
                    rotation: fromAxisAndAngle(Qt.vector3d(1.0, 0.0, 0.0), 90)
                    translation: Qt.vector3d(30, 0, 0)

                }
            ]
        }
    }
}
