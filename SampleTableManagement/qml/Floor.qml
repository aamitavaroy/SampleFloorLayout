import QtQuick 2.0

Rectangle {
    id: root
    property double cellW: 65
    property double cellH: 65

    width: 390
    height: 320
    color: "black"
    signal saveClicked()
    signal editClicked()
    signal tileClicked(var currPos, var state)
    signal tableClicked(var currPos, var isTable)
    onSaveClicked: {
        for (var i = 0; i < 24; i++)
        {
            floorModel.setProperty(i,"enable",false)
        }
        tableGrid.visible = true
    }

    onEditClicked: {
        for (var i = 0; i < 24; i++)
        {
            floorModel.setProperty(i,"enable",true)
        }
        tableGrid.visible = false
    }

    onTileClicked: {
        floorModel.setProperty(currPos,"selected",state)
    }

    onTableClicked: {
        floorModel.setProperty(currPos,"isAnyTable",isTable)
    }

    GridView {
        id: redDestination
        anchors.fill:parent
        width: 64*5
        height: 64*5
        opacity: 0.5

        cellWidth: cellW
        cellHeight: cellH
        model: floorModel

        delegate: FloorTile {
            isSaved:isSaved
        }
        ListModel {
            id: floorModel

            Component.onCompleted: {
                for (var i = 0; i < 24; i++) {
                    append(createListElement(i));
                }
            }

            function createListElement(count) {
                return  {
                    position: count ,
                    selectedColor: "red",
                    deSelectedColor: "white",
                    enable: true,
                    selected: false,
                    isAnyTable: false
                }
            }
        }
    }

    GridView {
        id: tableGrid
        anchors.fill: parent
        z:1
        visible: false
        opacity: 0.4
        width: 64*5
        height: 64*5

        cellWidth: 64
        cellHeight: 64
        model: floorModel
        delegate: Table {}
    }
}
