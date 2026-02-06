import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class RegionsBarChart extends StatelessWidget {
  const RegionsBarChart({super.key});

  @override
  Widget build(BuildContext context) {
    // Viloyatlar ro'yxati
    final List<String> regions = [
      "Jizzax shahar",
      "Arnasoy tumani",
      "Baxmal tumani",
      "G'allaorol tumani",
      "Do'stlik tumani",
      "Sharof Rashidov tumani",
      "Zomin tumani",
      "Zarbdor tumani",
      "Zafarobod tumani",
      "Mirzacho'l tumani",
      "Paxtakor tumani",
      "Forish tumani",
      "Yangiobod tumani",
    ];

    return Container(
      height: 400,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Hududlar kesimida",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: 35, // Maksimal qiymatdan biroz balandroq
                barTouchData: BarTouchData(
                  enabled:
                      true, // Tap bo'lganda tooltip chiqishini o'chiramiz (chunki u doim ochiq bo'ladi)
                  touchTooltipData: BarTouchTooltipData(
                    getTooltipColor: (group) =>
                        Colors.transparent, // Tooltip fonini shaffof qilish
                    tooltipPadding: EdgeInsets.zero,
                    tooltipMargin: 8,
                    getTooltipItem: (group, groupIndex, rod, rodIndex) {
                      return BarTooltipItem(
                        rod.toY.round().toString(), // Ustun tepasidagi qiymat
                        const TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      );
                    },
                  ),
                ),
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) =>
                          _bottomTitles(value, meta, regions),
                      reservedSize: 42,
                    ),
                  ),
                  leftTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: true, reservedSize: 30),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                gridData: const FlGridData(show: false),
                borderData: FlBorderData(show: false),
                barGroups: _generateBarGroups(regions),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Ustunlarni generatsiya qilish (Min 10, Max 30)
  List<BarChartGroupData> _generateBarGroups(List<String> regions) {
    final random = Random();
    return List.generate(regions.length, (index) {
      // 10 dan 30 gacha bo'lgan ixtiyoriy son
      double randomValue = 10 + random.nextInt(21).toDouble();

      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: randomValue,
            color: const Color(0xFF3384C3),
            width: 14,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
          ),
        ],
      );
    });
  }

  // Pastki qismdagi yozuvlar (Viloyat nomlari qisqartmasi)
  Widget _bottomTitles(double value, TitleMeta meta, List<String> regions) {
    const style = TextStyle(
      color: Colors.grey,
      fontSize: 10,
      fontWeight: FontWeight.bold,
    );
    String text = regions[value.toInt()]
        .substring(0, 3)
        .toUpperCase(); // "TOS", "SAM"...

    return SideTitleWidget(
      space: 10,
      meta: TitleMeta(
        min: 18,
        max: 30,
        parentAxisSize: 20,
        axisPosition: 20,
        appliedInterval: 20,
        sideTitles: SideTitles(showTitles: true),
        formattedValue: "",
        axisSide: AxisSide.bottom,
        rotationQuarterTurns: 0,
      ),
      child: Text(text, style: style),
    );
  }
}
