import QtQuick 2.0

Text {
    font.bold: true
    font.family: "Cholla"

    color: "white"

    property bool smallLetterSpacing: false

    font.letterSpacing: smallLetterSpacing ? -2 : 0
}
