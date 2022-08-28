import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list/presentation/app.dart';
import 'package:todo_list/providers.dart';

import 'data/local/db_client.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBClient.openDataBase();
  initLogger();
  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}
