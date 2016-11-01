import QtQuick 2.0
import QtCharts 2.1

Item {

    /* Functions */
    function clear() { series.clear(); series2.clear(); series3.clear()}
    function append(x,y) { series.append(x,y) }
    function append2(x,y) { series2.append(x,y) }
    function append3(x,y) { series3.append(x,y) }
    function xAxisRange(min,max) { xAxis.min = min; xAxis.max = max }
    function yAxisRange(min,max) { yAxis.min = min; yAxis.max = max }

    /* Content */
    Rectangle {
        anchors.fill: parent
        color: "#1a1d21"

        /* Chart Flickable Area */
        Flickable {
            interactive: true
            width: parent.width
            height: parent.height
            contentWidth: parent.width * 1.5
            contentHeight: parent.height
            boundsBehavior: Flickable.StopAtBounds
            clip: true

            ChartView {
                id: chart
                height: parent.height //anchors.fill: parent
                width: parent.width
                antialiasing: true
                //theme: ChartView.ChartThemeQt
                legend.visible: false
                margins.bottom: 0
                margins.left: 0
                margins.right: 0
                margins.top: 0
                backgroundColor: "transparent"

                SplineSeries {
                    id: series
                    name: "Temperature"
                    pointsVisible: false
                    color: "#fcb100"

                    axisX: DateTimeAxis {
                        id: xAxis
                        format: "MM.dd"// hh.mm"
                        tickCount: 5
                        gridVisible: false
                        //labelsVisible: false
                        //lineVisible: false
                        //visible: false
                        labelsColor: "white"
                    }

                    axisY: ValueAxis {
                        id: yAxis;
                        tickCount: 5
                        gridVisible: false
                        //labelsVisible: false
                        //lineVisible: false
                        //visible: false
                        labelsColor: "white"
                    }
                }

                SplineSeries {
                    id: series2
                    axisX: xAxis
                    axisY: yAxis
                    color: "#439c91"
                }

                SplineSeries {
                    id: series3
                    axisX: xAxis
                    axisY: yAxis
                    color: "#e33630"
                }
            }
        }
    }
}














