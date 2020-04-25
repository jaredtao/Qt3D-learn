import Qt3D.Render 2.12
import QtQuick 2.12

Technique {
    graphicsApiFilter {
        profile: GraphicsInfo.profile === GraphicsInfo.CoreProfile ?
            GraphicsApiFilter.CoreProfile : GraphicsApiFilter.NoProfile;
    }
}