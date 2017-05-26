import QtQuick 2.5
import QtQuick.Window 2.2
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.4
import "../qml" as FloorTile

Window {
    visible: true
    height: 370
    width: 390

    ColumnLayout{
        anchors.fill: parent
        FloorTile.Floor{
            id: floorId
        }
        Row{
            Button{
                text: "Save"
                height: 50
                width: 100
                onClicked:
                {
                    floorId.cellH = 64
                    floorId.cellW = 64
                    floorId.saveClicked()
                }
            }
            Button{
                text: "Edit"
                height: 50
                width: 100
                onClicked:
                {
                    floorId.cellH = 65
                    floorId.cellW = 65
                    floorId.editClicked()
                }
            }
        }
    }
}

