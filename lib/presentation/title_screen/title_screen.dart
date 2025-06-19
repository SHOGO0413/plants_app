import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TitleScreen extends StatelessWidget {
  const TitleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('タイトル'), backgroundColor: Colors.blue),
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
                context.push('/test');
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
    );
  }
}
