import Qt3D.Core 2.12
import Qt3D.Render 2.12
Entity {
    id: plane
    GeometryRenderer {
        id: geometry1
        geometry: Geometry {
            Attribute {
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
                                  0.5, -0.5, 0,
                                  0.0, 0.5, 0.0,
                              ])

                }
            }
            Attribute {
                attributeType: Attribute.VertexAttribute
                vertexBaseType: Attribute.Float
                vertexSize: 3
                count: 3
                name: "color"
                buffer: Buffer {
                    type: Buffer.VertexBuffer
                    usage: Buffer.StaticDraw
                    accessType: Buffer.Write
                    data: new Float32Array (
                              [
                                1.0, 0.0, 0.0,
                                 0.0, 1.0, 0.0,
                                  0.0, 0.0, 1.0,
                              ]
                              )
                }
            }
        }
    }
    Material {
        id: material1
        effect: Effect {
            techniques: Technique {
                renderPasses: RenderPass {
                    shaderProgram: ShaderProgram {
                        vertexShaderCode: gConfig.shaderVersionString + '
layout (location = 0) in vec3 position;
layout (location = 1) in vec3 color;
out vec3 vColor;
void main()
{
    gl_Position = vec4(position, 1.0f);
    vColor = color;
}
'
                        fragmentShaderCode: gConfig.shaderVersionString + '
in vec3 vColor;
out vec4 color;
void main()
{
    color = vec4(vColor, 1.0);
}
'
                    }
                }
            }
        }
    }
    Entity {
        components: [geometry1, material1]
    }
}
