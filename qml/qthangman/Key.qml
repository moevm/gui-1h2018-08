import QtQuick 2.2

// дефолтная кнопка

SimpleButton {
    id: keyItem

    property bool purchasable: false

    signal keyActivated(string letter)

    onClicked: {
        if (available) {
            keyActivated(text);
        }
    }

}
