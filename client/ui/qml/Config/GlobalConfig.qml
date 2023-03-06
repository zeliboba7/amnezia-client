pragma Singleton
import QtQuick

Item {
    readonly property string screenHome: "qrc:/ScreenHome.qml"
    readonly property string screenHomeIntroGifEx1: "qrc:/ScreenHomeIntroGifEx1.qml"

    readonly property int screenWidth: 380
    readonly property int screenHeight: 680

    readonly property int defaultMargin: 20

    function isIOs() {
        if (Qt.platform.os == "ios") {
            return true
        }
        return false
    }

    function isAndroid() {
        if (Qt.platform.os == "android") {
            return true
        }
        return false
    }

    function isMobile() {
        if (isAndroid() || isIOs()) {
            return true
        }
        return false
    }

    function isDesktop() {
        if (Qt.platform.os == "windows" ||
                Qt.platform.os == "linux" ||
                Qt.platform.os == "osx") {
            return true
        }
        return false
    }
}
