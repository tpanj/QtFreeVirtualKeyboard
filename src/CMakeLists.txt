cmake_minimum_required(VERSION 3.16)
project(chapter6-plugins LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)

if(NOT DEFINED INSTALL_EXAMPLESDIR)
    set(INSTALL_EXAMPLESDIR "examples")
endif()

#set(INSTALL_EXAMPLEDIR "${INSTALL_EXAMPLESDIR}/qml/tutorials/extending-qml/chapter6-plugins")
set(INSTALL_EXAMPLEDIR "/tmp/DEPLOY")

find_package(Qt6 REQUIRED COMPONENTS Qml Quick)

qt6_add_qml_module(freevirtualkeyboard
    VERSION 1.0
    URI "FreeVirtualKeyboard"
    QML_FILES InputPanel.qml  KeyButton.qml  KeyModel.qml  KeyPopup.qml  KeySelector.qml  LayoutSelector.qml layouts/Layout_en_US.qml
    RESOURCES FontAwesome.otf
    #PLUGIN_TARGET freevirtualkeyboard
)

target_sources(freevirtualkeyboard PRIVATE
    DeclarativeInputEngine.cpp  DeclarativeInputEngine.h  virtualkeyboard_global.h
    VirtualKeyboardInputContext.cpp  VirtualKeyboardInputContext.h
    VirtualKeyboardInputContextPlugin.cpp  VirtualKeyboardInputContextPlugin.h
)

target_link_libraries(freevirtualkeyboard PRIVATE
    Qt::Core
    Qt::Gui
    Qt::GuiPrivate
    Qt::Qml
    Qt::Quick
    Qt::QuickPrivate
    # Qt::Widgets # daj ven tudi iz find_package
)

if(QT6_IS_SHARED_LIBS_BUILD AND APPLE)
    get_target_property(is_bundle chapter6-plugins MACOSX_BUNDLE)
    if(is_bundle)
        # The application's main.cpp adds an explicit QML import path to look for qml modules under
        # a PlugIns subdirectory in a macOS bundle.
        # Copy the qmldir and shared library qml plugin.

        set(charts_dir "$<TARGET_FILE_DIR:freevirtualkeyboard>")
        set(chars_qmldir_file "${charts_dir}/qmldir")
        set(app_dir "$<TARGET_FILE_DIR:chapter6-plugins>")
        set(bundle_charts_dir "${app_dir}/../PlugIns/FreeVirtualKeyboard")

        add_custom_command(TARGET freevirtualkeyboard POST_BUILD
            COMMAND ${CMAKE_COMMAND} -E make_directory ${bundle_charts_dir}
            COMMAND ${CMAKE_COMMAND} -E copy_if_different
                    $<TARGET_FILE:freevirtualkeyboard> ${bundle_charts_dir}
            COMMAND ${CMAKE_COMMAND} -E copy_if_different
                    ${chars_qmldir_file} ${bundle_charts_dir}
        )
    endif()
endif()

set(INSTALL_EXAMPLEDIR "${INSTALL_EXAMPLEDIR}/FreeVirtualKeyboard")
install(TARGETS freevirtualkeyboard
    RUNTIME DESTINATION "${INSTALL_EXAMPLEDIR}"
    BUNDLE DESTINATION "${INSTALL_EXAMPLEDIR}"
    LIBRARY DESTINATION "${INSTALL_EXAMPLEDIR}"
)
