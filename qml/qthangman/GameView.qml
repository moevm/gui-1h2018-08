import QtQuick 2.2
import QtQuick.Controls 1.1

Item {
    id: gameView

    function allContained(owned, word)
    {
        for (var i=0; i<word.length; ++i) {
            if (owned.indexOf(word.charAt(i)) < 0)
                return false
        }
        return true
    }

<<<<<<< HEAD
=======
    // победы и поражения
>>>>>>> 1676b795e71e29a782c14b718575a402d34b2bf9
    property bool gameOver: applicationData.errorCount > 8
    property bool success: applicationData.word.length > 0 && !gameOver && allContained(applicationData.lettersOwned, applicationData.word)
    property alias globalButtonHeight: letterSelector.keyHeight

<<<<<<< HEAD
=======

>>>>>>> 1676b795e71e29a782c14b718575a402d34b2bf9
    onGameOverChanged: {
        if (gameOver)
            applicationData.gameOverReveal();
    }

    onSuccessChanged: {
        if (success === true)
            applicationData.wordsGuessedCorrectly += 1;
    }

    Connections {
        target: applicationData
        onWordChanged: {
            applicationData.wordsGiven += 1;
        }
    }

    SimpleButton {
        id: vowelsAvailableText
        height: globalButtonHeight
        width: parent.width * 0.25
        visible: !applicationData.vowelsUnlocked
        text: "Глассные: " + applicationData.vowelsAvailable
        anchors.left: parent.left
        anchors.verticalCenter: helpButton.verticalCenter
        anchors.margins: topLevel.globalMargin
    }

    ScoreItem {
        anchors.margins: topLevel.globalMargin
        anchors.right: helpButton.left
        anchors.verticalCenter: helpButton.verticalCenter
        height: globalButtonHeight
    }

    SimpleButton {
        id: helpButton
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.margins: topLevel.globalMargin
        height: globalButtonHeight
        width: globalButtonHeight
        text: "?"
        onClicked: {
            pageStack.push(Qt.resolvedUrl("HowToView.qml"))
        }
    }

    Item {
        anchors.top: helpButton.bottom
        anchors.bottom: word.top
        anchors.left: parent.left
        anchors.right: parent.right

        Hangman {
            game: gameView
            anchors.centerIn: parent
            width: Math.min(parent.width, parent.height) * 0.75
            height: width
        }
    }

<<<<<<< HEAD
=======

    // отображение слова
>>>>>>> 1676b795e71e29a782c14b718575a402d34b2bf9
    Word {
        id: word
        text: applicationData.word
        anchors.bottom: letterSelector.top
        anchors.bottomMargin: parent.height * 0.05
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width * 0.8
        height: parent.height * 0.1
    }

<<<<<<< HEAD
=======
    // клава
>>>>>>> 1676b795e71e29a782c14b718575a402d34b2bf9
    LetterSelector {
        id: letterSelector
        locked: gameOver || success
        hideVowels: applicationData.vowelsAvailable < 1 && !applicationData.vowelsUnlocked
        anchors.margins: topLevel.globalMargin
        anchors.bottom: guessButton.top
        anchors.left: parent.left
        anchors.right: parent.right
        height: parent.height * 0.23
        onLetterSelected: {
            if (applicationData.isVowel(letter) && !applicationData.vowelsUnlocked) {
                applicationData.vowelsAvailable -= 1;
            }
            applicationData.requestLetter(letter.charAt(0));
        }
    }

    SimpleButton {
        id: revealButton
        anchors.margins: topLevel.globalMargin
        visible: !(gameOver || success)
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        height: globalButtonHeight
        width : letterSelector.keyWidth * 3
        text: "Показать"
        onClicked: {
            applicationData.reveal();
        }
    }
    SimpleButton {
        id: guessButton
        anchors.margins: topLevel.globalMargin
        visible: !(gameOver || success)
        anchors.bottom: parent.bottom
        anchors.left: revealButton.right
        anchors.right: parent.right
        height: globalButtonHeight
        text: "Отгадать слово целиком"
        onClicked: {
            pageStack.push(Qt.resolvedUrl("GuessWordView.qml"));
        }
    }
    SimpleButton {
        id: resetButton
        anchors.margins: topLevel.globalMargin
        visible: gameOver || success
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        height: globalButtonHeight
        text: "Играть ещё раз?"
        onClicked: {
            letterSelector.reset();
            applicationData.reset();
        }
    }

<<<<<<< HEAD
=======

    // поражение
>>>>>>> 1676b795e71e29a782c14b718575a402d34b2bf9
    Text {
        id: gameOverText
        visible: gameOver
        anchors.fill: letterSelector
        text: "Игра закончена"
        fontSizeMode: Text.Fit
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        minimumPointSize: 8
        font.pointSize: 64
        color: "white"
        font.family: Settings.fontFamily
        font.weight: Font.Light
    }

<<<<<<< HEAD
=======
    // победа
>>>>>>> 1676b795e71e29a782c14b718575a402d34b2bf9
    Text {
        id: successText
        visible: success
        anchors.fill: letterSelector
        text: "Правильно!"
        fontSizeMode: Text.Fit
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        minimumPointSize: 8
        font.pointSize: 64
        color: "white"
        font.family: Settings.fontFamily
        font.weight: Font.Light
    }
}