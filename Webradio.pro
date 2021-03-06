# Add more folders to ship with the application, here
folder_01.source = qml/Webradio
folder_01.target = qml
DEPLOYMENTFOLDERS = folder_01

# Additional import path used to resolve QML modules in Creator's code model
QML_IMPORT_PATH =

# UID for development
#symbian:TARGET.UID3 = 0xE10C46F3
# UID for Nokia Store
symbian {
qt_components.pkg_prerules += (0x200346DE), 1, 1, 0, {\Qt Components\} DEPLOYMENT += qt_components\
vendorinfo = "%{\"Yaroslavl FRUCT Lab\"}" \
             ":\"Yaroslavl FRUCT Lab\""
my_deployment.pkg_prerules += vendorinfo
DEPLOYMENT += my_deployment
DEPLOYMENT.display_name = WebRadio
TARGET.UID3 = 0x2006290c
}

# Smart Installer package's UID
# This UID is from the protected range and therefore the package will
# fail to install if self-signed. By default qmake uses the unprotected
# range value if unprotected UID is defined for the application and
# 0x2002CCCF value if protected UID is given to the application
#symbian:DEPLOYMENT.installer_header = 0x2002CCCF

# Allow network access on Symbian
symbian:TARGET.CAPABILITY += NetworkServices

symbian: {
INCLUDEPATH += MW_LAYER_SYSTEMINCLUDE # Not sure if this is needed...
    LIBS += -L\epoc32\release\armv5\lib -lremconcoreapi
    LIBS += -L\epoc32\release\armv5\lib -lremconinterfacebase
}

# If your application uses the Qt Mobility libraries, uncomment the following
# lines and add the respective components to the MOBILITY variable.
CONFIG += mobility
MOBILITY += multimedia

# Add dependency to symbian components
CONFIG += qtquickcomponents
CONFIG += qt-components

# The .cpp file which was generated for your project. Feel free to hack it.
SOURCES += main.cpp \
    webradioplayer.cpp \
    favorites.cpp \
    mediakeycaptureitem.cpp

# Please do not modify the following two lines. Required for deployment.
include(qmlapplicationviewer/qmlapplicationviewer.pri)
qtcAddDeployment()

OTHER_FILES += \
    qml/Webradio/RadioList.qml \
    qml/Webradio/RadioPlayer.qml \
    qml/Webradio/Tabs.qml \
    qml/Webradio/StationListView.qml \
    qml/Webradio/RadioListView.qml \
    qml/Webradio/RectList.qml \
    qml/Webradio/FavoriteList.qml \
    qml/Webradio/RecentList.qml \
    qml/Webradio/MuteButton.qml \
    qml/Webradio/PlayButton.qml \
    qml/Webradio/LikeButton.qml \
    qml/Webradio/MainToolbar.qml \
    qml/Webradio/MainMenu.qml \
    qml/Webradio/AboutDialog.qml \
    qml/Webradio/ExitDialog.qml \
    qml/Webradio/VolumeSlideIndicator.qml

HEADERS += \
    webradioplayer.h \
    favorites.h \
    mediakeycaptureitem.h

RESOURCES += \
    resources.qrc

ICON = Webradio.svg
