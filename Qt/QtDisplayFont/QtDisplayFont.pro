#-------------------------------------------------
#
# Project created by QtCreator 2016-06-08T13:26:10
#
#-------------------------------------------------

QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = QtDisplayFont
TEMPLATE = app


SOURCES += main.cpp\
        mainwindow.cpp \
    vsroomlink.cpp \
    VsPlugin.cpp \
    VsStatus.cpp

HEADERS  += mainwindow.h \
    vsroomlink.h \
    VsPlugin.h \
    VsStatus.h

FORMS    += mainwindow.ui \
    vsroomlink.ui

INCLUDEPATH +=\
                VidyoClient/include

macx {
        QMAKE_INFO_PLIST = resources/macx/info.plist
        APP_FONT_FILES.files = resources/fonts/System.vyf
        QMAKE_BUNDLE_DATA += APP_FONT_FILES
}

win32 {
       RC_FILE = resources/win32/win32.rc
}


unix {
        macx {
            LIBS += \
            ../QtDisplayFont/VidyoClient/lib/mac/VidyoClientDll.dylib

        } else {
        LIBS += \
        VidyoClient/lib/linux/libVidyoClientDll.so\
        -LVidyoClient/lib\
        -lblkid\
        -lXrandr\
        -lanl\
        -lpthread\
        -lGL -lGLU -lX11\
        -lrt
        }
}
win32 {
        LIBS += \
        -L..\\QtDisplayFont\\VidyoClient\\lib\\win32\
        VidyoClientDll.lib
}

