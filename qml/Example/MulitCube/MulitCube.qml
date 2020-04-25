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
        NodeInstantiator {  //3D中的节点实例化工厂,用来动态创建
            id: nodeFactory
            function randomMatrix4x4(min, max) {
                //随机数生成，取值范围[min, max]
                let x = Math.random() * (max - min) + min
                let y = Math.random() * (max - min) + min
                let z = Math.random() * (max - min) + min
                let mat = Qt.matrix4x4()
                mat.translate(Qt.vector3d(x, y, z))
                return mat
            }
            model: 10

            // 异步开关有bug，直接抛越界异常
            // asynchronous: true
            Cube {
                transform: nodeFactory.randomMatrix4x4(-15, 15)
            }
        }
    }
}
