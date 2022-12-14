import 'package:flutter/material.dart';
import 'package:flutter_app/screens/survey/intro.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weme Wellbeing'),
        leading:  const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/orient_logo.png'),
          ),
        ),
      ),
      body: Center(
        child: ElevatedButton(child: Text('Take the survey'), onPressed: (){Navigator.pushNamed(context, IntroPage.routeName);},),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){}, child: Icon(Icons.add),),
    );
  }
}
