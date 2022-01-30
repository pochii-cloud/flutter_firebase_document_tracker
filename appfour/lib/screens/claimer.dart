import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Claimer extends StatefulWidget {
  const Claimer({Key? key}) : super(key: key);

  @override
  _ClaimerState createState() => _ClaimerState();
}

class _ClaimerState extends State<Claimer> {
  final _formkey = GlobalKey<FormState>();

  // ignore: non_constant_identifier_names, unnecessary_new
  final UsernameController = new TextEditingController();

  // ignore: non_constant_identifier_names, unnecessary_new
  final MessageController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    final UsernameField = TextFormField(
      autofocus: false,
      controller: UsernameController,
      keyboardType: TextInputType.name,
      onSaved: (value) {
        UsernameController.text = value!;
      },
      textInputAction: TextInputAction.next,
      // ignore: prefer_const_constructors
      decoration: InputDecoration(
          label: const Text('enter username'),
          prefixIcon: const Icon(Icons.account_circle),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );
    // ignore: unused_local_variable, non_constant_identifier_names
    final MessageField = TextFormField(
      autofocus: false,
      controller: MessageController,
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          label: const Text('type claim'),
          // ignore: prefer_const_constructors
          prefixIcon: Icon(Icons.message),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );
    // ignore: non_constant_identifier_names
    final SubmitButton = Material(
      elevation: 5,
      color: Colors.redAccent,
      borderRadius: BorderRadius.circular(10),
      child: MaterialButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('claim received thankyou!!')));
        },
        // ignore: prefer_const_constructors
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width / 2,
        child: const Text(
          'submit',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Publish a claim',
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
              Form(
                key: _formkey,
                child: Container(
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        'Write a claim of not less than 50 words \n specifying your lost documents and locations lost',
                        style: TextStyle(
                            fontSize: 23.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      UsernameField,
                      // ignore: sized_box_for_whitespace
                      const SizedBox(
                        height: 20,
                      ),
                      MessageField,
                      const SizedBox(
                        height: 20,
                      ),
                      SubmitButton
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
