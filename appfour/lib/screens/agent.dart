import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Agentclass extends StatefulWidget {
  const Agentclass({Key? key}) : super(key: key);

  @override
  _AgentclassState createState() => _AgentclassState();
}

class _AgentclassState extends State<Agentclass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Agent Screen',
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    // ignore: prefer_const_constructors
                    Padding(padding: EdgeInsets.only(left: 25)),
                    const Text(
                      'Upload a document',
                      style: TextStyle(
                          fontSize: 23.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 200,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MaterialButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text('upload feature coming soon')));
                          },
                          elevation: 5,
                          padding: const EdgeInsets.all(12),
                          color: Colors.redAccent,
                          child: const Text(
                            'Upload document',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        MaterialButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text('upload feature coming soon')));
                          },
                          elevation: 5,
                          padding: const EdgeInsets.all(12),
                          color: Colors.redAccent,
                          child: const Text(
                            'Upload picture',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
