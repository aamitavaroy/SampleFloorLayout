import QtQuick 2.0

Rectangle {
    id: tileId
    property double tileHeight: 64
    property double tileWidth: 64

    height: tileHeight
    width: tileWidth
    color: "transparent"

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked:
        {
            if( selected ) {
                if( isAnyTable ) {
                    tableClicked( position, false , "Rect")
                    tabId.visible = false
                } else {
                    tableClicked( position, true , "Rect")
                    tabId.visible = true
                }
            }
        }
    }

    Rectangle{
        id: tabId
        visible: isAnyTable?true:false
        anchors.centerIn: parent
        height: 25
        width: 50
        color: "cyan"
        onVisibleChanged: {
            visible = isAnyTable?true:false
        }
    }
}
