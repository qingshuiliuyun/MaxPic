import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Controls 2.2

Window {
    id:root
    visible: true
    width: 640
    height: 480
    title: qsTr("MaxPic_20180505")




    MouseArea {
        id:dragArea
        anchors.fill: parent
        onClicked: {
            //console.log(qsTr('Clicked on background. Text: "' + textEdit.text + '"'))
            console.debug(mouseX,mouseY);
        }
    }


    Rectangle {
        id:attitude
        x: 0
        y: 0
        width: 300
        height: parent.height
        color: "yellow"
        opacity: 0.7


        clip: true


       Rectangle {
           id:attitude1
           x: 10
           y: 10
           width: parent.width -20
           height: parent.width -20
           color: "blue"
           opacity: 0.7
       }



    }


    Rectangle {

        id: myPushButtom
        x: 310
        y: 186

        clip: true

        radius: 25
        scale: 1
        border.color: "#20f2bf"

       width: 50
       height: 50
       color: "#69a6f2"
       border.width: 3
       opacity: 1

       Menu {
           id: menu
           MenuItem {
               text: "退出程序"
               onTriggered: Qt.quit()
           }
           MenuItem {
               text:"select"
               onTriggered: Qt.quit()
           }
           MenuItem {
               text:"select1"
               onTriggered: Qt.quit()
           }
       }

       MouseArea {
           id: mouseBunttom
           anchors.fill: parent
           hoverEnabled: true

           drag.target: myPushButtom
           drag.minimumX: 0
           drag.maximumX: root.width - myPushButtom.width
           drag.minimumY: 0
           drag.maximumY: root.height - myPushButtom.height

           onClicked: {
               menu.open()

           }

           onPressed: {
               myPushButtom.color = "red"

               myPushButtom.border.color = "brack"
           }



           onReleased: {
               myPushButtom.color = "green"
               myPushButtom.border.color = "gray"

           }

           onEntered: {
               nametext.color = "blue"

               myPushButtom.border.color = "blue"
               if(myPushButtom.y < 0)
               {
                       myPushButtom.y = 0
               }

               if(myPushButtom.x < 0)
               {
                  myPushButtom.x = 0;
               }
               else if(myPushButtom.x > (root.width - myPushButtom.width))
               {
                  myPushButtom.x = root.width - myPushButtom.width;
               }

           }

           onExited: {
               nametext.color = "yellow"

               myPushButtom.border.color = "gray"

               if(myPushButtom.y <= 0)
               {
                       myPushButtom.y = -40;
               }

               if(myPushButtom.x <= 0)
               {
                  myPushButtom.x = -40;
               }
               else if(myPushButtom.x >= (root.width - myPushButtom.width))
               {
                   myPushButtom.x = root.width - 10;
               }
           }

       }

       Text {
           id: nametext
           text: "按键"
           color: "steelblue"
           anchors.fill: parent
           anchors.margins: 6
           fontSizeMode: Text.Fit

           verticalAlignment: Text.AlignVCenter
           horizontalAlignment: Text.AlignHCenter


       }


    }

}
