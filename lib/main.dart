import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:my_app/my_app.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var docsDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(docsDir.path);
  runApp(const MyApp());
}
