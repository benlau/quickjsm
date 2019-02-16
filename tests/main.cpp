#include <QString>
#include <QtTest>
#include <QtQuickTest/quicktest.h>

namespace AutoTestRegister {
QUICK_TEST_MAIN(QuickTests)
}

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    qDebug() << TEST_SOURCE_DIR;
    return quick_test_main(argc, argv, "QuickTests", TEST_SOURCE_DIR);
}
