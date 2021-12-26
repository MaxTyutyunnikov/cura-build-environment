set(pyqt_command "")
if(BUILD_OS_WINDOWS)
    add_custom_target(PyQt
#        COMMAND ${Python3_EXECUTABLE} -m pip install PyQt5==5.10
        COMMAND ${Python3_EXECUTABLE} -m pip install PyQt5==5.13.2 PyQt5-sip sip
        COMMENT "Installing PyQt5"
    )

    SetProjectDependencies(TARGET PyQt DEPENDS Python)
else()
    add_custom_target(PyQt_pip
#        COMMAND ${Python3_EXECUTABLE} -m pip install PyQt5==5.10
        COMMAND ${Python3_EXECUTABLE} -m pip install PyQt5==5.13.2 PyQt5-sip sip
        COMMENT "Installing PyQt5"
    )
    if(BUILD_OS_OSX)
        set(pyqt_command
            "DYLD_LIBRARY_PATH=${CMAKE_INSTALL_PREFIX}/lib"
            ${Python3_EXECUTABLE} configure.py
            --sysroot ${CMAKE_INSTALL_PREFIX}
            --qmake ${CMAKE_INSTALL_PREFIX}/bin/qmake
            --sip ${CMAKE_INSTALL_PREFIX}/bin/sip
            --confirm-license
        )
#            --sip-module PyQt5.sip
    else()
        set(pyqt_command
            # On Linux, PyQt configure fails because it creates an executable that does not respect RPATH
            "LD_LIBRARY_PATH=${CMAKE_INSTALL_PREFIX}/lib"
            ${Python3_EXECUTABLE} configure.py
            --sysroot ${CMAKE_INSTALL_PREFIX}
            --qmake ${CMAKE_INSTALL_PREFIX}/bin/qmake
            --sip ${CMAKE_INSTALL_PREFIX}/bin/sip
            --confirm-license
        )
#            --sip-module PyQt5.sip
    endif()

    ExternalProject_Add(PyQt
##        URL https://downloads.sourceforge.net/project/pyqt/PyQt5/PyQt-5.11.3/PyQt5_gpl-5.11.3.zip
##        URL_MD5 e9bd7ade2d04a4da144570a8b654e054
##        URL https://downloads.sourceforge.net/project/pyqt/PyQt5/PyQt-5.10/PyQt5_gpl-5.10.tar.gz
##        URL_MD5 4874c5985246fdeb4c3c7843a3e6ef53
        URL https://downloads.sourceforge.net/project/pyqt/PyQt5/PyQt-5.11.3/PyQt5_gpl-5.11.3.zip
        URL_MD5 e9bd7ade2d04a4da144570a8b654e054
        CONFIGURE_COMMAND ${pyqt_command}
        BUILD_IN_SOURCE 1
    )

    SetProjectDependencies(TARGET PyQt DEPENDS PyQt_pip Qt Sip)

endif()
