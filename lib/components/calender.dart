// days of the month
// function to switch between months of the active year

import 'package:flutter/material.dart';

class Calender extends StatefulWidget {
  const Calender({super.key});

  @override
  State<Calender> createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  DateTime activeDate = DateTime.now();
  List<DateTime> monthDays(int year, int month) {
    final lastDay = DateTime(year, month + 1, 0).day;
    return List.generate(lastDay, (i) => DateTime(year, month, i + 1));
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final weekdays = ["Sun", "Mon", "Tue", "Wed", "Thur", "Fri", "Sat"];
    final dmonth = monthDays(activeDate.year, activeDate.month);
    final blanks = dmonth.first.weekday % 7;
    final itemCount = 7 + dmonth.length + blanks;
    return SizedBox(
      height:400,
      child: Card(
        color: scheme.surface,
        child: Padding(
          padding: .all(4),
          child: Column(
            mainAxisAlignment: .start,
            spacing: 2,
            children: [
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.arrow_left)),
                  IconButton(onPressed: () {}, icon: Icon(Icons.arrow_right)),
                ],
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 7,
                    mainAxisExtent: 48,
                    mainAxisSpacing: 5
                  ),
                  itemCount: itemCount,
                  itemBuilder: (context, index) {
                    if (index < 7) {
                      return Container(
                        decoration: BoxDecoration(
                          shape: .circle,
                          color: scheme.onSurface,
                        ),
                        child: Center(
                          child: Text(
                            weekdays[index],
                            style: TextStyle(
                              color: scheme.surface,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      );
                    }
                    final dayIndex = index - 7 - blanks;

                    if (dayIndex < 0 || dayIndex >= dmonth.length) {
                      return SizedBox.shrink();
                    }
                    final activeDay = dmonth[dayIndex].day == activeDate.day;
                    return ElevatedButton(
                      onPressed: () {
                        DateTime selected = dmonth[dayIndex];
                        setState(() {
                          activeDate = selected;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        padding: .zero,
                        shape: CircleBorder(),
                        backgroundColor: activeDay
                            ? scheme.primary
                            : scheme.surface,
                        foregroundColor: activeDay
                            ? scheme.onPrimary
                            : scheme.onSurface,
                      ),
                      child: Text("${dmonth[dayIndex].day}", maxLines: 1),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
