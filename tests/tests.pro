QT       += testlib qml qmltest quick

TARGET = tests
CONFIG   += console
CONFIG   -= app_bundle
CONFIG += qmltestcase

TEMPLATE = app

SOURCES +=     main.cpp     

DEFINES += SRCDIR=\\\"$$PWD/\\\"
DEFINES += TEST_SOURCE_DIR=\\\"$$PWD/qmltests\\\"
DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000

ROOT_DIR = $$absolute_path($$PWD/..)
INCLUDEPATH += $$ROOT_DIR/src/cpp
include(../src/qml/qml.pri)

DISTFILES +=     qpm.json     \
    ../.travis.yml \
    ../README.md \
    ../appveyor.yml \
    qpm.pri \
    qmltests/tst_StateMachine.qml

!win32 {
    QMAKE_CXXFLAGS += -Werror
}

HEADERS +=
