import 'package:excel_mananger/viewmodels/login.viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late var textEdittingController = TextEditingController();

  @override
  void initState() {
    textEdittingController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        body: ViewModelBuilder<LoginViewModel>.reactive(
          onModelReady: (model) => model.init(),
          builder: (BuildContext context, LoginViewModel model, Widget? child) {
            if (model.isLoginSuccess) {
              print("login screen success");
            }
            return Center(
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(200)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Sign in'),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 250,
                      child: TextFormField(
                        controller: textEdittingController,
                        decoration: InputDecoration(
                            hintText: "Phone",
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.black,
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          model.loginEvent(textEdittingController.text);
                        },
                        child: Text('Sign in '))
                  ],
                ),
              ),
            );
          },
          viewModelBuilder: () => LoginViewModel(),
        ));
  }
}
