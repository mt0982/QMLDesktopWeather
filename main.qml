import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Controls 2.0
import QtGraphicalEffects 1.0
import "scene" as Scene
import "script/weather.js" as Weather

//https://s-media-cache-ak0.pinimg.com/736x/b2/4a/31/b24a31d0412d61712d1fb42ee845c0ea.jpg
//https://s-media-cache-ak0.pinimg.com/736x/6b/8f/72/6b8f7207a586f3c36f9aaf33044469d3.jpg
//#1a1d21

ApplicationWindow {
    id: root
    visible: true
    width: 640
    height: 480
    title: qsTr("Desktop Weather")

    Component.onCompleted: {
        Weather.setCityName("Lublin")
        Weather.parseJSON()
        Weather.parseJSON16Days();
    }

    Scene.Page1 {
        id: page1
        anchors.fill: parent
    }
}










































