import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:getit_issue/injectable.init.dart';
import 'package:getit_issue/repo.dart';
import 'package:lib_common/environments.di.dart';
import 'package:lib_common/object_manager.service.dart';
import 'package:lib_common/secure_storage.service.dart';
import 'package:get_it/get_it.dart';



void main() async {
  registerLibDependencies(getIt);
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('GetIt'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                child: Text('Call a method on injected service'),
                onPressed: () => getIt<ObjectManager>().saveData(),
              ),
              Text(
                getIt<ObjectManager>().hello(),
              ),
              Text(
                getIt<Repo>().hello(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
