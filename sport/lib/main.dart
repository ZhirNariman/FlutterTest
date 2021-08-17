// ignore_for_file: avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sport/Model/hive_sys.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sport/Model/theme_provider.dart';
import 'package:sport/Screens/homescreen.dart';

const String todoBoxName = "teaminfo";

// bool themeSwitch = true;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final document = await getApplicationDocumentsDirectory();
  Hive.init(document.path);
  Hive.registerAdapter(TeamsInfoAdapter());
  await Hive.openBox<TeamsInfo>(todoBoxName);
  Hive.registerAdapter(HistoryAdapter());
  await Hive.openBox<History>('history');
  final settings = await Hive.openBox('settings');
  bool isLightTheme = settings.get('isLightTheme') ?? false;
  print(isLightTheme);
  runApp(ChangeNotifierProvider(create: (_) => ThemeProvider(isLightTheme: isLightTheme),
  child: MyApp())
    );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return MyHomePage(themeProvider: themeProvider,
      
    );
  }
}


class MyHomePage extends StatefulWidget with WidgetsBindingObserver {
  const MyHomePage({Key? key, required this.themeProvider}) : super(key: key);
  final ThemeProvider themeProvider;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
   Box<TeamsInfo>? todoBox;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController detailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    todoBox = Hive.box<TeamsInfo>(todoBoxName);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: widget.themeProvider.themeData(),
      home: const HomeScreen(),
    );
  }
}
