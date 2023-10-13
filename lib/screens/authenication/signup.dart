import 'dart:io';

import 'package:derbyjo/screens/authenication/login.dart';
import 'package:derbyjo/screens/home/home.dart';
import 'package:derbyjo/services/auth.dart';
import 'package:derbyjo/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

final TextEditingController _emailcontroller = TextEditingController();
final TextEditingController _passwordcontroller = TextEditingController();
final TextEditingController _usernamecontroller = TextEditingController();
final TextEditingController _phonecontroller = TextEditingController();

final TextEditingController _agecontroller = TextEditingController();
final TextEditingController _fullNameController = TextEditingController();
String genderValue = "male";
String cityValue = "Amman";

final AuthService _auth = AuthService();

class SignupPage1 extends StatefulWidget {
  const SignupPage1({super.key});

  @override
  State<SignupPage1> createState() => _SignupPage1State();
}

class _SignupPage1State extends State<SignupPage1> {
  final _formKey = GlobalKey<FormState>();

  String error = '';

  bool _isObsecure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: mBackgroundColor,
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.fromLTRB(85, 0, 0, 0),
              child: Text(
                signup,
                style: TextStyle(
                    fontSize: 25,
                    color: mBlackColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              width: 50,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 0, 3),
              child: Image.asset("images/Rectangle 2.png"),
            )
          ],
        ),
        elevation: 0,
        backgroundColor: mBackgroundColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: mBlackColor,
          ),
        ),
      ),
      //),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 15,
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 260, 10),
                      child: Text(
                        emailA,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    TextFormField(
                      validator: (value) =>
                          value!.isEmpty ? "Enter an Email! " : null,
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        ),
                        labelText: emailA,
                        labelStyle: TextStyle(
                          color: Colors.redAccent,
                        ),
                        isDense: true,
                        prefixIcon: Icon(
                          Icons.email_rounded,
                          color: Colors.redAccent,
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      onChanged: (val) {
                        _emailcontroller.text = val;
                      },
                      onSaved: (value) {
                        _emailcontroller.text = value!;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 280, 10),
                      child: Text(
                        userN,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        ),
                        labelText: userN,
                        labelStyle: TextStyle(
                          color: Colors.redAccent,
                        ),
                        isDense: true,
                        prefixIcon: Icon(
                          Icons.person_2_sharp,
                          color: Colors.redAccent,
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) =>
                          value!.isEmpty ? "Enter UserName! " : null,
                      onChanged: (val) {
                        _usernamecontroller.text = val;
                      },
                      onSaved: (value) {
                        _usernamecontroller.text = value!;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 250, 10),
                      child: Text(
                        mobileN,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        ),
                        labelText: mobileN,
                        labelStyle: TextStyle(
                          color: Colors.redAccent,
                        ),
                        isDense: true,
                        prefixIcon: Icon(
                          Icons.phone,
                          color: Colors.redAccent,
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) =>
                          value!.length < 10 ? "Must be 10 length " : null,
                      onChanged: (val) {
                        _phonecontroller.text = val;
                      },
                      onSaved: (value) {
                        _phonecontroller.text = value!;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 280, 10),
                      child: Text(
                        pass,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    TextFormField(
                      validator: (value) =>
                          value!.length < 8 ? "Must be 8 length " : null,
                      obscureText: _isObsecure,
                      decoration: InputDecoration(
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        ),
                        labelText: pass,
                        labelStyle: const TextStyle(
                          color: Colors.redAccent,
                        ),
                        isDense: true,
                        prefixIcon: const Icon(
                          Icons.lock,
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
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.visiblePassword,
                      onChanged: (val) {
                        _passwordcontroller.text = val;
                      },
                      onSaved: (value) {
                        _passwordcontroller.text = value!;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 220, 10),
                      child: Text(
                        "Confirm $pass",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    TextFormField(
                      obscureText: _isObsecure,
                      decoration: InputDecoration(
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.0),
                          ),
                        ),
                        labelText: pass,
                        labelStyle: const TextStyle(
                          color: Colors.redAccent,
                        ),
                        isDense: true,
                        prefixIcon: const Icon(
                          Icons.lock,
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
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.visiblePassword,
                      validator: (value) =>
                          value!.length < 8 ? "Must be 8 length " : null,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: SizedBox(
                          height: 45,
                          width: 300,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  mBackgroundColor),
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(mRedColor),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              ),
                            ),
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                              }
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignupPage2()),
                              );
                            },
                            child: const Text(
                              "Next",
                              style: TextStyle(fontSize: 20),
                            ),
                          )),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(160, 0, 0, 12),
                  child: Row(
                    children: [
                      const Text(haveA,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          )),
                      TextButton(
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 13),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Login()),
                          );
                        },
                        child: const Text(
                          signin,
                          style: TextStyle(color: mRedColor),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Text(
                  error,
                  style: const TextStyle(color: mRedColor, fontSize: 12),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SignupPage2 extends StatefulWidget {
  const SignupPage2({super.key});

  @override
  State<SignupPage2> createState() => _SignupPage2State();
}

class _SignupPage2State extends State<SignupPage2> {
  var genderList = ["male", "female"];
  var CityList = [
    "Amman",
    "Irbid",
    "Ajloun",
    "Jerash",
    "Mafraq",
    "   Salt",
    "Zarqa",
    "Madaba",
    "Al Karak",
    "Tafilah",
    "   Ma'an",
    "Aqaba"
  ];

  final _formKeyFullName = GlobalKey<FormState>();
  final _formKeyAge = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: mBackgroundColor,
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.fromLTRB(85, 0, 0, 0),
              child: Text(
                signup,
                style: TextStyle(
                    fontSize: 25,
                    color: mBlackColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              width: 50,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 0, 3),
              child: Image.asset("images/Rectangle 2.png"),
            )
          ],
        ),
        elevation: 0,
        backgroundColor: mBackgroundColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: mBlackColor,
          ),
        ),
      ),
      //),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 5),
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 280, 10),
              child: Text(
                "Full Name",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            Form(
              key: _formKeyFullName,
              child: TextFormField(
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                  labelText: "Enter yore full name",
                  labelStyle: TextStyle(
                    color: Colors.redAccent,
                  ),
                  isDense: true,
                  prefixIcon: Icon(
                    Icons.person_2_sharp,
                    color: Colors.redAccent,
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) =>
                    value!.isEmpty ? "Enter yore full name! " : null,
                onChanged: (val) {
                  _fullNameController.text = val;
                },
                onSaved: (value) {
                  _fullNameController.text = value!;
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            //Playground name(1)

            //SizedBox
            const SizedBox(
              height: 15,
            ),

            //SizedBox
            const SizedBox(
              height: 20,
            ),

            //Playground Price(4)
            Form(
              key: _formKeyAge,
              child: TextFormField(
                keyboardType: TextInputType.number,
                style: const TextStyle(),
                textAlign: TextAlign.start,
                textDirection: TextDirection.ltr,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    labelText: 'Age',
                    isDense: true,
                    labelStyle: const TextStyle(
                      color: Colors.redAccent,
                    ),
                    hintText: 'Enter Your Age',
                    hintStyle: const TextStyle(fontWeight: FontWeight.bold),
                    hintTextDirection: TextDirection.ltr,
                    icon: Icon(
                      Icons.numbers_outlined,
                      color: Colors.redAccent,
                    )),
                onChanged: (String value) {
                  setState(() {
                    _agecontroller.text = value;
                  });
                },
                validator: (value) {
                  if (int.parse(value!) < 14) {
                    return "Should Age be greather than 14 year";
                  }
                  return null;
                },
                onSaved: (value) {
                  _agecontroller.text = value!;
                },
              ),
            ),
            //SizedBox
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 20),
                    child: Text(
                      "Gender ",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 100, vertical: 0),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 232, 232, 232),
                          borderRadius: BorderRadius.circular(10)),
                      child: DropdownButton<String>(
                        value: genderValue,
                        onChanged: (String? value) {
                          setState(() {
                            genderValue = value!;
                          });
                        },
                        items: genderList.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                      )),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 40),
                    child: Text(
                      "City ",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 95, vertical: 0),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 232, 232, 232),
                          borderRadius: BorderRadius.circular(10)),
                      child: DropdownButton(
                        value: cityValue,
                        onChanged: (String? value) {
                          setState(() {
                            cityValue = value!;
                          });
                        },
                        items: CityList.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: SizedBox(
                  height: 45,
                  width: 300,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(mBackgroundColor),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(mRedColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                    onPressed: () async {
                      if (_formKeyFullName.currentState!.validate() &&
                          _formKeyAge.currentState!.validate()) {
                        _formKeyFullName.currentState!.save();
                        _formKeyAge.currentState!.save();

                        _auth.userSignup(
                            email: _emailcontroller.text,
                            password: _passwordcontroller.text,
                            age: _agecontroller.text,
                            fullName: _fullNameController.text,
                            username: _usernamecontroller.text,
                            gender: genderValue,
                            phoneNo: _phonecontroller.text);

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Home()),
                        );
                      }
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(fontSize: 20),
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(160, 0, 0, 12),
              child: Row(
                children: [
                  const Text(haveA,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      )),
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 13),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Login()),
                      );
                    },
                    child: const Text(
                      signin,
                      style: TextStyle(color: mRedColor),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
