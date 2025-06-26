import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:plants_app/presentation/utils/navigation_providers.dart';

class TitleScreen extends ConsumerWidget {
  const TitleScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomNavIndex = ref.watch(bottomNavIndexProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '植物一覧画面',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold, // ここを追加
          ),
        ),

        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '植物管理アプリ',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text('ボタンが押されました！')));
              },
              child: const Text('ボタン', style: TextStyle(fontSize: 18)),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                context.push('/calendar');
              },
              child: Text("画面遷移サンプル"),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                context.goNamed('test');
              },
              child: Text("画面遷移サンプル"),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottomNavIndex,
        onTap: (index){
          ref.read(bottomNavIndexProvider.notifier).state = index;

          if (index == 0){
            context.go('/');
          } else if (index == 1){
            context.go('/calendar');
          }
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.yard), label: '植物一覧'),
          BottomNavigationBarItem(icon: Icon(Icons.edit_calendar), label: '水やりカレンダー'),
        ],
      ),
    );
  }
}
