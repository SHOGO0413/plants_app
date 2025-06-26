import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:plants_app/presentation/utils/calender_provider.dart';
import 'package:plants_app/presentation/utils/navigation_providers.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends ConsumerWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // プロバイダーからカレンダーの状態とNotifierを取得
    final calendarState = ref.watch(calendarProvider);
    final calendarNotifier = ref.read(calendarProvider.notifier);

    final bottomNavIndex = ref.watch(bottomNavIndexProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('水やりカレンダー'),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            TableCalendar(
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: calendarState.focusedDay, // プロバイダーから取得
              calendarFormat: calendarState.calendarFormat, // プロバイダーから取得
              selectedDayPredicate: (day) {
                return isSameDay(calendarState.selectedDay, day); // プロバイダーから取得
              },
              onDaySelected: (selectedDay, focusedDay) {
                calendarNotifier.setSelectedDay(selectedDay, focusedDay); // Notifierを使って状態を更新
              },
              onFormatChanged: (format) {
                calendarNotifier.setCalendarFormat(format); // Notifierを使って状態を更新
              },
              onPageChanged: (focusedDay) {
                calendarNotifier.setFocusedDay(focusedDay); // Notifierを使って状態を更新
              },
              calendarStyle: const CalendarStyle(
                todayDecoration: BoxDecoration(
                  color: Colors.lightGreen,
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
              ),
              headerStyle: const HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
              ),
            ),
            const SizedBox(height: 20),
            calendarState.selectedDay != null // プロバイダーから取得
                ? Text(
              '選択された日: ${calendarState.selectedDay!.year}/${calendarState.selectedDay!.month}/${calendarState.selectedDay!.day}',
              style: const TextStyle(fontSize: 18),
            )
                : const Text('日付を選択してください', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottomNavIndex,
        onTap: (index) {
          ref.read(bottomNavIndexProvider.notifier).state = index;

          if (index == 0) {
            context.go('/');
          } else if (index == 1) {
            context.go('/calendar');
          }
        },
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.yard), label: '植物一覧'),
          BottomNavigationBarItem(icon: Icon(Icons.edit_calendar), label: '水やりカレンダー'),
        ],
      ),
    );
  }
}