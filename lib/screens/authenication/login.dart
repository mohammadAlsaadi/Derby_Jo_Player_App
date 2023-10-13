import 'package:derbyjo/screens/authenication/signup.dart';
import 'package:derbyjo/screens/home/home.dart';
import 'package:derbyjo/services/auth.dart';
import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class Login extends StatefulWidget {
  const Login({
    super.key,
  });

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();

  String error = '';

  bool _isObsecure = true;
  bool _valuefirst = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset('images/Rectangle 1.png'),
              const Text(signin),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  withh,
                  style: TextStyle(fontSize: 12),
                ),
              ),
              SizedBox(
                width: 350,
                child: TextFormField(
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      labelText: eEmail,
                      labelStyle: const TextStyle(
                        color: Colors.redAccent,
                      ),
                      isDense: true,
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: Colors.redAccent,
                      ),
                      hintText: hEmail),
                  keyboardType: TextInputType.emailAddress,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  autocorrect: false,
                  textCapitalization: TextCapitalization.none,
                  onChanged: (val) {
                    setState(() {
                      email = val;
                    });
                  },
                  onSaved: (value) {
                    email = value!;
                  },
                  validator: (value) {
                    if (value == null ||
                        value.trim().isEmpty ||
                        !value.contains('@')) {
                      return "Please Enter a valid Email address";
                    }
                    return null;
                  }, //(value) =>
                  //value!.isEmpty ? "Enter an Email! " : null,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: SizedBox(
                  width: 350,
                  child: TextFormField(
                      obscureText: _isObsecure,
                      decoration: InputDecoration(
                          hoverColor: Colors.red,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          labelText: ePassword,
                          labelStyle: const TextStyle(
                            color: Colors.redAccent,
                          ),
                          isDense: true,
                          prefixIcon: const Icon(
                            Icons.key_rounded,
                            color: Colors.redAccent,
                          ),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _isObsecure = !_isObsecure;
                                });
                              },
                              icon: Icon(
                                _isObsecure
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.redAccent,
                              )),
                          hintText: hPassword),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.visiblePassword,
                      onChanged: (val) {
                        setState(() {
                          password = val;
                        });
                      },
                      onSaved: (value) {
                        password = value!;
                      },
                      validator: (value) {
                        if (value == null || value.trim().length < 8) {
                          return "Password must be 8 char long";
                        }
                        return null;
                      } //(value) =>
                      //value!.length < 8 ? "Must be 8 length " : null,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 27.0),
                child: Row(
                  children: [
                    Checkbox(
                      checkColor: mBackgroundColor,
                      activeColor: mRedColor,
                      value: _valuefirst,
                      onChanged: (value) {
                        setState(() {
                          _valuefirst = value!;
                        });
                      },
                    ),
                    const Text(
                      'Remember me',
                      style: TextStyle(fontSize: 14),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 98, bottom: 8),
                      child: Text(
                        'Forget your password?',
                        style: TextStyle(fontSize: 11),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 29.0),
                child: SizedBox(
                    width: 350,
                    height: 50,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(mBackgroundColor),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(mRedColor),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          _auth.userLogin(email: email, password: password);

                          final snackBar = SnackBar(
                            content: Text('Successfull Login !'),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Home()),
                          );
                        }
                      },
                      child: const Text(
                        login,
                        style: TextStyle(fontSize: 20),
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 330),
                child: Row(
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 14),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignupPage1()),
                        );
                      },
                      child: const Text(
                        "$signup?",
                        style: TextStyle(
                          color: mRedColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 7, bottom: 7),
                child: Text(
                  'or',
                  style: TextStyle(fontSize: 13),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 95, right: 8),
                    child: GestureDetector(
                      child: Column(
                        children: [Image.asset('images/Facebook.png')],
                      ),
                      onTap: () async {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () async {
                        await _auth.signInWithGoogle();
                      },
                      child: Column(
                        children: [
                          Image.asset('images/Google.png'),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {},
                      child: Column(
                        children: [
                          Image.asset('images/Apple Logo.png'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
