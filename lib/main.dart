import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_riverpod/view/search_screen_view.dart';

void main() {
  runApp(
    const ProviderScope(child: MaterialApp(home: SearchScreen())),
  );
}
