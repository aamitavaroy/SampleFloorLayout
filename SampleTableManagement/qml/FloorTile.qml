import QtQuick 2.0

Rectangle {
    id: tileId
    property double tileHeight: 64
    property double tileWidth: 64
    property bool isSelected: false
    property bool isSaved: false

    onIsSavedChanged: {
        console.log("onIsSavedChanged" + isSaved)
        if(isSaved)
        {
            mouseArea.enabled = false
        } else {
            mouseArea.enabled = true
        }
    }

    onIsSelectedChanged: {
        console.log("onIsSelectedChanged" + isSelected)
        if(isSelected)
        {
            tileId.color = "red"
        } else {
            tileId.color = "white"
        }
    }

    height: tileHeight
    width: tileWidth
    color: selected ? selectedColor : deSelectedColor

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked:
        {
            if(enable)
            {

                if(selected){

                    tileClicked(position,false)
                    tileId.color = deSelectedColor
                }
                else {

                    tileClicked(position,true)
                    tileId.color = selectedColor
                }
            }
        }
    }

    //    onStateChanged: {
    ////        console.log("onclickedstatechanged" + tileId.state)
    ////        if (state!=='saveMode')
    ////            mouseArea.enabled = true
    //    }

    //    states: [
    //        State {
    //            name: "selected"
    //            //PropertyChanges { target: tileId; color: "red" }
    //        },
    //        State {
    //            name: "notSelected"
    //            //PropertyChanges { target: tileId; color: "white" }
    //        },
    //        State {
    //            name: "saveMode"
    //            //PropertyChanges { target: mouseArea; enabled: false }
    //        },
    //        State {
    //            name: "editMode"
    //            //PropertyChanges { target: mouseArea; enabled: true }
    //        }

    //    ]
}

