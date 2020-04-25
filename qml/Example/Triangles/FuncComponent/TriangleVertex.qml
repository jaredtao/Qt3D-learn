import QtQuick 2.12
import Qt3D.Core 2.12
import Qt3D.Render 2.12
import Qt3D.Extras 2.12
Entity {
    id: plane
    GeometryRenderer {  //几何渲染器
        id: geometrtRenderer
        geometry: Geometry {    //几何体
            Attribute {     //属性Attribute，对应Shader中的attribute
                id: position
                attributeType: Attribute.VertexAttribute
                vertexBaseType: Attribute.Float
                vertexSize: 3
                count: 3
                name: "position"
                buffer: Buffer {
                    type: Buffer.VertexBuffer
                    usage: Buffer.StaticDraw
                    accessType: Buffer.Write
                    data: new Float32Array(
                              [
                                  -0.5, -0.5, 0.0,
                                  0.5, -0.5, 0.0,
                                  0.0,  0.5, 0.0,
                              ])

                }
            }
        }
    }
    Material {
        id: material
        effect: Effect {
            techniques: Technique {
                //profile 默认为 NoProfile。 Core模式时，设置为CoreProfile。精简。
                graphicsApiFilter.profile: GraphicsInfo.profile === GraphicsInfo.CoreProfile ?
                                               GraphicsApiFilter.CoreProfile : GraphicsApiFilter.NoProfile
                
                renderPasses: RenderPass {
                    shaderProgram: ShaderProgram {
                        vertexShaderCode: gConfig.shaderVersionString + '
layout (location = 0) in vec3 position;
void main()
{
    gl_Position = vec4(position, 1.0f);
}
'
                        fragmentShaderCode: gConfig.shaderVersionString + '
out vec4 color;
void main()
{
    color = vec4(1.0f, 0.5f, 0.2f, 1.0f);
}
'
                    }
                }
            }
        }

    }
    components: [geometrtRenderer, material]
}
