// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'story_brain.dart';

void main() {
  runApp(const Destini());
}

class Destini extends StatelessWidget {
  const Destini({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: ThemeData.dark(), home: StoryPage());
  }
}

class StoryPage extends StatefulWidget {
  const StoryPage({Key? key}) : super(key: key);

  @override
  State<StoryPage> createState() => _StoryPageState();
}

StoryBrain storyBrain = StoryBrain();

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/background.png'), fit: BoxFit.cover)),
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 12,
                child: Center(
                    child: Text(storyBrain.getStory(),
                        style: TextStyle(fontSize: 20.0, color: Colors.white))),
              ),
              Expanded(
                flex: 2,
                child: TextButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.green)),
                  child: Text(storyBrain.getChoice1(),
                      style: TextStyle(fontSize: 25.0, color: Colors.white)),
                  onPressed: () {
                    setState(() {
                      storyBrain.nextStory(1);
                    });
                  },
                ),
              ),
              Expanded(
                flex: 2,
                child:TextButton(
                  style: ButtonStyle(
                    backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.red)
                  ),
                  child: Text(storyBrain.getChoice2(),
                    style: TextStyle(fontSize: 25.0,color: Colors.white)),
                  onPressed: (){
                    setState(() {
                      storyBrain.nextStory(2);
                    });
                  },
                )
              ),
              SizedBox(
                height: 20.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
