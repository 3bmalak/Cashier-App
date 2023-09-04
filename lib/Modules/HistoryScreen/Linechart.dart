import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:untitled1/Layout/cubit/cubit.dart';
import 'package:untitled1/Modules/HistoryScreen/appc.dart';

class LineChartSample2 extends StatefulWidget {
  String start;
  String end;

  // Constructor with parameters
  LineChartSample2( this.start, this.end);

  @override
  State<LineChartSample2> createState() => _LineChartSample2State(start,end);
}

class _LineChartSample2State extends State<LineChartSample2> {
  String start;
  String end;

  // Constructor with parameters
  _LineChartSample2State( this.start, this.end);


  List<Color> gradientColors = [
    AppColor.contentColorCyan,
    AppColor.contentColorBlue,
  ];

  bool showAvg = false;

  @override
  Widget build(BuildContext context) {



    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.70,
          child: Padding(
            padding: const EdgeInsets.only(
              right: 18,
              left: 12,
              top: 24,
              bottom: 12,
            ),
            child: LineChart(
              showAvg ? avgData() : mainData(),
            ),
          ),
        ),
        SizedBox(
          width: 60,
          height: 34,
          child: TextButton(
            onPressed: () {
              setState(() {
                showAvg = !showAvg;
              });
            },
            child: Text(
              'avg',
              style: TextStyle(
                fontSize: 12,
                color: showAvg ? Colors.white.withOpacity(0.5) : Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 10,
      color: Colors.white,

    );



    DateTime startDate = DateFormat('dd/MM/yyyy').parse(start);
    DateTime endDate = DateFormat('dd/MM/yyyy').parse(end);
    Duration dateRange = endDate.difference(startDate);

    DateTime labelDate;

    if (dateRange.inDays <= 30) { // Days
      labelDate = startDate.add(Duration(days: value.toInt()));
      if (labelDate.isAfter(endDate)) {
        return Container();  // Return empty string if label date is after end date
      }
      return Text(DateFormat('dd/MM').format(labelDate), style: style);
    }
    else if (dateRange.inDays <= 365) { // Months
      labelDate = DateTime( startDate.year, startDate.month + value.toInt());
      if (labelDate.isAfter(endDate)) {
        return Container();  // Return empty string if label date is after end date
      }
      return Text(DateFormat('MMM').format(labelDate), style: style);
    }
    else { // Years
      labelDate = DateTime(startDate.year + value.toInt());
      if (labelDate.isAfter(endDate)) {
        return Container();  // Return empty string if label date is after end date
      }
      return Text(DateFormat('yyyy').format(labelDate), style: style);
    }
  }

  Widget leftTitleWidgets(double value, TitleMeta meta,) {
    const style = TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 15,
        color: Colors.white
    );
    String text;
    switch (value.toInt()) {
      case 2:
        text = '10K';
        break;
      case 5:
        text = '30k';
        break;
      case 8:
        text = '50k';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }




  String determineLabelFormat(DateTime start, DateTime end) {
    Duration dateRange = end.difference(start);

    if (dateRange.inDays <= 30) {
      return "day";
    } else if (dateRange.inDays <= 365) {
      return "month";
    } else {
      return "year";
    }
  }
  int monthDifference(DateTime startDate, DateTime endDate) {
    return (endDate.year - startDate.year) * 12 + endDate.month - startDate.month;
  }

  LineChartData mainData() {

    AppCubit cubit=AppCubit.get(context);

    Map<String, double> profitsByDate = {};

    for (var i in cubit.d){
      double orderProfit = 0.0;
      for(var j in i.data){
        orderProfit += j.boughtPrice;
      }
      double profitForDate = i.totalcost - orderProfit;
      print(double.parse(profitForDate.toStringAsFixed(1)));
      profitsByDate[i.date] = double.parse(((profitsByDate[i.date] ?? 0.0) + (profitForDate*.0001)).toStringAsFixed(1));
    }

    DateTime startDate = DateFormat('dd/MM/yyyy').parse(start);
    DateTime endDate = DateFormat('dd/MM/yyyy').parse(end);
    String labelFormat = determineLabelFormat(startDate, endDate);

    List<FlSpot> spots = [];

    for (DateTime date = startDate; date.isBefore(endDate.add(Duration(days: 1))); date = date.add(Duration(days: 1))) {
      String formattedDate = DateFormat('dd/MM/yyyy').format(date);
      double value = profitsByDate.containsKey(formattedDate) ? double.parse(profitsByDate[formattedDate].toString()) : 0.0;
      int difference = date.difference(startDate).inDays;

      spots.add(FlSpot(difference.toDouble(), value));
    }

    List<double> profits = profitsByDate.values.toList();
    double averageProfit = profits.reduce((a, b) => a + b) / profits.length;
    double specificProfit = 30000; // Adjust this value as needed

    double maxX;
    Duration dateRange = endDate.difference(startDate);
    if (dateRange.inDays <= 30) { // Days
      maxX = dateRange.inDays.toDouble();
    } else if (dateRange.inDays <= 365) {// Months
      // DateTime s = DateFormat('dd/MM/yyyy').parse(start).subtract(Duration(days: 30)); // Subtract 30 days (approx 1 month)
      DateTime e = DateFormat('dd/MM/yyyy').parse(end).add(Duration(days: 30)); // Add 30 days (approx 1 month)

      maxX = monthDifference(startDate, e).toDouble();
    } else { // Years
      maxX = (dateRange.inDays / 365).floor().toDouble();
    }

    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: AppColor.mainGridLineColor,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: AppColor.mainGridLineColor,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: maxX, // Ending at the difference between end and start date
      minY: 0,
      maxY: 10,
      lineBarsData: [
        LineChartBarData(
          spots:spots,
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],

    );
  }


  LineChartData avgData() {
    return LineChartData(
      lineTouchData: const LineTouchData(enabled: false),
      gridData: FlGridData(
        show: true,
        drawHorizontalLine: true,
        verticalInterval: 1,
        horizontalInterval: 1,
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: bottomTitleWidgets,
            interval: 1,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
            interval: 1,
          ),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3.44),
            FlSpot(2.6, 3.44),
            FlSpot(4.9, 3.44),
            FlSpot(6.8, 3.44),
            FlSpot(8, 3.44),
            FlSpot(9.5, 3.44),
            FlSpot(11, 3.44),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: [
              ColorTween(begin: gradientColors[0], end: gradientColors[1])
                  .lerp(0.2)!,
              ColorTween(begin: gradientColors[0], end: gradientColors[1])
                  .lerp(0.2)!,
            ],
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: [
                ColorTween(begin: gradientColors[0], end: gradientColors[1])
                    .lerp(0.2)!
                    .withOpacity(0.1),
                ColorTween(begin: gradientColors[0], end: gradientColors[1])
                    .lerp(0.2)!
                    .withOpacity(0.1),
              ],
            ),
          ),
        ),
      ],
    );
  }
}