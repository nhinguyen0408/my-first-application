import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ScreenB extends StatefulWidget {
  const ScreenB({super.key});

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<ScreenB> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Screen B'),
        ),
        backgroundColor: Colors.amberAccent,
        body: Container()
    );
  }
}