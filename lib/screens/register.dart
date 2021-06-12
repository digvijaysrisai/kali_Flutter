import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = new RegExp(p);

bool obserText = true;

class _RegisterState extends State<Register> {


  void validation() {
    final FormState? _form = _formkey.currentState;
    if(_form!.validate()) {
      print('YES');
    }
    else {
      print('NO');
    }
  }


  final userNameValidator = MultiValidator([
    RequiredValidator(errorText: 'Please Enter Username'),
    MinLengthValidator(7, errorText: 'UserName should be atleast of length 7'),
  ]);

  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'password is required'),
    MinLengthValidator(8, errorText: 'password must be at least 8 digits long'),
    PatternValidator(r'(?=.*?[#?!@$%^&*-])', errorText: 'passwords must have at least one special character')
  ]);

  final phoneNumberValidator = MultiValidator([
    RequiredValidator(errorText: 'Please Fill Phone Number'),
    MinLengthValidator(10, errorText: 'Phone Number should be atleast of length 10'),
    MaxLengthValidator(12, errorText: 'Phone Number should be atmost of length 12'),
  ]);

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   child: Text('hello',textDirection: TextDirection.ltr,),
    // );

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
                    'Register',
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
                              return 'Please enter UserName';
                            }
                            else if(value!.length < 7) {
                              return 'UserName should be greater than 7 characters';
                            }
                            return '';
                          },
                          // validator: userNameValidator,
                          decoration: InputDecoration(
                            icon: Icon(Icons.person),
                            hintText: 'Username',
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
                          // validator: EmailValidator(errorText: 'Enter a valid Email ID'),
                          validator: (value) {
                            if(value == '') {
                              return 'Enter your Email Id';
                            }
                            else if(!regExp.hasMatch(value!)) {
                              return 'Email Id is invalid';
                            }
                            return '';
                          },
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
                          // validator: passwordValidator,
                          validator: (value) {
                            if(value == ''){
                              return 'Enter your Password';
                            }
                            else if(value!.length < 8) {
                              return 'Password should be greater than 8 characters';
                            }
                            return '';
                          },
                          obscureText: obserText,
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
                          height: 5,
                        ),
                        TextFormField(
                          // validator: phoneNumberValidator,
                          validator: (value) {
                            if(value == '') {
                              return 'Fill your Phone Number';
                            }
                            else if (value!.length < 10) {
                              return 'Phone Number should be atleast of 10 digits';
                            }
                            else if (value.length > 12) {
                              return 'Phone Number should be atmost of 12 digits';
                            }
                          },
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            icon: Icon(Icons.phone),
                            hintText: 'Phone Number',
                            hintStyle: TextStyle(
                              color: Colors.black38,
                            ),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 125,
                          child: RaisedButton(
                            color: Colors.grey,
                            child: Text('Register'),
                            onPressed: () {
                              validation();
                            },
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          child: Row(
                            children: <Widget>[
                              Text('Have an account?  '),
                              GestureDetector(
                                child: Text(
                                  'Login',
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
