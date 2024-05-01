import 'package:flutter/material.dart';
import 'package:homework3/home_page.dart';

class FinishPage extends StatefulWidget {
  const FinishPage({super.key, required this.content});
  final String content;
  @override
  State<FinishPage> createState() => _FinishPageState();
}

class _FinishPageState extends State<FinishPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('FinishPage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.content, style: const TextStyle(fontSize: 50)),
            ElevatedButton(
              child:const Text('返回', style: TextStyle(fontSize: 40)),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) =>const HomePage()),
                  (Route<dynamic> route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}