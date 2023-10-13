import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:derbyjo/screens/update_profile.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import '../models/player.dart';
import '../services/auth.dart';
import '../utils/constants.dart';
import '../widgets/profile_data.dart';
import '../widgets/profile_menu.dart';
import 'authenication/authenication.dart';
import 'authenication/get_started.dart';

class Profile extends StatefulWidget {
  const Profile({
    super.key,
  });

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String imageUrl = '';

  Future<void> _getImageUrl() async {
    Reference storageReference =
        FirebaseStorage.instance.ref().child('image.jpg');

    try {
      String downloadURL = await storageReference.getDownloadURL();
      setState(() {
        imageUrl = downloadURL;
      });
    } catch (error) {
      // Handle error while fetching the image URL
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();

    //final user = _auth.getData();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
            _auth.signOut();
          },
          icon: const Icon(LineAwesomeIcons.angle_left),
        ),
        title: const Padding(
          padding: EdgeInsets.only(left: 100.0),
          child: Text(
            "Profile",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: mRedColor,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: const Image(
                        image: AssetImage('images/pro.png'),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: mRedColor.withOpacity(0.8),
                      ),
                      child: const Icon(
                        LineAwesomeIcons.alternate_pencil,
                        size: 20,
                        color: mBackgroundColor,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const ProfileData(),
              /*ElevatedButton(onPressed: (){

        printData();
        
      }, child: Text("data")),
    
            */
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UpdateProfile(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: mRedColor,
                    side: BorderSide.none,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text(
                    'Edit Profile',
                    style: TextStyle(color: mBackgroundColor),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              ProfileMenu(
                title: "Settings",
                icon: LineAwesomeIcons.cog,
                onpress: () {},
              ),
              ProfileMenu(
                title: "User Management",
                icon: LineAwesomeIcons.user_check,
                onpress: () {},
              ),
              const Divider(
                color: Colors.grey,
              ),
              const SizedBox(
                height: 10,
              ),
              ProfileMenu(
                title: "Information",
                icon: LineAwesomeIcons.info,
                onpress: () {},
              ),
              ProfileMenu(
                title: "Logout",
                icon: LineAwesomeIcons.alternate_sign_out,
                endIcon: false,
                onpress: () async {
                  _auth.signOut();
                  setState(() {
                    showSignin = !showSignin;
                  });
// ignore: use_build_context_synchronously
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GetStart(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*Future<String?> getData()async{
  DocumentSnapshot<Map<String,dynamic>> snapshot=await FirebaseFirestore.instance.collection('users').doc(players.uId).get();
  if(snapshot.exists){ 
    Map<String,dynamic>? playerData=snapshot.data();
    String username=playerData!['username'];
    String email=playerData['email'];
    return username;

   }
return "username";
}

Future<String?> fetchData() async { // Simulating an asynchronous operation that returns a string return
 Future.delayed(Duration(seconds: 2), () {
  return getData();
 }); }


 void printData(){
  fetchData().then((data) {print(data);});
 }
*/