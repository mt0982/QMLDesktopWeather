import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0
import QtQuick.Controls.Material 2.0
import "scene" as Scene
import "script/weather.js" as Weather

//https://s-media-cache-ak0.pinimg.com/736x/b2/4a/31/b24a31d0412d61712d1fb42ee845c0ea.jpg
//https://s-media-cache-ak0.pinimg.com/736x/6b/8f/72/6b8f7207a586f3c36f9aaf33044469d3.jpg
//#1a1d21
//fcb100 - yellow
//439c91 - cyan

ApplicationWindow {
    id: root
    visible: true
    width: 960
    height: 480
    title: qsTr("Desktop Weather")

    Component.onCompleted: {
        Weather.setCityName("Lublin")
        Weather.parseJSON()
        Weather.parseJSON5Days()
        Weather.parseJSON16Days();
    }

    SwipeView {
          id: swipeView
          currentIndex: 0
          anchors.fill: parent

          Scene.Page1 { id: page1 }

          Item {

              /* Header Page 2 */
              Rectangle {
                  id: customHeader
                  width: parent.width
                  height: tabBar.height
                  color: "#1a1d21"

                  Text {
                      color: "#ffffff"
                      text: "STATISTICS"
                      font.pointSize: 10.5
                      font.family: "Roboto"
                      font.weight: Font.Medium
                      anchors.centerIn: parent
                  }
              }

              TabBar {
                  id: tabBar
                  width: parent.width
                  anchors.top: customHeader.bottom
                  TabButton { id: a;text: qsTr("Temperature") }
                  TabButton { text: qsTr("Pressure") }
                  TabButton { text: qsTr("Clouds") }
                  TabButton { text: qsTr("Winds") }
                  Material.accent: "#e33630"
                  Material.background: "#1a1d21"
                  Material.foreground: "white"
              }

              StackLayout {
                  width: parent.width
                  anchors.top: tabBar.bottom
                  anchors.bottom: parent.bottom
                  currentIndex: tabBar.currentIndex

                  Scene.Page2 { id: page2 }
                  Scene.Page2 { id: page3 }
                  Scene.Page2 { id: page4 }
                  Scene.Page2 { id: page5 }
              }

              DropShadow {
                  anchors.fill: tabBar
                  horizontalOffset: 3
                  verticalOffset: 3
                  radius: 8.0
                  samples: 17
                  color: "#80000000"
                  source: tabBar
              }
          }
      }

      PageIndicator {
          id: indicator
          count: swipeView.count
          currentIndex: swipeView.currentIndex
          anchors.bottom: swipeView.bottom
          anchors.horizontalCenter: parent.horizontalCenter
      }
}










































