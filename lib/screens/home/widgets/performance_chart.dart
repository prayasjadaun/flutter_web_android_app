import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PerformanceChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get screen width
    final screenWidth = MediaQuery.of(context).size.width;

    final padding = screenWidth < 600 ? 12.0 : 24.0;
    final titleFontSize = screenWidth < 600 ? 12.0 : 14.0;
    final lineWidth = screenWidth < 600 ? 2.0 : 4.0;

    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[400],
        borderRadius: BorderRadius.circular(15),
      ),
      width: double.infinity,
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Column(
            children: [
              Container(
                height: 70,
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Title Section
                    Flexible(
                      child: Text(
                        'Overall Performance\nThe Years',
                        style: TextStyle(
                          fontSize: screenWidth < 600 ? 18 : 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // Legend Section with Flexible
                    const Flexible(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Row(
                              children: [
                                Text(
                                  ' ⦿ ',
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.redAccent,
                                  ),
                                ),
                                Text(
                                  'Pending Done',
                                  style: TextStyle(
                                    color: Colors.redAccent,
                                    fontStyle: FontStyle.italic,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 30),
                                Text(
                                  ' ⦿ ',
                                  style: TextStyle(
                                    color: Colors.deepPurple,
                                    fontSize: 30,
                                  ),
                                ),
                                Text(
                                  'Project Done',
                                  style: TextStyle(
                                    color: Colors.deepPurple,
                                    fontStyle: FontStyle.italic,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 4,
                        blurRadius: 12,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(16),
                  child: LineChart(
                    LineChartData(
                      backgroundColor: Colors.white,
                      titlesData: FlTitlesData(
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            interval: 10,
                            reservedSize: screenWidth < 600 ? 32 : 48,
                            getTitlesWidget: (value, meta) => Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Text(
                                value.toInt().toString(),
                                style: TextStyle(
                                  fontSize: titleFontSize,
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            interval: 1,
                            reservedSize: screenWidth < 600 ? 24 : 36,
                            getTitlesWidget: (value, meta) {
                              const years = [
                                2015,
                                2016,
                                2017,
                                2018,
                                2019,
                                2020
                              ];
                              return Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  years[value.toInt()].toString(),
                                  style: TextStyle(
                                    fontSize: titleFontSize,
                                    color: Colors.grey[600],
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        rightTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        topTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                      ),
                      gridData: FlGridData(
                        show: true,
                        drawVerticalLine: true,
                        horizontalInterval: 10,
                        verticalInterval: 1,
                        getDrawingHorizontalLine: (value) {
                          return FlLine(
                            color: Colors.grey[300],
                            strokeWidth: 1,
                          );
                        },
                        getDrawingVerticalLine: (value) {
                          return FlLine(
                            color: Colors.grey[300],
                            strokeWidth: 1,
                          );
                        },
                      ),
                      borderData: FlBorderData(
                        show: true,
                        border: Border.all(color: Colors.grey[400]!, width: 1),
                      ),
                      minX: 0,
                      maxX: 5,
                      minY: 0,
                      maxY: 50,
                      lineBarsData: [
                        LineChartBarData(
                          spots: const [
                            FlSpot(0, 30),
                            FlSpot(1, 10),
                            FlSpot(2, 40),
                            FlSpot(3, 20),
                            FlSpot(4, 35),
                            FlSpot(5, 25),
                          ],
                          isCurved: true,
                          color: Colors.redAccent,
                          barWidth: lineWidth,
                          dotData: const FlDotData(show: true),
                          belowBarData: BarAreaData(
                            show: true,
                            color: Colors.redAccent.withOpacity(0.3),
                          ),
                        ),
                        LineChartBarData(
                          spots: const [
                            FlSpot(0, 20),
                            FlSpot(1, 35),
                            FlSpot(2, 15),
                            FlSpot(3, 40),
                            FlSpot(4, 25),
                            FlSpot(5, 45),
                          ],
                          isCurved: true,
                          color: Colors.deepPurple,
                          barWidth: lineWidth,
                          dotData: const FlDotData(show: true),
                          belowBarData: BarAreaData(
                            show: true,
                            color: Colors.deepPurple.withOpacity(0.3),
                          ),
                        ),
                      ],
                      lineTouchData: LineTouchData(
                        enabled: true,
                        touchTooltipData: LineTouchTooltipData(
                          tooltipPadding: const EdgeInsets.all(8),
                          tooltipMargin: 8,
                          getTooltipItems: (touchedSpots) {
                            return touchedSpots.map((spot) {
                              return LineTooltipItem(
                                'Year ${2015 + spot.x.toInt()}\n${spot.y.toInt()}',
                                TextStyle(
                                  color: Colors.white,
                                  fontSize: titleFontSize,
                                  fontWeight: FontWeight.bold,
                                  backgroundColor:
                                      Colors.blueGrey.withOpacity(0.8),
                                ),
                              );
                            }).toList();
                          },
                        ),
                      ),
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
}
