import QtQuick.Scene3D 2.12
import Qt3D.Core 2.12
import Qt3D.Render 2.12
import Qt3D.Input 2.12
import Qt3D.Extras 2.12
import Qt3D.Logic 2.12
Scene3D {   //Scene3D 继承于Item，用来在Quick场景中添加3D场景
    anchors.fill: parent
    focus: true
    aspects: ["logic", "input"]
}
