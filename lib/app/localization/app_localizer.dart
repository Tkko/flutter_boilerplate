import 'package:flutter/material.dart';

typedef AppLocalizerBuilder = Function();

class AppLocalizer extends StatefulWidget {
  final AppLocalizerBuilder builder;

  const AppLocalizer({required this.builder, Key? key}) : super(key: key);

  @override
  State<AppLocalizer> createState() => _AppLocalizerState();
}

class _AppLocalizerState extends State<AppLocalizer> {
  @override
  Widget build(BuildContext context) {
    return widget.builder();
  }
}
