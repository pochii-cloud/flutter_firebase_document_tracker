import 'package:appfour/models/user_model.dart';
import 'package:appfour/screens/vendor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _auth = FirebaseAuth.instance;

  final _formkey = GlobalKey<FormState>();

  // ignore: unnecessary_new
  final firstNameEditingController = new TextEditingController();
  // ignore: unnecessary_new
  final secondNameEditingController = new TextEditingController();
  // ignore: unnecessary_new
  final emailEditingController = new TextEditingController();
  // ignore: unnecessary_new
  final passwordEditingController = new TextEditingController();
  // ignore: unnecessary_new
  final confirmpasswordEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final firstNameField = TextFormField(
      autofocus: false,
      controller: firstNameEditingController,
      keyboardType: TextInputType.name,
      validator: (value) {
        // ignore: unnecessary_new
        RegExp regex = new RegExp(r'^.{3,}$');

        if (value!.isEmpty) {
          return ("firstname cannot be empty");
        }
        if (!regex.hasMatch(value)) {
          return ('enter valid name (min.6 characters)');
        }
        return null;
      },
      onSaved: (value) {
        firstNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      // ignore: prefer_const_constructors
      decoration: InputDecoration(
          // ignore: prefer_const_constructors
          prefixIcon: Icon(Icons.account_circle),
          // ignore: prefer_const_constructors
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "First Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );
    final secondNameField = TextFormField(
      autofocus: false,
      controller: secondNameEditingController,
      keyboardType: TextInputType.text,
      validator: (value) {
        // ignore: unnecessary_new
        RegExp regex = new RegExp(r'^.{3,}$');

        if (value!.isEmpty) {
          return ("secondname cannot be empty");
        }
        if (!regex.hasMatch(value)) {
          return ('enter valid name (min.6 characters)');
        }
        return null;
      },
      onSaved: (value) {
        secondNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      // ignore: prefer_const_constructors
      decoration: InputDecoration(
          // ignore: prefer_const_constructors
          prefixIcon: Icon(Icons.account_circle),
          // ignore: prefer_const_constructors
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Second Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );
    final emailField = TextFormField(
      autofocus: false,
      controller: emailEditingController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        // ignore: unnecessary_new
        RegExp regex = new RegExp(r'^.{3,}$');

        if (value!.isEmpty) {
          return ("email cannot be empty");
        }
        if (!regex.hasMatch(value)) {
          return ('enter valid email (min.6 characters)');
        }
      },
      onSaved: (value) {
        emailEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      // ignore: prefer_const_constructors
      decoration: InputDecoration(
          // ignore: prefer_const_constructors
          prefixIcon: Icon(Icons.email),
          // ignore: prefer_const_constructors
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "email",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );
    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordEditingController,
      obscureText: true,
      validator: (value) {
        // ignore: unnecessary_new
        RegExp regex = new RegExp(r'^.{3,}$');

        if (value!.isEmpty) {
          return ("password cannot be empty");
        }
        if (!regex.hasMatch(value)) {
          return ('enter valid password(min.6 characters)');
        }
      },
      onSaved: (value) {
        firstNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      // ignore: prefer_const_constructors
      decoration: InputDecoration(
          // ignore: prefer_const_constructors
          prefixIcon: Icon(Icons.vpn_key),
          // ignore: prefer_const_constructors
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );
    final passwordconfirmField = TextFormField(
      autofocus: false,
      controller: firstNameEditingController,
      obscureText: true,

      validator: (value) {
        if (confirmpasswordEditingController.text.length > 6 &&
            passwordEditingController.text != value) {
          return "Password dont match";
        } else {
          return null;
        }
      },
      onSaved: (value) {
        confirmpasswordEditingController.text = value!;
      },
      textInputAction: TextInputAction.done,
      // ignore: prefer_const_constructors
      decoration: InputDecoration(
          // ignore: prefer_const_constructors
          prefixIcon: Icon(Icons.vpn_key),
          // ignore: prefer_const_constructors
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Confirm Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );
    // ignore: non_constant_identifier_names
    final SignUpButton = Material(
      elevation: 5,
      color: Colors.redAccent,
      borderRadius: BorderRadius.circular(10),
      child: MaterialButton(
        onPressed: () {},
        // ignore: prefer_const_constructors
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        child: const Text(
          'Sign Up',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Create Account',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 25.0, color: Colors.white),
        ),
        // ignore: prefer_const_constructors
        backgroundColor: Color(0xff5ac18e),
        elevation: 0,
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Color(0xff5ac18e),
                      Color(0xcc5ac18e),
                      Color(0x995ac18e),
                      Color(0x995ac18e),
                    ])),
                padding: const EdgeInsets.only(top: 30.0),
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(36.0),
                    child: Form(
                      key: _formkey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          firstNameField,
                          const SizedBox(
                            height: 25,
                          ),
                          secondNameField,
                          const SizedBox(
                            height: 25,
                          ),
                          emailField,
                          const SizedBox(
                            height: 25,
                          ),
                          passwordField,
                          const SizedBox(
                            height: 25,
                          ),
                          passwordconfirmField,
                          const SizedBox(
                            height: 15,
                          ),
                          SignUpButton,
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Text("Already have an account?"),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  "login",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.redAccent),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void Signup(String email, String password) async {
    if (_formkey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsToFirestore()})
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }

  postDetailsToFirestore() async {
    //calling our firestore
    //calling our user model
    //sending the values
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();
    //writing all the values

    userModel.email = user!.email;
    userModel.uid = user!.uid;
    userModel.firstName = firstNameEditingController.text;
    userModel.email = secondNameEditingController.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());

    Fluttertoast.showToast(msg: "Account Created Successfully");

  //  Navigator.pushNamedAndRemoveUntil(
  //    (context),
  //    MaterialPageRoute(builder: (context) => const VendorScreen()),
  //    (route) =>false);
  }
}
