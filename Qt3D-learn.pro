QT += quick quickcontrols2
CONFIG += c++11 resources_big

DEFINES += QT_DEPRECATED_WARNINGS

SOURCES += \
    src/main.cpp

DESTDIR = $$absolute_path($$PWD/bin)

CONFIG(debug, debug|release) {
    #debug模式直接用本地qml文件,不要qrc资源文件。这样调试快一些。
    DEFINES += QmlPrefixPath=\\\"file:///$$PWD/qml/\\\"

    OTHER_FILES += $$files(qml/*.qml, true) \
    $$files(qml/*.png, true) \
    $$files(qml/*.jpg, true)
} else {
    #release模式用qrc、走资源文件。这样发布不会携带源码。
    RESOURCES += qml.qrc
    DEFINES += QmlPrefixPath=\\\"qrc:/qml/\\\"
}

android{
    RESOURCES *= qml.qrc
}


OTHER_FILES += \
    README.md \
    .clang-format \
    .travis.yml \
    appveyor.yml \
    LICENSE \

DISTFILES += \
    android/AndroidManifest.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew \
    android/gradlew.bat \
    android/res/values/libs.xml \
    qml/Config.qml \
    qml/Example/DefaultScene.qml

contains(ANDROID_TARGET_ARCH,x86) {
    ANDROID_PACKAGE_SOURCE_DIR = \
        $$PWD/android
}
