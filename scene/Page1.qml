import QtQuick 2.0
import QtQuick.Controls 2.0
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.1

Item {

    /* Properties */
    property string cityName: "-------"
    property string countryName: "-------"
    property real cityTemperature: -99

    /* Content */
    Rectangle {
        anchors.fill: parent
        color: "#1a1d21"
    }

    /* Background */
    Image {
        x: 0; y: 0
        id: bg
        source: "qrc:/image/night.jpg"
        width: 200 //parent.width * 0.3
        height: parent.height
        fillMode: Image.PreserveAspectCrop
        visible: false

        Text {
            id: textCityName
            text: cityName + ", " + countryName
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.top: parent.top
            anchors.topMargin: 10
            color: "#ffffff"
            font.family: "AvantGarde LT ExtraLight"
            font.pointSize: 22
        }

        Text {
            text: cityTemperature + "°"
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.top: textCityName.bottom
            anchors.topMargin: 10
            font.family: "AvantGarde LT ExtraLight"
            font.pointSize: 24
            color: "#ffffff"
        }
    }

    DropShadow {
        anchors.fill: bg
        horizontalOffset: 0
        verticalOffset: 1
        radius: 8.0
        samples: 17
        //color: "#80000000"
        source: bg
    }

    /* Days */
    ListView {
        id: list
        anchors.left: bg.right
        anchors.leftMargin: 5
        anchors.right: parent.right
        anchors.rightMargin: 5
        orientation: Qt.Horizontal
        height: 64
        clip: true
        spacing: 5

        model: ListModel {
            ListElement { txt: "10.31" }
            ListElement { txt: "11.01" }
            ListElement { txt: "11.02" }
            ListElement { txt: "11.03" }
            ListElement { txt: "11.04" }
            ListElement { txt: "11.05" }
            ListElement { txt: "11.06" }
            ListElement { txt: "11.07" }
        }

        delegate: Text {
            id: textDelegate
            width: 64
            height: 64
            text: txt
            font.family: "BahamasLight"
            font.pointSize: 14
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            color: "white"
        }
    }

    /* Weather Information */
    GridView {
        //spacing: 5
        anchors.left: bg.right
        anchors.leftMargin: 5
        anchors.right: parent.right
        anchors.rightMargin: 5
        anchors.top: list.bottom
        anchors.topMargin: 5
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 5
        cellHeight: 132
        cellWidth: 132
        clip: true

        model:  ListModel {
            ListElement { clr: "red" }
            ListElement { clr: "green" }
            ListElement { clr: "orange" }
            ListElement { clr: "gray" }
            ListElement { clr: "steel blue" }
        }

        delegate: Rectangle {
            width: 128
            height: 128
            color: clr
        }

//        Rectangle {
//            color: "#302a33"
//            width: 128
//            height: 128

//            Text {
//                color: "#ffffff"
//                text: "24°"
//                font.pointSize: 36
//                font.family: "AvantGarde LT ExtraLight"
//            }

//            Text {
//                color: "#ffffff"
//                text: "Feels like"
//                font.pointSize: 18
//                font.family: "AvantGarde LT ExtraLight"
//                anchors.bottom: parent.bottom
//                anchors.bottomMargin: 5
//            }
//        }


    }
}























