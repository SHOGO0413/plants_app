import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:plants_app/presentation/plants_list_screen/plants_list_card.dart';
import 'package:plants_app/presentation/plants_list_screen/plants_list_detail.dart';
import 'package:plants_app/presentation/utils/navigation_providers.dart';

class PlantsListScreen extends ConsumerWidget {
  const PlantsListScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomNavIndex = ref.watch(bottomNavIndexProvider);
    var data = <Plants>[];
    for (var i = 0; i < 30; i++) {
      data.add(
        Plants(image: const AssetImage("assets/icon.png"), title: "Agave"),
      );
    }
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.green, title: Text(title)),
      body: Center(
        child: ListView.builder(
          padding: EdgeInsets.all(8.0),
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) {
            return PlantsView(
              data: data[index],
              onItemClickListener: () {
                context.goNamed('initial');
              },
            );
          },
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
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.yard), label: '植物一覧'),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit_calendar),
            label: '水やりカレンダー',
          ),
        ],
      ),
    );
  }
}
