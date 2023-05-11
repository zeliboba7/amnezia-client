import QtQuick
import QtQuick.Controls

// TODO: определяь, где рисовать - сверху или снизу

Row {
    id: itemRoot

    property var textObj
    property bool isPasteRequested: false

    visible: false

    Button {
        id: cut
        text: qsTr("C&ut")
        enabled: textObj.selectedText

        onClicked: {
            console.log("***", "cut()")

            UiLogic.cutInvoked(textObj.text)
            textObj.clear()
        }
    }

    Button {
        id: copy
        text: qsTr("&Copy")
        enabled: textObj.selectedText

        onClicked: {
            console.log("***", "copy()")

            UiLogic.copyInvoked(textObj.text)
            hide()
        }
    }

    Button {
        id: paste
        text: qsTr("&Paste")

        onClicked: {
            console.log("***", "paste()")
            isPasteRequested = true
            UiLogic.pasteInvoked()
            hide()
        }
    }

    function show() {
        console.log("***", "show()")
        textObj.selectAll()

        itemRoot.visible = true
//        focus = true
    }

    function hide() {
        console.log("***", "hide()")
        itemRoot.visible = false
    }

    onFocusChanged: (isFocused) => {
        console.log("***", "menu focusChanged( ", isFocused, " )")

//        if (isPasteRequested) {
//            return
//        }

//        if (!isFocused) {
//            hide()
//        }
    }
}
