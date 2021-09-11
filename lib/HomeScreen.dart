import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:log_in_app/login.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    getCurrentUserInfo();
    // TODO: implement initState
    super.initState();
  }
  final _auth = FirebaseAuth.instance;
  dynamic user;
 var userEmail;
  var userPhoneNumber;

  void getCurrentUserInfo() async {
    user = await _auth.currentUser;
    userEmail = user.email;
    userPhoneNumber = user.uid.toString();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('HomeScreen',style: TextStyle(color: Colors.blue),),
             actions: [
               IconButton(
                 icon: Icon(Icons.exit_to_app),
                 onPressed: () => Navigator.of(context).push(
                     MaterialPageRoute(builder: (_) => LoginScreen())),
               )
             ],
    ),
      body: Center(
        child: Column(
          children: [
            Text(userEmail),
            Text(userPhoneNumber),


          ],
        ),
      ),

    );
  }
}
