import QtQuick.Scene3D 2.12
import Qt3D.Core 2.12
import Qt3D.Render 2.12
import Qt3D.Input 2.12
import Qt3D.Extras 2.12
import Qt3D.Logic 2.12
import QtQuick 2.12 as QQ2
Scene3D {   //Scene3D 继承于Item，用来在Quick场景中添加3D场景
    anchors.fill: parent
    focus: true
    aspects: ["logic"]
    Entity {    //一切都从"实体"开始
        RenderSettings {    //渲染设置
            activeFrameGraph: ClearBuffers {    //清除用的缓冲
                buffers: ClearBuffers.ColorBuffer
                clearColor: Qt.rgba(0.2, 0.3,  0.3, 1.0)
                RenderSurfaceSelector {}    //默认的Surfece选择器，默认选Window
            }
        }
        FrameAction {
            onTriggered: {
                gConfig.frame++
            }
        }
    }
}
