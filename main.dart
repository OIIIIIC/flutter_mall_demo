import 'package:flutter/material.dart';

import 'TabBarPage.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    routes: {
      '/': (context) => const TabsCase(),
    },
  ));
}
