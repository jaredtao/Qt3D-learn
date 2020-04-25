import Qt3D.Core 2.12
import Qt3D.Render 2.12
import Qt3D.Input 2.12
import Qt3D.Logic 2.12
Entity {
    id: rootNode
    property color clearColor: Qt.rgba(0.2, 0.3, 0.3, 1.0)
    RenderSettings {
        id: renderSettings
        activeFrameGraph: ClearBuffers {
            buffers: ClearBuffers.ColorDepthBuffer
            clearColor: rootNode.clearColor

            RenderSurfaceSelector {
                RenderStateSet {
                    renderStates: DepthTest {
                        depthFunction: DepthTest.Less
                    }
                }
            }
        }
    }
    InputSettings {
        id: inputtingSettings
    }
    FrameAction {
        onTriggered: {
            gConfig.frame++
        }
    }
}
