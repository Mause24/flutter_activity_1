import 'package:flutter/material.dart';

class CustomRoute extends StatefulWidget {
  const CustomRoute({super.key, required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  State<CustomRoute> createState() => _CustomRouteState();
}

class _CustomRouteState extends State<CustomRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: widget.child,
    );
  }
}
