import 'package:flutter/material.dart';
import 'package:flutter_pagination_example/src/app.dart';
import 'package:flutter_pagination_example/src/common/di/dependency_injection.dart';
void main() {
  configureDependencies(environment: Env.dev.name);
  runApp(const MyApp());
}

