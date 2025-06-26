import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/legacy.dart';
import 'package:table_calendar/table_calendar.dart'; // TableCalendarのCalendarFormatを使用するため

// カレンダーの状態を保持するクラス
class CalendarState {
  final CalendarFormat calendarFormat;
  final DateTime focusedDay;
  final DateTime? selectedDay;

  CalendarState({
    required this.calendarFormat,
    required this.focusedDay,
    this.selectedDay,
  });

  // 状態をコピーして一部だけ変更するためのメソッド
  CalendarState copyWith({
    CalendarFormat? calendarFormat,
    DateTime? focusedDay,
    DateTime? selectedDay,
  }) {
    return CalendarState(
      calendarFormat: calendarFormat ?? this.calendarFormat,
      focusedDay: focusedDay ?? this.focusedDay,
      selectedDay: selectedDay, // nullを許容するため ?? selectedDay としない
    );
  }
}

// カレンダーの状態を管理するNotifier
class CalendarNotifier extends StateNotifier<CalendarState> {
  CalendarNotifier()
      : super(CalendarState(
    calendarFormat: CalendarFormat.month,
    focusedDay: DateTime.now(),
    selectedDay: null,
  ));

  void setSelectedDay(DateTime? newSelectedDay, DateTime newFocusedDay) {
    if (!isSameDay(state.selectedDay, newSelectedDay)) {
      state = state.copyWith(
        selectedDay: newSelectedDay,
        focusedDay: newFocusedDay,
      );
    }
  }

  void setFocusedDay(DateTime newFocusedDay) {
    state = state.copyWith(focusedDay: newFocusedDay);
  }

  void setCalendarFormat(CalendarFormat newFormat) {
    if (state.calendarFormat != newFormat) {
      state = state.copyWith(calendarFormat: newFormat);
    }
  }
}

// CalendarNotifierを提供するプロバイダー
final calendarProvider = StateNotifierProvider<CalendarNotifier, CalendarState>((ref) {
  return CalendarNotifier();
});