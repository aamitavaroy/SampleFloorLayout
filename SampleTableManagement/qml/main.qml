import QtQuick 2.5
import QtQuick.Window 2.2
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.4

Window {
    visible: true
    height: 370
    width: 390

    ColumnLayout{
        anchors.fill: parent
        Floor{
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
                    tabTypeRowId.enabled = true
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
                    tabTypeRowId.enabled = false
                }
            }


            Row{
                id: tabTypeRowId
                enabled: false
                spacing: 10
                Rectangle {
                    id: squreTabId
                    visible: true
                    height: 25
                    width: 25
                    color: "red"
                    border.color: "#0a2f4a"
                    border.width: 1
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            rectTabId.color= "#095e7b"
                            squreTabId.color = "red"
                            sCTabId.color = "#095e7b"
                            bCTabId.color = "#095e7b"
                            floorId.tableShapedSelect("Squre")
                        }
                    }
                }

                Rectangle {
                    id: rectTabId
                    visible: true

                    height: 25
                    width: 50
                    color: "#095e7b"
                    border.color: "#0a2f4a"
                    border.width: 1
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            rectTabId.color= "red"
                            squreTabId.color = "#095e7b"
                            sCTabId.color = "#095e7b"
                            bCTabId.color = "#095e7b"
                            floorId.tableShapedSelect("Rect")
                        }
                    }
                }

                Rectangle {
                    id: sCTabId
                    width: 25
                    height: 25
                    color: "#095e7b"
                    border.color: "#0a2f4a"
                    border.width: 1
                    radius: width*0.5
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            rectTabId.color= "#095e7b"
                            squreTabId.color = "#095e7b"
                            sCTabId.color = "red"
                            bCTabId.color = "#095e7b"
                            floorId.tableShapedSelect("SCircle")
                        }
                    }
                }

                Rectangle {
                    id: bCTabId
                    width: 40
                    height: 40
                    color: "#095e7b"
                    border.color: "#0a2f4a"
                    border.width: 1
                    radius: width*0.5
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            rectTabId.color= "#095e7b"
                            squreTabId.color = "#095e7b"
                            sCTabId.color = "#095e7b"
                            bCTabId.color = "red"
                            floorId.tableShapedSelect("BCircle")
                        }
                    }
                }
            }
        }
    }
}

