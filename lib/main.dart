import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:work_manager/collections/product.dart';
import 'package:isar/isar.dart';
import 'package:workmanager/workmanager.dart';

import 'func.dart';

//Work Manager -> Implements the BackgroundTaskHandler
@pragma('vm:entry-point')
void callbackDispatcher() {
  //
  Workmanager().executeTask((task, inputData) {
    switch (task) {
      case "importData":
        Func()
            .apitoisar(); // calls the function that will import data from the
            // backend api and write it on the isar database
        break;
    }
    return Future.value(true);
  });
}

//Work Manager -> The below code to be executed in the main function
initializeWorkManager() {
  //Initializes the Work Manager
  Workmanager().initialize(
    callbackDispatcher,
  );
  //Registers a task and sets it to run on a regular basis after every 30 minutes.
  //The name of the task is importData, the value you provide when registering the
  //task. It will be passed in the executeTask() function above.
  //task-import is the unique name of the task.
  Workmanager().registerPeriodicTask("task-import", "importData",
      frequency: const Duration(minutes: 30));
}

Future<void> main() async {
  initializeWorkManager();

  //Isar database implementation
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationSupportDirectory();
  if (dir.existsSync()) {
    await Isar.open([ProductSchema]);
    runApp(const MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
