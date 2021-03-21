import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool onChange = false;
  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState.validate()) {
      setState(() {
        onChange = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushReplacementNamed(context, '/home');
      setState(() {
        onChange = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: "Login".text.black.bold.make(),
          centerTitle: true,
          backgroundColor: Vx.white,
          elevation: 0,
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/login.png",
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "Welcome $name",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 32.0),
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "Enter username",
                            labelText: "Username",
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Username cannot be empty!";
                            } else {
                              return null;
                            }
                          },
                          onChanged: (value) {
                            setState(() {
                              name = value;
                            });
                          },
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: "Enter password",
                            labelText: "Password",
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Password cannot be empty!";
                            } else if (value.length < 6) {
                              return "Password length must be atleast 6!";
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        Material(
                          color: Colors.deepPurpleAccent,
                          borderRadius:
                              BorderRadius.circular(onChange ? 50 : 10),
                          child: InkWell(
                            onTap: () => moveToHome(context),
                            child: AnimatedContainer(
                              duration: Duration(seconds: 1),
                              width: onChange ? 50 : 150,
                              height: 50,
                              alignment: Alignment.center,
                              child: onChange
                                  ? Icon(
                                      Icons.done,
                                      color: Colors.white,
                                    )
                                  : Text(
                                      'Login',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                            ),
                          ),
                        )
                        // ElevatedButton(
                        //   child: Text("Login"),
                        //   style: TextButton.styleFrom(minimumSize: Size(140, 50)),
                        //   onPressed: () {
                        //     Navigator.pushNamed(context, '/home');
                        //   },
                        // )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
