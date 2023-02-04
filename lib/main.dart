// ignore_for_file: library_private_types_in_public_api

import 'package:animated_size_and_fade/animated_size_and_fade.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {

    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage()
    );
  }
}


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late bool toggle;

  @override
  void initState() {
    super.initState();
    toggle = false;
  }

  
  @override
  Widget build(BuildContext context) {

    var toggleButton = Padding(
      padding: const EdgeInsets.all(8.0),
      child: MaterialButton(
        color: Colors.green,
        onPressed: () {
          setState(() {
            toggle = !toggle;
          });
        },
        child: const Text("Toggle",style: TextStyle(color: Colors.white),),
      ),
    );

    var widget1 = Container(
      key: const ValueKey("first"),
      color: Colors.green,
      width: 200.0,
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          "And I promise you I'll never desert you again because after 'Salome' "
          "we'll make another picture and another picture. "
          "You see, this is my life! "
          "It always will be! Nothing else! "
          "Just us, the cameras, and those wonderful people out there in the dark!...",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );

    var widget2 = Container(
      key: const ValueKey("second"),
      color: Colors.red,
      width: 200.0,
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          "I am ready for my closeup."
          ,style: TextStyle(color: Colors.white),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Size and Fade",style: TextStyle(fontSize: 15),),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(height: 100.0),
          toggleButton,
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text("Some text above."),
              const SizedBox(height: 10,),
              AnimatedSizeAndFade(
                fadeDuration: const Duration(milliseconds: 300),
                sizeDuration: const Duration(milliseconds: 600),
                child: toggle ? widget1 : widget2,
              ),
              const SizedBox(height: 10,),
              const Text("Some text below."),
            ],
          ),
        ],
      ),
    );
  }
}