import QtQuick 2.0

Rectangle {
    id: tileId
    property double tileHeight: 64
    property double tileWidth: 64

    height: tileHeight
    width: tileWidth
    color: selected ? selectedColor : deSelectedColor

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked:
        {
            if( enable ) {
                if( selected ) {
                    tileClicked( position, false )
                    tileId.color = deSelectedColor
                } else {
                    tileClicked( position, true )
                    tileId.color = selectedColor
                }
            }
        }
    }
}

