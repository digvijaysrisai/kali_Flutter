import 'package:flutter/material.dart';
import 'package:kali/screens/register.dart';
import 'package:kali/widgets/button_1.dart';

class Login extends StatefulWidget {

  static String id = 'login';

  @override
  State<Login> createState() => _LoginState();
}

final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = new RegExp(p);

bool obserText = true;

class _LoginState extends State<Login> {


  void validation() {
    final FormState? _form = _formkey.currentState;
    if(_form!.validate()) {
      print('YES');
    }
    else {
      print('NO');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Container(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 75,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value) {
                            if(value == '') {
                              return 'Enter your Email Id';
                            }
                            else if(!regExp.hasMatch(value!)) {
                              return 'Email Id is invalid';
                            }
                            return '';
                          },
                          // validator: EmailValidator(errorText: 'Enter a valid Email ID'),
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            icon: Icon(Icons.email),
                            hintText: 'Email',
                            hintStyle: TextStyle(
                              color: Colors.black38,
                            ),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          obscureText: obserText,
                          validator: (value) {
                            if(value == ''){
                              return 'Enter your Password';
                            }
                            else if(value!.length < 8) {
                              return 'Password should be greater than 8 characters';
                            }
                            return '';
                          },
                          // validator: passwordValidator,
                          decoration: InputDecoration(
                            icon: Icon(Icons.password),
                            hintText: 'Password',
                            hintStyle: TextStyle(
                              color: Colors.black38,
                            ),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                obserText =!obserText;
                                FocusScope.of(context).unfocus();
                              },
                              child: Icon(
                                obserText ? Icons.visibility : Icons.visibility_off,
                                color: Colors.black38,
                              ),
                            ),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Button1(name: 'Login', onPressed: (){validation();}),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          child: Row(
                            children: <Widget>[
                              Text("Don't have an account?  "),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'Register',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
