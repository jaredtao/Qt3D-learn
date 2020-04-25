import QtQuick3D 1.14
import QtQuick 2.12

Node {
    id: _BlenderRoot_
    rotationOrder: Node.XYZr
    orientation: Node.RightHanded

    PointLight {
        id: lamp_005
        x: 0.38867
        y: -2.22847
        z: 10.991
        rotation.x: 37.2611
        rotation.y: 3.16371
        rotation.z: 106.936
        rotationOrder: Node.XYZr
        orientation: Node.RightHanded
        linearFade: 1
    }

    PointLight {
        id: lamp_004
        x: 1.43926
        y: 1.12754
        z: 8.53521
        rotation.x: 37.2611
        rotation.y: 3.16371
        rotation.z: 106.936
        rotationOrder: Node.XYZr
        orientation: Node.RightHanded
        linearFade: 1
    }

    PointLight {
        id: lamp_003
        x: -5.26095
        y: -13.5173
        z: -0.280735
        rotation.x: 37.2611
        rotation.y: 3.16371
        rotation.z: 106.936
        rotationOrder: Node.XYZr
        orientation: Node.RightHanded
        linearFade: 1
    }

    PointLight {
        id: lamp_002
        x: -6.56325
        y: -1.23202
        z: 18.4805
        rotation.x: 37.2611
        rotation.y: 3.16371
        rotation.z: 106.936
        rotationOrder: Node.XYZr
        orientation: Node.RightHanded
        linearFade: 1
    }

    PointLight {
        id: lamp_001
        x: -10.2234
        y: -8.17537
        z: 14.3415
        rotation.x: 37.2611
        rotation.y: 3.16371
        rotation.z: 106.936
        rotationOrder: Node.XYZr
        orientation: Node.RightHanded
        linearFade: 1
    }

    Model {
        id: visor
        rotation.x: 90
        rotationOrder: Node.XYZr
        orientation: Node.RightHanded
        source: "meshes/visor.mesh"

        DefaultMaterial {
            id: glass_material
            diffuseColor: "#ffcccccc"
            normalMap: Texture {
                source: "maps/glass_ddn.png"
                tilingModeHorizontal: Texture.Repeat
                tilingModeVertical: Texture.Repeat
            }        }
        materials: [
            glass_material
        ]
    }

    Model {
        id: legs
        rotation.x: 90
        rotationOrder: Node.XYZr
        orientation: Node.RightHanded
        source: "meshes/legs.mesh"

        DefaultMaterial {
            id: leg_material
            diffuseMap: Texture {
                source: "maps/leg_dif.png"
                tilingModeHorizontal: Texture.Repeat
                tilingModeVertical: Texture.Repeat
            }
            bumpMap: Texture {
                source: "maps/leg_showroom_ddn.png"
                tilingModeHorizontal: Texture.Repeat
                tilingModeVertical: Texture.Repeat
            }        }
        materials: [
            leg_material
        ]
    }

    Model {
        id: hands
        rotation.x: 90
        rotationOrder: Node.XYZr
        orientation: Node.RightHanded
        source: "meshes/hands.mesh"

        DefaultMaterial {
            id: hand_material
            diffuseMap: Texture {
                source: "maps/hand_dif.png"
                tilingModeHorizontal: Texture.Repeat
                tilingModeVertical: Texture.Repeat
            }
            normalMap: Texture {
                source: "maps/hand_showroom_ddn.png"
                tilingModeHorizontal: Texture.Repeat
                tilingModeVertical: Texture.Repeat
            }        }
        materials: [
            hand_material
        ]
    }

    Model {
        id: lights
        rotation.x: 90
        rotationOrder: Node.XYZr
        orientation: Node.RightHanded
        source: "meshes/lights.mesh"
        materials: [
            glass_material
        ]
    }

    Model {
        id: arms
        rotation.x: 90
        rotationOrder: Node.XYZr
        orientation: Node.RightHanded
        source: "meshes/arms.mesh"

        DefaultMaterial {
            id: arm_material
            diffuseColor: "#ffcccccc"
            normalMap: Texture {
                source: "maps/arm_showroom_ddn.png"
                tilingModeHorizontal: Texture.Repeat
                tilingModeVertical: Texture.Repeat
            }        }
        materials: [
            arm_material
        ]
    }

    Model {
        id: helmet
        rotation.x: 90
        rotationOrder: Node.XYZr
        orientation: Node.RightHanded
        source: "meshes/helmet.mesh"

        DefaultMaterial {
            id: helmet_material
            diffuseColor: "#ffcccccc"
            normalMap: Texture {
                source: "maps/helmet_showroom_ddn.png"
                tilingModeHorizontal: Texture.Repeat
                tilingModeVertical: Texture.Repeat
            }        }
        materials: [
            helmet_material
        ]
    }

    Model {
        id: body
        rotation.x: 90
        rotationOrder: Node.XYZr
        orientation: Node.RightHanded
        source: "meshes/body.mesh"

        DefaultMaterial {
            id: body_material
            diffuseColor: "#ffcccccc"
            normalMap: Texture {
                source: "maps/body_showroom_ddn.png"
                tilingModeHorizontal: Texture.Repeat
                tilingModeVertical: Texture.Repeat
            }        }
        materials: [
            body_material
        ]
    }

    PointLight {
        id: lamp
        x: 4.07625
        y: 1.00545
        z: 5.90386
        rotation.x: 37.2611
        rotation.y: 3.16371
        rotation.z: 106.936
        rotationOrder: Node.XYZr
        orientation: Node.RightHanded
        linearFade: 1
    }

    PerspectiveCamera {
        id: camera
        x: 16.3957
        y: -15.5386
        z: 21.2162
        rotation.x: -116.441
        rotation.y: 0.619768
        rotation.z: 46.6919
        rotationOrder: Node.XYZr
        orientation: Node.RightHanded
        clipNear: 0.1
        clipFar: 100
        fieldOfView: 49.1343
        fieldOfViewOrientation: Camera.Horizontal
    }
}
