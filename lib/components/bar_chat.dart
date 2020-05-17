import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarChat extends StatefulWidget {
  final List labels;
  final List values;
  BarChat({this.labels, this.values});
  @override
  State<StatefulWidget> createState() => BarChatState();
}

const fillColor = Color(0xFFFF5959);

class BarChatState extends State<BarChat> {
  @override
  Widget build(BuildContext context) {
    List tempLabels = ['1', '2', '3', '4', '5', '6', '7'];
    List labels = widget.labels == null ? tempLabels : widget.labels;
    List tempValues = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0];
    List values = widget.values == null ? tempValues : widget.values;
    List temp;
    if (widget.values != null) {
      temp = List.from(widget.values);
      temp.sort();
    }

    return AspectRatio(
      aspectRatio: 1.8,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        color: Colors.white,
        child: BarChart(
          BarChartData(
            alignment: BarChartAlignment.spaceAround,
            maxY: temp.last * 1.2,
            barTouchData: BarTouchData(
              enabled: false,
              touchTooltipData: BarTouchTooltipData(
                tooltipBgColor: Colors.transparent,
                tooltipPadding: const EdgeInsets.all(0),
                tooltipBottomMargin: 8,
                getTooltipItem: (
                  BarChartGroupData group,
                  int groupIndex,
                  BarChartRodData rod,
                  int rodIndex,
                ) {
                  return BarTooltipItem(
                    rod.y.round().toString(),
                    TextStyle(
                      color: Color(0xff7589a2),
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
            ),
            titlesData: FlTitlesData(
              show: true,
              bottomTitles: SideTitles(
                showTitles: true,
                textStyle: TextStyle(
                    color: const Color(0xff7589a2),
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
                margin: 20,
                getTitles: (double value) {
                  switch (value.toInt()) {
                    case 0:
                      return labels[5];
                    case 1:
                      return labels[4];
                    case 2:
                      return labels[3];
                    case 3:
                      return labels[2];
                    case 4:
                      return labels[1];
                    case 5:
                      return labels[0];
                    case 6:
                      return '16 May';
                    default:
                      return '';
                  }
                },
              ),
              leftTitles: SideTitles(showTitles: false),
            ),
            borderData: FlBorderData(
              show: false,
            ),
            barGroups: [
              BarChartGroupData(
                  x: 0,
                  barRods: [BarChartRodData(y: values[5], color: fillColor)],
                  showingTooltipIndicators: [0]),
              BarChartGroupData(
                  x: 1,
                  barRods: [BarChartRodData(y: values[4], color: fillColor)],
                  showingTooltipIndicators: [0]),
              BarChartGroupData(
                  x: 2,
                  barRods: [BarChartRodData(y: values[3], color: fillColor)],
                  showingTooltipIndicators: [0]),
              BarChartGroupData(
                  x: 3,
                  barRods: [BarChartRodData(y: values[2], color: fillColor)],
                  showingTooltipIndicators: [0]),
              BarChartGroupData(
                  x: 4,
                  barRods: [BarChartRodData(y: values[1], color: fillColor)],
                  showingTooltipIndicators: [0]),
              BarChartGroupData(
                  x: 5,
                  barRods: [BarChartRodData(y: values[0], color: fillColor)],
                  showingTooltipIndicators: [0]),
            ],
          ),
        ),
      ),
    );
  }
}
