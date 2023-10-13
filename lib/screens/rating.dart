import 'package:derbyjo/screens/activity.dart';
import 'package:derbyjo/screens/home/home.dart';
import 'package:derbyjo/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../utils/constants.dart';

AuthService _auth = AuthService();

class Rating extends StatefulWidget {
  const Rating({super.key});

  @override
  State<Rating> createState() => _RatingState();
}

class _RatingState extends State<Rating> {
  double rating = 0;
  final TextEditingController _Commentcontroller = TextEditingController();
  final _formKeyComment = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(85, 0, 0, 0),
              child: Text(
                "Rating",
                style: TextStyle(
                    fontSize: 25,
                    color: mBlackColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 200, top: 20),
                child: Text(
                  "Rate The stadium :",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: RatingBar.builder(
                  initialRating: rating,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: false,
                  itemCount: 5,
                  itemSize: 40.0,
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (newRating) {
                    setState(() {
                      rating = newRating;
                    });
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 120, right: 200),
                child: Text("Add your comment here :",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: Form(
                  key: _formKeyComment,
                  child: TextFormField(
                    validator: (value) =>
                        value!.isEmpty ? "Enter your Comment " : null,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      ),
                      labelText: "Comment",
                      isDense: true,
                      prefixIcon: Icon(Icons.email_rounded),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    onChanged: (val) {
                      _Commentcontroller.text = val;
                    },
                    onSaved: (value) {
                      _Commentcontroller.text = value!;
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 200),
                child: SizedBox(
                    height: 45,
                    width: 125,
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
                        if (_formKeyComment.currentState!.validate()) {
                          _formKeyComment.currentState!.save();

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Home()),
                          );
                          _auth.addComment(comment: _Commentcontroller.text);
                          const snackBar = SnackBar(
                            content: Text('Comment add !'),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      },
                      child: const Text(
                        "Submit",
                        style: TextStyle(fontSize: 20),
                      ),
                    )),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 100, right: 0, left: 15),
                child: Row(
                  children: [
                    Icon(Icons.info_outline_rounded),
                    Padding(
                      padding: EdgeInsets.only(left: 10, top: 5),
                      child: Text(
                          "Your evaluation is very important to us!\n We will always work to improve"),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
