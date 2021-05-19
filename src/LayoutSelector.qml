import QtQuick 2.0
import "layouts"

Item
{
    property var currentLayout

    Component.onCompleted:
    {
        switchLayout(Qt.locale().name);
    }

    function switchLayout(localeString)
    {
        switch(localeString)
        {
            case "en_US":
                currentLayout = en_US;
                break;
            default:
                console.log("Unknown keyboard locale: " + localeString + ". Defaulting to en_US.");
                currentLayout = en_US;
                break;
        }

        currentLayout.selectDefaultKeySet();
    }

    function switchKeySet(value)
    {
        currentLayout.selectKeySet(value);
    }

    function switchKeySetByImh(value)
    {
        currentLayout.selectKeySetByImh(value);
    }

    Layout_en_US
    {
        id: en_US
    }
}
