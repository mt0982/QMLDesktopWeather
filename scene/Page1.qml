import QtQuick 2.0
import QtQuick.Controls 2.0
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.1

Item {

    /* Properties */
    property string cityName: "-------"
    property string countryName: "-------"
    property real cityTemperature: -99
    //property real weathericon: "http://openweathermap.org/img/w/" + weathericon + ".png"

    function clearList() { listModel.clear() }
    function setTemperature(temp, desc) { listModel.append({"value":temp + "°C", "desc":desc}) }
    function setHumidity(humidity, desc) { listModel.append({"value":humidity + "%", "desc":desc}) }
    function setCloudiness(cloud, desc) { listModel.append({"value":cloud + "%", "desc":desc}) }
    //function setLatLot(lat, lot, desc) { listModel.append({"value":temp, "desc":desc}) }
    function setWind(wind, desc) { listModel.append({"value":wind + "KM/H", "desc":desc}) }
    function setPressure(pressure, desc) { listModel.append({"value":pressure + "HPA", "desc":desc}) }
    function setSeaLevel(level, desc) { listModel.append({"value":level + "HPA", "desc":desc}) }
    function setGndLevel(level, desc) { listModel.append({"value":level + "HPA", "desc":desc}) }
    function setwindDeg(deg, desc) { listModel.append({"value":deg + "°", "desc":desc}) }
    function setSunrise(time, desc) { listModel.append({"value":time, "desc":desc}) }
    function setSunset(time, desc) { listModel.append({"value":time, "desc":desc}) }

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
        id: gridView
        anchors.left: bg.right
        anchors.leftMargin: 18
        anchors.right: parent.right
        anchors.rightMargin: 5
        anchors.top: list.bottom
        anchors.topMargin: 5
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 5
        cellHeight: 135
        cellWidth: 135
        clip: true
        visible: false

        model: ListModel {
            id: listModel
        }

        delegate: Rectangle {
            width: 128
            height: 128
            color: "#1a1d21"

            Text {
                id: textDesc
                color: "#ffffff"
                text: desc
                font.pointSize: 18
                font.family: "AvantGarde LT ExtraLight"
                anchors.left: parent.left
                anchors.leftMargin: 5
            }

            Text {
                color: "#ffffff"
                text: value
                font.pointSize: 16
                font.family: "AvantGarde LT ExtraLight"
                anchors.top: textDesc.bottom
                anchors.left: parent.left
                anchors.leftMargin: 5
            }
        }
    }

    DropShadow{
        anchors.fill: gridView
        radius: 8.0
        samples: 17
        color: "#80000000"
        source: gridView
    }
}























