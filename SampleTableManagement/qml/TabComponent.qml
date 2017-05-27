import QtQuick 2.0

Item {
    id: tabDelegateId

    Loader {
        id: tableTypeLoaderId

        source: if(tableType==="Rect") {
                    return "TableRect.qml"
                } else if (tableType==="SCircle") {
                    return "TableSCircle.qml"
                } else if (tableType==="BCircle") {
                    return "TableBCircle.qml"
                } else {
                    return "TableSqure.qml"
                }
    }
}
