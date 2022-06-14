import 'package:excel_mananger/viewmodels/init.viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class InitScreen extends StatefulWidget {
  const InitScreen({Key? key}) : super(key: key);

  @override
  _InitScreenState createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ViewModelBuilder<InitViewModel>.reactive(
      builder: (BuildContext context, InitViewModel model, Widget? child) {
        return Center(
          child: ElevatedButton(
            onPressed: () {
              model.logout();
            },
            child: Text('Logout'),
          ),
        );
      },
      viewModelBuilder: () => InitViewModel(),
    ));
  }
}
