
class Players {
   String? email;
  String? username;
  String? password;
  String? fullName;
  String? phoneNo;
  String? age;
  String? gender;
  String? uId;


  Players(
      { this.email,
       this.username,
       this.password,
       this.fullName,
       this.phoneNo,
       this.age,
       this.gender,
       this.uId,
});
Players.formJson(Map<String, dynamic>? json) {
    username = json?['username'];
    email = json?['email'];
    fullName = json?['fullName'];
    phoneNo = json?['phoneNo'];
    password= json?['password'];
    age=json?['age'];
    gender =json?['gender'];
    uId = json?['uId'];
  }



   

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'email': email,
      'fullName': fullName,
      'phoneNo': phoneNo,
      'password':password,
      'age':age,
      'gender':gender,
      'uId': uId,
    };
  }

}

