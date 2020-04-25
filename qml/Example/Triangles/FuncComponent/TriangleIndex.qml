import QtQuick 2.12
import Qt3D.Core 2.12
import Qt3D.Render 2.12

Entity {
    id: plane
    GeometryRenderer {
        id: geometrtRenderer
        primitiveType: GeometryRenderer.LineLoop
        geometry: Geometry {
            boundingVolumePositionAttribute: position
            Attribute {
                id: position
                attributeType: Attribute.VertexAttribute
                vertexBaseType: Attribute.Float
                vertexSize: 3
                count: 4
                name: "position"
                buffer: Buffer {
                    type: Buffer.VertexBuffer
                    usage: Buffer.StaticDraw
                    accessType: Buffer.Write
                    data: new Float32Array(
                              [
                                  -0.5, -0.5, 0.0,
                                  0.5, -0.5, 0.0,
                                  0.5, 0.5, 0.0,
                                  -0.5, 0.5, 0.0
                              ]
                              )

                }
            }
            Attribute {
                attributeType: Attribute.IndexAttribute
                vertexBaseType: Attribute.UnsignedShort
                vertexSize: 1
                count: 6
                buffer:  Buffer {
                    type: Buffer.IndexBuffer
                    usage: Buffer.StaticDraw
                    accessType: Buffer.Write
                    data: new Uint16Array([
                                              0,1,2,
                                              0,2,3
                                          ])
                }
            }
        }
    }
    Material {
        id: material
        effect: Effect {
            techniques: Technique {
                graphicsApiFilter {
                    profile: GraphicsInfo.profile === GraphicsInfo.CoreProfile ?
                                 GraphicsApiFilter.CoreProfile : GraphicsApiFilter.NoProfile
                }
                renderPasses: RenderPass {
                    renderStates: CullFace {
                        mode: CullFace.NoCulling
                    }

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
