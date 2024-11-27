import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:naviquezon/src/core/themes/styles/color_style.dart';
import 'package:naviquezon/src/core/themes/styles/text_style_default.dart';
import 'package:naviquezon/src/core/utils/extensions/num_extensions.dart';
import 'package:naviquezon/src/core/widgets/containers/error_state_container.dart';
import 'package:naviquezon/src/features/establishment/domain/models/establishment_report_model.dart';

///{@template EstablishmentInfoOverview}
/// Custom widget that display the overview details of the establishment.
///{@endtemplate}
class EstablishmentInfoOverview extends StatelessWidget {
  ///{@macro EstablishmentInfoOverview}
  const EstablishmentInfoOverview({
    required List<EstablishmentReportModel> reportList,
    super.key,
  }) : _reportList = reportList;

  final List<EstablishmentReportModel> _reportList;

  @override
  Widget build(BuildContext context) {
    if (_reportList.isEmpty) {
      return const ErrorStateContainer(
        message: 'No reports available',
      );
    }

    return ReportLineChart(
      reports: _reportList,
    );
  }
}

///{@template ReportLineChart}
/// Custom widget that display the line chart for the report.
///{@endtemplate}
class ReportLineChart extends StatelessWidget {
  ///{@macro ReportLineChart}
  const ReportLineChart({
    required List<EstablishmentReportModel> reports,
    super.key,
  }) : _reports = reports;

  final List<EstablishmentReportModel> _reports;
  static const _year = 2024;

  /// Getter for the bar data widget
  ///
  List<FlSpot> get _barDataWidget {
    final spots = <FlSpot>[];

    for (var i = 0; i < 12; i++) {
      var monthTotal = 0;

      for (final report in _reports) {
        final visitDate = report.date.toUnixTime(isSeconds: true);
        final visitMonth = visitDate.month;
        final visitYear = visitDate.year;

        if (visitMonth == i && visitYear == _year) {
          monthTotal += report.total.toInt();
        }
      }

      spots.add(FlSpot(i.toDouble(), monthTotal.toDouble()));
    }

    return spots;
  }

  Widget _bottomTitleWidgets(double value, TitleMeta meta) {
    String text;

    switch (value.toInt()) {
      case 0:
        text = 'Jan';
      case 1:
        text = 'Feb';
      case 2:
        text = 'Mar';
      case 3:
        text = 'Apr';
      case 4:
        text = 'May';
      case 5:
        text = 'Jun';
      case 6:
        text = 'Jul';
      case 7:
        text = 'Aug';
      case 8:
        text = 'Sep';
      case 9:
        text = 'Oct';
      case 10:
        text = 'Nov';
      case 11:
        text = 'Dec';
      default:
        return Container();
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: Text(text, style: textStyle10w700),
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(
        '${value.toInt()}',
        style: textStyle10w400,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: Column(
        children: [
          Text(
            '2024',
            style: textStyle14w700,
          ),
          const Gap(8),
          Expanded(
            child: AspectRatio(
              aspectRatio: 2,
              child: LineChart(
                LineChartData(
                  lineTouchData: const LineTouchData(enabled: false),
                  lineBarsData: [
                    LineChartBarData(
                      spots: _barDataWidget,
                      color: color1363DF,
                      dotData: const FlDotData(
                        show: false,
                      ),
                    ),
                  ],
                  minY: 0,
                  borderData: FlBorderData(
                    show: true,
                    border: Border.all(color: colorD9D9D9),
                  ),
                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: 1,
                        getTitlesWidget: _bottomTitleWidgets,
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: leftTitleWidgets,
                        interval: 100,
                        reservedSize: 40,
                      ),
                    ),
                    topTitles: const AxisTitles(),
                    rightTitles: const AxisTitles(),
                  ),
                  gridData: const FlGridData(
                    drawVerticalLine: false,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
