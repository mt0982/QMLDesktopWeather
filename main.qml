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

              TabBar {
                  id: tabBar
                  width: parent.width
                  spacing: 0
                  anchors.top: customHeader.bottom

                  TabButton { id: tb1; text: qsTr("TEMPERATURE"); height: parent.height
                      background: Rectangle { anchors.fill: parent; color: "#1a1d21"
                          Rectangle { width: tb1.width; height: tb1.checked ? 3: 0; color: "#e33630"; y: tb1.height - 3 }
                      }
                      contentItem: Text { text: parent.text; font.pointSize: 10.5; font.family: "Roboto";
                          font.weight: Font.Medium; color: parent.checked ? "#e33630" : "white"
                          horizontalAlignment: Text.AlignHCenter; verticalAlignment: Text.AlignVCenter
                      }
                  }

                  TabButton { id: tb2; text: qsTr("PRESSURE"); height: parent.height
                      background: Rectangle { anchors.fill: parent; color: "#1a1d21"
                          Rectangle { width: tb1.width; height: tb2.checked ? 3: 0; color: "#e33630"; y: tb2.height - 3 }
                      }
                      contentItem: Text { text: parent.text; font.pointSize: 10.5; font.family: "Roboto";
                          font.weight: Font.Medium; color: parent.checked ? "#e33630" : "white"
                          horizontalAlignment: Text.AlignHCenter; verticalAlignment: Text.AlignVCenter
                      }
                  }

                  TabButton { id: tb3; text: qsTr("CLOUDS"); height: parent.height
                      background: Rectangle { anchors.fill: parent; color: "#1a1d21"
                          Rectangle { width: tb3.width; height: tb3.checked ? 3: 0; color: "#e33630"; y: tb3.height - 3 }
                      }
                      contentItem: Text { text: parent.text; font.pointSize: 10.5; font.family: "Roboto";
                          font.weight: Font.Medium; color: parent.checked ? "#e33630" : "white"
                          horizontalAlignment: Text.AlignHCenter; verticalAlignment: Text.AlignVCenter
                      }
                  }

                  TabButton { id: tb4; text: qsTr("WINDS"); height: parent.height
                      background: Rectangle { anchors.fill: parent; color: "#1a1d21"
                          Rectangle { width: tb4.width; height: tb4.checked ? 3: 0; color: "#e33630"; y: tb4.height - 3 }
                      }
                      contentItem: Text { text: parent.text; font.pointSize: 10.5; font.family: "Roboto";
                          font.weight: Font.Medium; color: parent.checked ? "#e33630" : "white"
                          horizontalAlignment: Text.AlignHCenter; verticalAlignment: Text.AlignVCenter
                      }
                  }
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
                  verticalOffset: 3
                  radius: 8.0
                  samples: 17
                  color: "#80000000"
                  source: tabBar
              }

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
          }
      }

      PageIndicator {
          id: indicator
          count: swipeView.count
          currentIndex: swipeView.currentIndex
          anchors.bottom: swipeView.bottom
          anchors.horizontalCenter: parent.horizontalCenter

          delegate: Rectangle {
                  implicitWidth: 8
                  implicitHeight: 8
                  radius: width / 2
                  color: "white"
                  opacity: index === swipeView.currentIndex ? 0.95 : pressed ? 0.7 : 0.45
                  Behavior on opacity {
                      OpacityAnimator {
                          duration: 100
                      }
                  }
              }
      }
}










































