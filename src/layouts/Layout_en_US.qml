import QtQuick 2.12
import "."

/**
 * This is quick and dirty model for the keys of the InputPanel *
 * The code has been derived from
 * http://tolszak-dev.blogspot.de/2013/04/qplatforminputcontext-and-virtual.html
 * Copyright 2015 Uwe Kindler
 * Licensed under MIT see LICENSE.MIT in project root
 */
Item {
    property var rows: rowsModel

    function selectDefaultKeySet()
    {
        selectKeySet("alphanumeric");
    }

    function selectKeySet(value)
    {
        rows.clear();
        switch(value)
        {
            case "alphanumeric":
                rows.append(alphaNumericRow1);
                rows.append(alphaNumericRow2);
                rows.append(alphaNumericRow3);
                rows.append(alphaNumericRow4);
                rows.append(alphaNumericRow5);
                break;
            case "symbol":
                rows.append(symbolRow1);
                rows.append(symbolRow2);
                rows.append(symbolRow3);
                rows.append(symbolRow4);
                break;
            case "numeric":
                rows.append(numericRow1);
                rows.append(numericRow2);
                rows.append(numericRow3);
                rows.append(numericRow4);
                break;
            default:
                console.log("Unknown key set: " + value);
                break;
        }
    }

    function selectKeySetByImh(value)
    {
        var numericFlags = Qt.ImhPreferNumbers + Qt.ImhDigitsOnly + Qt.ImhFormattedNumbersOnly + Qt.ImhDialableCharactersOnly;

        if((value & numericFlags) > 0)
        {
            selectKeySet("numeric")
        }
        else
        {
            selectKeySet("alphanumeric");
        }
    }

    ListModel
    {
        id: rowsModel
    }

    // Alphanumeric key set
    ListElement
    {
        id: alphaNumericRow1
        property var keys:
            ListModel {
                ListElement { key: "fillWidth"; }
                ListElement { key: "1"; keycode: Qt.Key_1 }
                ListElement { key: "2"; keycode: Qt.Key_2 }
                ListElement { key: "3"; keycode: Qt.Key_3 }
                ListElement { key: "4"; keycode: Qt.Key_4 }
                ListElement { key: "5"; keycode: Qt.Key_5 }
                ListElement { key: "6"; keycode: Qt.Key_6 }
                ListElement { key: "7"; keycode: Qt.Key_7 }
                ListElement { key: "8"; keycode: Qt.Key_8 }
                ListElement { key: "9"; keycode: Qt.Key_9 }
                ListElement { key: "0"; keycode: Qt.Key_0 }
                ListElement { key: "fillWidth"; }
            }
    }
    ListElement
    {
        id: alphaNumericRow2
        property var keys:
            ListModel {
                ListElement { key: "fillWidth"; }
                ListElement { key: "q"; keycode: Qt.Key_Q}
                ListElement { key: "w"; keycode: Qt.Key_W}
                ListElement { key: "e"; keycode: Qt.Key_E}
                ListElement { key: "r"; keycode: Qt.Key_R}
                ListElement { key: "t"; keycode: Qt.Key_T}
                ListElement { key: "y"; keycode: Qt.Key_Y}
                ListElement { key: "u"; keycode: Qt.Key_U}
                ListElement { key: "i"; keycode: Qt.Key_I}
                ListElement { key: "o"; keycode: Qt.Key_O}
                ListElement { key: "p"; keycode: Qt.Key_P}
                ListElement { key: "fillWidth"; }
            }
    }
    ListElement
    {
        id: alphaNumericRow3
        property var keys:
        ListModel {
            ListElement { key: "fillWidth"; }
            ListElement { key: "a"; keycode: Qt.Key_A}
            ListElement { key: "s"; keycode: Qt.Key_S}
            ListElement { key: "d"; keycode: Qt.Key_D}
            ListElement { key: "f"; keycode: Qt.Key_F}
            ListElement { key: "g"; keycode: Qt.Key_G}
            ListElement { key: "h"; keycode: Qt.Key_H}
            ListElement { key: "j"; keycode: Qt.Key_J}
            ListElement { key: "k"; keycode: Qt.Key_K}
            ListElement { key: "l"; keycode: Qt.Key_L}
            ListElement { key: "fillWidth"; }
        }
    }
    ListElement
    {
        id: alphaNumericRow4
        property var keys:
        ListModel {
            ListElement { key: "shiftKey"; }
            ListElement { key: "fillWidth"; }
            ListElement { key: "z"; keycode: Qt.Key_Z}
            ListElement { key: "x"; keycode: Qt.Key_X}
            ListElement { key: "c"; keycode: Qt.Key_C}
            ListElement { key: "v"; keycode: Qt.Key_V}
            ListElement { key: "b"; keycode: Qt.Key_B}
            ListElement { key: "n"; keycode: Qt.Key_N}
            ListElement { key: "m"; keycode: Qt.Key_M}
            ListElement { key: "fillWidth"; }
            ListElement { key: "backspaceKey"; }
        }
    }
    ListElement
    {
        id: alphaNumericRow5
        property var keys:
        ListModel {
            ListElement { key: "hideKey"; }
            ListElement { key: "modeSwitchKey"; displayText: "123"; modeSwitchTarget: "numeric" }
            ListElement { key: "fillWidth"; }
            ListElement { key: ","; keycode: Qt.Key_Comma}
            ListElement { key: "spaceKey"; keycode: Qt.Key_Space}
            ListElement { key: "."; keycode: Qt.Key_Period}
            ListElement { key: "modeSwitchKey"; displayText: "#?/"; modeSwitchTarget: "symbol" }
            ListElement { key: "enterKey"; }
        }
    }


    // Symbol key set
    ListElement
    {
        id: symbolRow1
        property var keys:
            ListModel {
                ListElement { key: "fillWidth"; }
                ListElement { key: "1"; keycode: Qt.Key_1}
                ListElement { key: "2"; keycode: Qt.Key_2}
                ListElement { key: "3"; keycode: Qt.Key_3}
                ListElement { key: "4"; keycode: Qt.Key_4}
                ListElement { key: "5"; keycode: Qt.Key_5}
                ListElement { key: "6"; keycode: Qt.Key_6}
                ListElement { key: "7"; keycode: Qt.Key_7}
                ListElement { key: "8"; keycode: Qt.Key_8}
                ListElement { key: "9"; keycode: Qt.Key_9}
                ListElement { key: "0"; keycode: Qt.Key_0}
                ListElement { key: "fillWidth"; }
            }
    }
    ListElement
    {
        id: symbolRow2
        property var keys:
        ListModel {
            ListElement { key: "fillWidth"; }
            ListElement { key: "!"; keycode: Qt.Key_Exclam }
            ListElement { key: "@"; keycode: Qt.Key_At }
            ListElement { key: "#"; keycode: Qt.Key_NumberSign }
            ListElement { key: "$"; keycode: Qt.Key_Dollar }
            ListElement { key: "%"; keycode: Qt.Key_Percent }
            ListElement { key: "&"; keycode: Qt.Key_Ampersand }
            ListElement { key: "*"; keycode: Qt.Key_Asterisk }
            ListElement { key: "?"; keycode: Qt.Key_Question }
            ListElement { key: "/"; keycode: Qt.Key_Slash }
            ListElement { key: "fillWidth"; }
        }
    }
    ListElement
    {
        id: symbolRow3
        property var keys:
        ListModel {
            ListElement { key: "spacer"; widthFactor: 1.25 }
            ListElement { key: "fillWidth"; }
            ListElement { key: "_"; keycode: Qt.Key_Underscore }
            ListElement { key: "\""; keycode: Qt.Key_Backslash }
            ListElement { key: "'"; keycode: Qt.Key_Agrave  }
            ListElement { key: "("; keycode: Qt.Key_BracketLeft }
            ListElement { key: ")"; keycode: Qt.Key_BracketRight }
            ListElement { key: "-"; keycode: Qt.Key_Minus }
            ListElement { key: "+"; keycode: Qt.Key_Plus }
            ListElement { key: "fillWidth"; }
            ListElement { key: "backspaceKey"; }
        }
    }
    ListElement
    {
        id: symbolRow4
        property var keys:
        ListModel {
            ListElement { key: "hideKey"; }
            ListElement { key: "modeSwitchKey"; displayText: "123"; modeSwitchTarget: "numeric" }
            ListElement { key: "fillWidth"; }
            ListElement { key: ","; keycode: Qt.Key_Comma}
            ListElement { key: "spaceKey"; keycode: Qt.Key_Space}
            ListElement { key: "."; keycode: Qt.Key_Period}
            ListElement { key: "modeSwitchKey"; displayText: "ABC"; modeSwitchTarget: "alphanumeric" }
            ListElement { key: "enterKey"; }
        }
    }


    // Numeric key set
    ListElement
    {
        id: numericRow1
        property var keys:
            ListModel {
                ListElement { key: "spacer"; widthFactor: 2.60 }
                ListElement { key: "1"; widthFactor: 2; keycode: Qt.Key_1 }
                ListElement { key: "2"; widthFactor: 2; keycode: Qt.Key_2 }
                ListElement { key: "3"; widthFactor: 2; keycode: Qt.Key_3 }
                ListElement { key: "fillWidth"; }
            }
    }
    ListElement
    {
        id: numericRow2
        property var keys:
        ListModel {
            ListElement { key: "spacer"; widthFactor: 2.60 }
            ListElement { key: "4"; widthFactor: 2; keycode: Qt.Key_4 }
            ListElement { key: "5"; widthFactor: 2; keycode: Qt.Key_5 }
            ListElement { key: "6"; widthFactor: 2; keycode: Qt.Key_6 }
            ListElement { key: "fillWidth"; }
        }
    }
    ListElement
    {
        id: numericRow3
        property var keys:
        ListModel {
            ListElement { key: "spacer"; widthFactor: 2.60 }
            ListElement { key: "7"; widthFactor: 2; keycode: Qt.Key_7 }
            ListElement { key: "8"; widthFactor: 2; keycode: Qt.Key_8 }
            ListElement { key: "9"; widthFactor: 2; keycode: Qt.Key_9 }
            ListElement { key: "fillWidth"; }
            ListElement { key: "backspaceKey"; }
        }
    }
    ListElement
    {
        id: numericRow4
        property var keys:
        ListModel {
            ListElement { key: "hideKey"; }
            ListElement { key: "modeSwitchKey"; displayText: "ABC"; modeSwitchTarget: "alphanumeric" }
            ListElement { key: "0"; widthFactor: 2; keycode: Qt.Key_0 }
            ListElement { key: ","; widthFactor: 2; keycode: Qt.Key_Comma}
            ListElement { key: "."; widthFactor: 2; keycode: Qt.Key_Period}
            ListElement { key: "fillWidth"; }
            ListElement { key: "spacer"; widthFactor: 0.5 }
            ListElement { key: "enterKey"; }
        }
    }

}
