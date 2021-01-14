import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fl_chart/fl_chart.dart';

class Chart extends StatelessWidget {
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chart'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          elevation: 5,
          child: Stack(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 1.4,
                child: Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(18),
                      ),
                      color: Color(0xffffffff)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        right: 18.0, left: 12.0, top: 24, bottom: 12),
                    child: LineChart(
                      mainData(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          getTextStyles: (value) => const TextStyle(
              color: Colors.red, fontWeight: FontWeight.bold, fontSize: 16),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '55';

              case 3:
                return '65';

              case 5:
                return '75';

              case 7:
                return '85';

              case 9:
                return '95';

              case 11:
                return '05';

              case 13:
                return '15';

              case 16:
                return '18';

              case 18:
                return '20';
            }
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => const TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '1M';
              case 2:
                return '2M';
              case 3:
                return '3M';
              case 4:
                return '4M';
              case 5:
                return '5M';
              case 6:
                return '6M';
            }
            return '';
          },
          reservedSize: 28,
          margin: 12,
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 2)),
      minX: 0,
      maxX: 19,
      minY: 0,
      maxY: 7,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(1, 1.25),
            FlSpot(2, 1.45),
            FlSpot(3, 1.73),
            FlSpot(4, 2.13),
            FlSpot(5, 2.65),
            FlSpot(6, 3.22),
            FlSpot(7, 3.87),
            FlSpot(8, 4.44),
            FlSpot(9, 4.95),
            FlSpot(10, 5.36),
            FlSpot(11, 5.8),
            FlSpot(12, 6.2),
            FlSpot(13, 6.42),
            FlSpot(14, 6.49),
            FlSpot(15, 6.58),
            FlSpot(16, 6.68),
            FlSpot(17, 6.78),
            FlSpot(18, 6.87),
          ],
          isCurved: true,
          colors: gradientColors,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: true,

          ),
          belowBarData: BarAreaData(
            show: true,
            colors:
                gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ],
    );
  }
}
