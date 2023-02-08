#-------------------------------------------------
#
# Project created by QtCreator 2013-04-04T23:11:38
#
#-------------------------------------------------

QT       += qml quick quick-private gui-private

CONFIG += plugin

TARGET = freevirtualkeyboardplugin
TEMPLATE = lib


SOURCES += src/VirtualKeyboardInputContextPlugin.cpp \
    src/VirtualKeyboardInputContext.cpp \
    src/DeclarativeInputEngine.cpp

HEADERS += src/VirtualKeyboardInputContextPlugin.h\
    src/VirtualKeyboardInputContext.h \
    src/DeclarativeInputEngine.h


deployment.files = src/*.qml src/FontAwesome.otf src/qmldir
deployment_layouts.files = src/layouts/*.qml


linux-buildroot-g++ {
    deployment.path = /usr/qml/QtQuick/FreeVirtualKeyboard
    deployment_layouts.path = /usr/qml/QtQuick/FreeVirtualKeyboard/layouts
    target.path = /usr/lib/qt/plugins/platforminputcontexts
} else {
    deployment.path = $$[QT_INSTALL_QML]/QtQuick/FreeVirtualKeyboard
    deployment_layouts.path = $$[QT_INSTALL_QML]/QtQuick/FreeVirtualKeyboard/layouts
    target.path = $$[QT_INSTALL_PLUGINS]/platforminputcontexts
}


INSTALLS += target \
    deployment \
    deployment_layouts

OTHER_FILES += \
    src/InputPanel.qml \
    src/KeySelector.qml \
    src/KeyButton.qml \
    src/KeyPopup.qml \
    src/LayoutSelector.qml \
    src/layouts/Layout_en_US.qml

RESOURCES += \
    src/virtualkeyboard.qrc

DISTFILES += \
    src/KeySelector.qml \
    src/LayoutSelector.qml \
    src/layouts/Layout_en_US.qml
