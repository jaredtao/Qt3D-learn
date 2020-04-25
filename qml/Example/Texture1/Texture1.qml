import QtQuick.Scene3D 2.12
import Qt3D.Core 2.12
import Qt3D.Render 2.12
import Qt3D.Input 2.12
import Qt3D.Extras 2.12
import Qt3D.Logic 2.12
import QtQuick 2.12
import ".."
DefaultScene {
    DefaultRootEntity{
        GeometryRenderer {
            id: geo

            geometry: Geometry {
                boundingVolumePositionAttribute: position
                Attribute {
                    id: position
                    name: "position"
                    attributeType: Attribute.VertexAttribute
                    vertexBaseType: Attribute.Float
                    vertexSize: 3
                    count: 4
                    byteOffset: 0
                    byteStride: 5 * 4
                    buffer: vertexBuffer
                }
                Attribute {
                    name: "texCoord"
                    attributeType: Attribute.VertexAttribute
                    vertexBaseType: Attribute.Float
                    vertexSize: 2
                    count: 4
                    byteOffset: 3 * 4
                    byteStride: 5 * 4
                    buffer: vertexBuffer
                }
            }
            //TriangleFan 方式绘制，四个点连起来。
            primitiveType: GeometryRenderer.TriangleFan

            Buffer {
                id: vertexBuffer
                type: Buffer.VertexBuffer
                data: new Float32Array ([
                                            1.0,   1.0,  0.0,   1.0,  1.0,
                                            1.0,  -1.0,  0.0,   1.0,  0.0,
                                            -1.0, -1.0,  0.0,   0.0,  0.0,
                                            -1.0,  1.0,  0.0,   0.0,  1.0,
                                        ])
            }
        }
        Material {
            id: material
            effect: Effect {
                techniques: Technique {
                    graphicsApiFilter {
                        profile: GraphicsInfo.profile === GraphicsInfo.CoreProfile ?
                                     GraphicsApiFilter.CoreProfile : GraphicsApiFilter.NoProfile;
                    }
                    renderPasses: RenderPass {
                        renderStates: CullFace { mode: CullFace.NoCulling}
                        shaderProgram: ShaderProgram {
                            vertexShaderCode:gConfig.shaderVersionString + '
    layout (location = 0) in vec3 position;
    layout (location = 1) in vec2 texCoord;
    out vec2 vTexCoord;
    void main()
    {
        gl_Position = vec4(position, 1.0f);
        vTexCoord = texCoord;
    }
    '
                            fragmentShaderCode: gConfig.shaderVersionString + '
    in vec2 vTexCoord;
    uniform sampler2D outTexture;
    out vec4 color;
    void main()
    {
        color = texture(outTexture, vTexCoord);
    }
    '
                        }
                    }
                }
            }
            parameters: Parameter {
                name: "outTexture"
                value: Texture2D {
                    generateMipMaps: true
                    minificationFilter: Texture.Linear
                    magnificationFilter: Texture.Linear
                    wrapMode {
                        x: WrapMode.Repeat
                        y: WrapMode.Repeat
                    }
                    TextureImage {
                        mipLevel: 0
                        source: gConfig.resPrefix + "Assets/qingzhi.jpg"
                    }
                }
            }
        }
        components: [geo, material]
    }
}
