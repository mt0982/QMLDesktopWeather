import QtQuick 2.0
import QtQuick.Controls 2.0
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.1
import "../script/weather.js" as Weather

Item {

    /* Properties */
    property string cityName: "-------"
    property string countryName: "-------"
    property real cityTemperature: -99
    property string cityDescription: "-------"
    property url cityWeatherIcon: " "
    property string weatherUpdateTime: " "

    function clearDayList() { listDay.clear() }
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
    function addDay(day) { listDay.append({"txt":day}) }

    /* Search Field */
    Popup {
        id: popup
        transformOrigin: Popup.Center
        width: 250
        height: 150
        modal: true
        focus: true
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside

        ColumnLayout {
            TextField { id: searchField; placeholderText: qsTr("City name") }
            Button {
                implicitWidth: parent.width;
                text: qsTr("Find")
                onClicked: {
                    Weather.setCityName(searchField.text)
                    Weather.parseJSON()
                    popup.close()
                }
            }
        }
    }

    /* Content */
    Rectangle {
        anchors.fill: parent
        color: "#1a1d21"
    }

    /* Background */
    Image {
        id: bg
        source: "https://s-media-cache-ak0.pinimg.com/originals/a4/0e/a8/a40ea8733910d1e6ff39355712a1ed94.jpg"
        width: 200 //parent.width * 0.3
        height: parent.height
        fillMode: Image.PreserveAspectCrop
        visible: false

        /* Logo */
        Image {
            id: weatherLogo
            source: cityWeatherIcon
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            anchors.left: parent.left
            anchors.leftMargin: 10
            visible: false
        }

        DropShadow {
            anchors.fill: weatherLogo
            horizontalOffset: 3
            verticalOffset: 3
            radius: 8.0
            samples: 17
            color: "#80000000"
            source: weatherLogo
        }

        /* Title */
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
            id: textCityTemperature
            text: cityTemperature + "°"
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.top: textCityName.bottom
            anchors.topMargin: 10
            font.family: "AvantGarde LT ExtraLight"
            font.pointSize: 24
            color: "#ffffff"
        }

        Text {
            text: cityDescription
            anchors.left: weatherLogo.right
            anchors.leftMargin: 10
            anchors.verticalCenter: weatherLogo.verticalCenter
            font.family: "AvantGarde LT ExtraLight"
            font.pointSize: 12
            color: "#ffffff"
            font.capitalization: Font.Capitalize
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

        model: ListModel { id: listDay }

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

        model: ListModel {
            id: listModel
        }

        delegate: Rectangle {
            width: 128
            height: 128
            color: Qt.rgba(Math.random() * 0.7, Math.random() * 0.7, Math.random() * 0.7, 1.0)//"#1a1d21"

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
                anchors.bottomMargin: 5
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

    /* Search */
    ToolButton {
        width: 40
        height: 40
        anchors.right: bg.right
        anchors.rightMargin: 5
        y: 8
        z: 2

        onClicked: {
            popup.x = (parent.width - popup.width) / 2
            popup.y = (parent.height - popup.height) / 2
            popup.open()
        }

        Image {
            source: "qrc:/image/search.png"
            anchors.fill: parent
        }
    }

    /* Update Time */
    Text {
        anchors.right: parent.right
        anchors.rightMargin: 15
        y: parent.height - 25
        text: " Update time: " + weatherUpdateTime
        font.family: "AvantGarde LT ExtraLight"
        font.pointSize: 12
        color: "#ffffff"
    }
}























