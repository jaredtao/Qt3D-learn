import Qt3D.Core 2.12
import Qt3D.Render 2.12
Entity {
    id: plane
    GeometryRenderer {
        id: geometrtRenderer
        geometry: Geometry {
            Attribute {
                id: position
                attributeType: Attribute.VertexAttribute
                vertexBaseType: Attribute.Float
                vertexSize: 3
                count: 6
                name: "position"
                buffer: Buffer {
                    type: Buffer.VertexBuffer
                    usage: Buffer.StaticDraw
                    accessType: Buffer.Write
                    data: new Float32Array(
                              [
                                  -0.9, -0.5, 0.0,
                                  0, -0.5, 0,
                                  -0.45, 0.5, 0.0,
                                  0.0, -0.5, 0.0,
                                  0.9, -0.5, 0.0,
                                  0.45,  0.5, 0.0,
                              ])

                }
            }
        }
    }
    Material {
        id: material
        effect: Effect {
            techniques: Technique {
                renderPasses: RenderPass {
                    shaderProgram: ShaderProgram {
                        vertexShaderCode:gConfig.shaderVersionString + '
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
