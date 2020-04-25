import QtQuick 2.12 as QQ12

import QtQuick.Scene3D 2.12
import Qt3D.Core 2.12
import Qt3D.Render 2.12
import Qt3D.Input 2.12
import Qt3D.Extras 2.12
import Qt3D.Logic 2.12
import ".."
QQ12.Item {
    anchors.fill: parent
    DefaultScene {
        DefaultRootEntity{
            id: rootEntity
            property real mixValue: 0.5
            KeyboardDevice {    //键盘设备。键盘事件的来源
                id: keyboardDevice
            }

            KeyboardHandler {   //键盘事件处理器
                id: keyboardHandler
                focus: true
                sourceDevice: keyboardDevice
                function mix(a, b, u) {
                    return a*(1. - u) + b * u;
                }
                onUpPressed: {
                    rootEntity.mixValue = mix(rootEntity.mixValue, 1.0, 0.1)
                }
                onDownPressed: {
                    rootEntity.mixValue = mix(rootEntity.mixValue, 0.0, 0.1)
                }
            }
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
                    //索引绘制
                    Attribute {
                        attributeType: Attribute.IndexAttribute
                        vertexBaseType: Attribute.UnsignedShort
                        vertexSize: 1
                        count: 6
                        buffer: Buffer {
                            type: Buffer.IndexBuffer
                            data: new Uint16Array([
                                                      0, 1, 3,
                                                      1, 2, 3
                                                  ])
                        }
                    }
                }

                Buffer {
                    id: vertexBuffer
                    type: Buffer.VertexBuffer
                    data: new Float32Array ([
                                                0.5,   0.5,  0.0,  1.0,  1.0,
                                                0.5,  -0.5,  0.0,  1.0,  0.0,
                                                -0.5, -0.5,  0.0,  0.0,  0.0,
                                                -0.5,  0.5,  0.0,  0.0,  1.0,
                                            ])
                }
            }
            Material {
                id: material
                effect: Effect {
                    techniques: Technique {
                        graphicsApiFilter {
                            profile: QQ12.GraphicsInfo.profile === QQ12.GraphicsInfo.CoreProfile ?
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
    uniform sampler2D outTexture1;
    uniform sampler2D outTexture2;
    uniform float mixValue;
    out vec4 color;
    void main()
    {
        color = mix(texture(outTexture1, vTexCoord), texture(outTexture2, vTexCoord), mixValue);
    }
    '
                            }
                        }
                    }
                }
                parameters: [
                    Parameter {
                        name: "outTexture1"
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
                    },
                    Parameter {
                        name: "outTexture2"
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
                                source: gConfig.resPrefix + "Assets/luoli.jpg"
                            }
                        }
                    },
                    Parameter {
                        name: "mixValue"
                        value: rootEntity.mixValue
                    }
                ]
            }
            components: [geo, material]
        }
    }
    QQ12.Text {
        text: qsTr("按Up/Down调节混合比例")
        color: "white"
        width: 300
        height: 80
        visible:!gConfig.isMobile
    }
}
