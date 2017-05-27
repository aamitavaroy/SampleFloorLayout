import QtQuick 2.0

Rectangle {
    id: root
    property double cellW: 65
    property double cellH: 65
    property int tableType: 2
    property string tableTypes

    width: 390
    height: 320
    color: "black"

    signal saveClicked()
    signal editClicked()
    signal tileClicked(var currPos, var state)
    signal tableClicked(var currPos, var isTable, var tableType)
    signal tableShapedSelect(var shape)


    onSaveClicked: {
        for (var i = 0; i < 30; i++)
        {
            floorModel.setProperty(i,"enable",false)

            if(floorModel.get(i).selected === false)
            {
                if(floorModel.get(i).isAnyTable===true)
                {
                    floorModel.setProperty(i,"isAnyTable",false)
                }
            }
        }
        tableGrid.visible = true
    }

    onEditClicked: {
        for (var i = 0; i < 30; i++)
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
        floorModel.setProperty(currPos,"tableType",tableTypes)
    }

    onTableShapedSelect: {
        tableTypes = shape
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

        delegate: FloorTile { }
    }

    GridView {
        id: tableGrid
        anchors.fill: parent
        width: 64*5
        height: 64*5
        opacity: 0.4
        z:1
        visible: false
        cellWidth: 64
        cellHeight: 64

        model: floorModel

        delegate: TabComponent {}
    }

    ListModel {
        id: floorModel

        Component.onCompleted: {
            for (var i = 0; i < 30; i++) {
                append( createListElement( i ) );
            }
        }

        function createListElement(count) {
            return  {
                position: count ,
                selectedColor: "red",
                deSelectedColor: "white",
                enable: true,
                selected: false,
                isAnyTable: false,
                tableType: "SCircle"
            }
        }
    }
}
