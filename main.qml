import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")
    Rectangle {
        width: 662
        height: 457



        Canvas {
            id: myCanvas
            property int xpos :0
            property int ypos :0
            property int lastposx: 0
            property int lastposy: 0

            function clear() {
                var ctx = getContext("2d")
                myCanvas.requestPaint()
                ctx.reset()
                //mouse.clear()
            }
            //anchors.bottomMargin: -9
            anchors.fill: parent

            onPaint: {
                myCanvas.clear()
                var ctx = getContext("2d")
                ctx.lineWidth = 4
                ctx.strokeStyle = "blue"
                ctx.beginPath()
                ctx.moveTo(xpos,ypos)
                ctx.lineTo(lastposx,ypos)
                ctx.lineTo(lastposx,lastposy)
                ctx.lineTo(xpos,lastposy)
                ctx.closePath()

                //ctx.fillStyle = Qt.rgba(1, 0, 0, 1);
                //ctx.fillRect(0, 0, xpos, ypos)
                ctx.stroke()
                //ctx.ellipse(0,0,xpos,ypos)

            }

            MouseArea{
                id: area
                z: 1
                anchors.fill: parent
                onPressed: {
                    myCanvas.xpos = mouseX
                    myCanvas.ypos = mouseY
                    myCanvas.requestPaint()

                }
                onMouseXChanged: {
                    myCanvas.lastposx = mouseX
                    myCanvas.lastposy = mouseY
                    myCanvas.requestPaint()
                }
                onMouseYChanged: {
                    myCanvas.lastposx = mouseX
                    myCanvas.lastposy = mouseY
                    myCanvas.requestPaint()
                }
            }

            Image {
                id: image
                anchors.fill: parent
                z: -1
                fillMode: Image.PreserveAspectFit
                source: "../../Desktop/download.jpg"
            }

        }


    }
}

/*##^##
Designer {
    D{i:4;anchors_height:298;anchors_width:560;anchors_x:16;anchors_y:19}
}
##^##*/
