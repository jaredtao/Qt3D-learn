# 目录
- [目录](#%E7%9B%AE%E5%BD%95)
- [Qt3D-learn](#Qt3D-learn)
  - [CI](#CI)
  - [License](#License)
  - [开发环境](#%E5%BC%80%E5%8F%91%E7%8E%AF%E5%A2%83)
  - [效果预览](#%E6%95%88%E6%9E%9C%E9%A2%84%E8%A7%88)
    - [启动页面](#%E5%90%AF%E5%8A%A8%E9%A1%B5%E9%9D%A2)
    - [HelloScene3D](#HelloScene3D)
    - [HelloScene3D 2](#HelloScene3D-2)
    - [Triangles](#Triangles)
    - [Texture 1](#Texture-1)
    - [Texture 2](#Texture-2)
    - [Texture 3](#Texture-3)
    - [FirstCube](#FirstCube)
    - [MulitCube](#MulitCube)
    - [TextureCube](#TextureCube)
    - [TextureCubeWithPlane](#TextureCubeWithPlane)
    - [TextureCubeMap](#TextureCubeMap)
    - [SkyBox](#SkyBox)
    - [TextureCubeMap](#TextureCubeMap-1)
    - [Text3D](#Text3D)
  - [代码结构](#%E4%BB%A3%E7%A0%81%E7%BB%93%E6%9E%84)
  - [部分理解](#%E9%83%A8%E5%88%86%E7%90%86%E8%A7%A3)
  - [联系方式:](#%E8%81%94%E7%B3%BB%E6%96%B9%E5%BC%8F)
  - [打赏](#%E6%89%93%E8%B5%8F)

# Qt3D-learn

学习Qt3D的使用。在已有资料的基础上，做一些尝试，改进。算是踩坑笔记。

参考:
* https://learnopengl-cn.github.io/
* https://github.com/MidoriYakumo/learnopengl-qt3d


## CI
| [Linux][lin-link] | [Windows][win-link] |
| :---------------: | :-----------------: |
| ![lin-badge]      | ![win-badge]        |

[lin-badge]: https://travis-ci.org/jaredtao/Qt3D-learn.svg?branch=master "Travis build status"
[lin-link]: https://travis-ci.org/jaredtao/Qt3D-learn "Travis build status"
[win-badge]: https://ci.appveyor.com/api/projects/status/4stalyomvmeyxpvo?svg=true "AppVeyor build status"
[win-link]: https://ci.appveyor.com/project/jiawentao/qt3d-learn "AppVeyor build status"
## License
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/jaredtao/Qt3D-learn/blob/master/LICENSE)

## 开发环境

* Qt 5.12.x Windows
  
## 效果预览

### 启动页面

<div style="overflow: hidden;justify-content:space-around;">
  <div style="display: inline-block; max-width: 50%; max-height: 50%" >
    <img src="DemoImages/Examples.png"/>
  </div>
  <div style="display: inline-block; max-width: 30%; max-height: 30%" >
    <img src="DemoImages/Examples_Android.png"/>
  </div>
</div>

参考Qt官方的例子，做了一个列表，可以点击进入、可以返回，也方便在Android设备上运行。

按代码实现来说，就是Loader模拟了StackView。

### HelloScene3D

<img src="DemoImages/1.png" width="50%" height="50%"/>

最小Demo，在Quick场景中，增加初始的3D场景。

### HelloScene3D 2

<div style="overflow: hidden;justify-content:space-around;">
  <div style="display: inline-block; max-width: 50%; max-height: 50%" >
    <img src="DemoImages/2.png"/>
  </div>
  <div style="display: inline-block; max-width: 30%; max-height: 30%" >
    <img src="DemoImages/2_Android.png"/>
  </div>
</div>

增加背景色，以及必要的渲染设置、渲染设备选择器等。
    
增加FPS

### Triangles

<div style="overflow: hidden;justify-content:space-around;">
  <div style="display: inline-block; max-width: 50%; max-height: 50%" >
    <img src="DemoImages/3.png"/>
  </div>
  <div style="display: inline-block; max-width: 30%; max-height: 30%" >
    <img src="DemoImages/3_Android.png"/>
  </div>
</div>

几何形状的绘制。创建了4个3D场景，放在了一起。

左上角为顶点绘制的三角形，3个点+ TriangleFan的方式绘制。

右上角是 索引+顶点绘制的线框模式两个三角形

左下角为一次绘制两个三角形（顶点数据包含两个三角形）

右下角为绘制彩色的三角形(顶点数据之外，增加色彩数据)

### Texture 1

<div style="overflow: hidden;justify-content:space-around;">
  <div style="display: inline-block; max-width: 50%; max-height: 50%" >
    <img src="DemoImages/4.png"/>
  </div>
  <div style="display: inline-block; max-width: 30%; max-height: 30%" >
    <img src="DemoImages/4_Android.png"/>
  </div>
</div>

基本的纹理贴图

### Texture 2
<div style="overflow: hidden;justify-content:space-around;">
  <div style="display: inline-block; max-width: 50%; max-height: 50%" >
    <img src="DemoImages/5.png"/>
  </div>
  <div style="display: inline-block; max-width: 30%; max-height: 30%" >
    <img src="DemoImages/5_Android.png"/>
  </div>
</div>

纹理和自定义颜色的混合

### Texture 3

<div style="overflow: hidden;justify-content:space-around;">
  <div style="display: inline-block; max-width: 50%; max-height: 50%" >
    <img src="DemoImages/6.png"/>
  </div>
  <div style="display: inline-block; max-width: 30%; max-height: 30%" >
    <img src="DemoImages/6_Android.png"/>
  </div>
</div>

两张纹理的混合。增加了键盘设备和键盘处理，按下键盘Up和Down可以调节混合比例。

坑1：手机上居然不能显示第二张纹理

### FirstCube

<div style="overflow: hidden;justify-content:space-around;">
  <div style="display: inline-block; max-width: 50%; max-height: 50%" >
    <img src="DemoImages/7.png"/>
  </div>
  <div style="display: inline-block; max-width: 30%; max-height: 30%" >
    <img src="DemoImages/7_Android.png"/>
  </div>
</div>

一个3D立方体，绕y轴旋转

### MulitCube

<div style="overflow: hidden;justify-content:space-around;">
  <div style="display: inline-block; max-width: 50%; max-height: 50%" >
    <img src="DemoImages/8.png"/>
  </div>
  <div style="display: inline-block; max-width: 30%; max-height: 30%" >
    <img src="DemoImages/8_Android.png"/>
  </div>
</div>

100个立方体，用NodeInstantiator动态创建，坐标随机、大小随机

坑2：异步创建的属性打开就抛异常。

### TextureCube

<div style="overflow: hidden;justify-content:space-around;">
  <div style="display: inline-block; max-width: 50%; max-height: 50%" >
    <img src="DemoImages/9.png"/>
  </div>
  <div style="display: inline-block; max-width: 30%; max-height: 30%" >
    <img src="DemoImages/9_Android.png"/>
  </div>
</div>

CuboidMesh立方体贴图。

顺便记录一下研究过的一些东西:

CuboidGeometry默认可以创建立方体的顶点、纹理坐标等几何信息，但是Material总是贴不上。

自己重写Geometry和shader代码可以实现立方体贴图，略麻烦

CuboidGeometry中的默认信息(来自: qt-everywhere-src-5.12.4\qt3d\src\render\geometry\qattribute.cpp)

|属性|着色器中对应默认名称|
|----|----|
|顶点坐标|vertexPosition|
|法线|vertexNormal|
|颜色|vertexColor|
|第一层纹理坐标|vertexTexCoord|
|切线|vertexTangent|
|索引|vertexJointIndices|
|权重|vertexJointWeights|
|第二层纹理坐标|vertexTexCoord1|
|第三层纹理坐标|vertexTexCoord2|

(用不来，后面的TextureCubeMap例子，还是写了自定义Geometry。。。)

### TextureCubeWithPlane

<div style="overflow: hidden;justify-content:space-around;">
  <div style="display: inline-block; max-width: 50%; max-height: 50%" >
    <img src="DemoImages/10.png"/>
  </div>
  <div style="display: inline-block; max-width: 30%; max-height: 30%" >
    <img src="DemoImages/10_Android.png"/>
  </div>
</div>

加个地板（PlaneMesh + PhongMaterial），打个光 (PointLight)

注意调整好相机角度或者地板位置，不然默认视角所在平面和地板平行了，就看不见了。

PhongMaterial冯氏材质是有光晕效果的，其实从前面的立方体开始一直都用的冯氏材质。

不加材质就是纯黑色的立方体。这里PointLight的效果更明显一些，就会覆盖冯氏材质的光晕效果。

### TextureCubeMap

Qt3D的 TextureCubeMap 没有实现，等后续版本再补充。

### SkyBox

<div style="overflow: hidden;justify-content:space-around;">
  <div style="display: inline-block; max-width: 50%; max-height: 50%" >
    <img src="DemoImages/11.png"/>
  </div>
  <div style="display: inline-block; max-width: 30%; max-height: 30%" >
    <img src="DemoImages/11_Android.png"/>
  </div>
</div>

天空盒, SkyboxEntity。注意6张图片的名称。

### TextureCubeMap

<div style="overflow: hidden;justify-content:space-around;">
  <div style="display: inline-block; max-width: 50%; max-height: 50%" >
    <img src="DemoImages/12.png"/>
  </div>
  <div style="display: inline-block; max-width: 30%; max-height: 30%" >
    <img src="DemoImages/12_Android.png"/>
  </div>
</div>

### Text3D

<div style="overflow: hidden;justify-content:space-around;">
  <div style="display: inline-block; max-width: 50%; max-height: 50%" >
    <img src="DemoImages/14.gif"/>
  </div>
</div>

3D文字 ExtrudedTextMesh。

2D文字除了Quick/SceneGraph 中的Text，还有FrameGraph中的Text2DEntity,要放在Scene2D场景中。

相当于把2维场景渲染到一张纹理Texture上，再把Texture渲染到3D场景中。

在不需要Quick/SceneGraph的高级场景中，大有用处。比如最近Qt官方公众号上宣传的那几个3D文章，

就提到了高端场景，不要任何Quick，应该就是用这种方式实现的。

### HeloMesh

<div style="overflow: hidden;justify-content:space-around;">
  <div style="display: inline-block; max-width: 50%; max-height: 50%" >
    <img src="DemoImages/15.png"/>
  </div>
  <div style="display: inline-block; max-width: 30%; max-height: 30%" >
    <img src="DemoImages/15_Android.png"/>
  </div>
</div>

加载模型

### Meshes

<div style="overflow: hidden;justify-content:space-around;">
  <div style="display: inline-block; max-width: 50%; max-height: 50%" >
    <img src="DemoImages/16.png"/>
  </div>
  <div style="display: inline-block; max-width: 30%; max-height: 30%" >
    <img src="DemoImages/16_Android.png"/>
  </div>
</div>

几何Mesh 的合影

## 代码结构

<img src="DemoImages/code.png" width="50%" height="50%"/>



## 部分理解

2019/7/21 TextureCubeMap 这些特殊的纹理贴图功能，都没有实现，C++代码里只有空的类构造、析构函数。。。

我想贴个六面骰子出来，自己撸Geometry + shader吗？ SkyBox效果类似，但是深度处理不一样。

2019/7/21  截至到5.13.0, Qt3D文档上宣传的 刚体、重力、AI寻路 等部分，根本没有任何代码。

只在Bitbucket上面找到一个叫 陈斌的大佬封装的 Bullet Physics QML Plugin。

https://bitbucket.org/csaga77/bullet-physics-qml-plugin/src/master/

## 联系方式:

***

| 作者 | 涛哥                           |
| ---- | -------------------------------- |
|开发理念 | 弘扬鲁班文化，传承工匠精神 |
| 博客 | https://jaredtao.github.io/ |
|博客-国内镜像|https://jaredtao.gitee.io|
|知乎专栏| https://zhuanlan.zhihu.com/TaoQt |
|微信公众号| Qt进阶之路 |
|QQ群| 734623697(高质量群，只能交流技术、分享知识、帮助解决实际问题）|
| 邮箱 | jared2020@163.com                |
| 微信 | xsd2410421                       |
| QQ、TIM | 759378563                      |

***

QQ(TIM)、微信二维码

<img src="https://github.com/jaredtao/jaredtao.github.io/blob/master/img/qq_connect.jpg?raw=true" width="30%" height="30%" /><img src="https://github.com/jaredtao/jaredtao.github.io/blob/master/img/weixin_connect.jpg?raw=true" width="30%" height="30%" />


***
## 打赏
<img src="https://github.com/jaredtao/jaredtao.github.io/blob/master/img/weixin.jpg?raw=true" width="30%" height="30%" /><img src="https://github.com/jaredtao/jaredtao.github.io/blob/master/img/zhifubao.jpg?raw=true" width="30%" height="30%" />

觉得分享的内容还不错, 就请作者喝杯奶茶吧~~
***

