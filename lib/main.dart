import 'package:flutter/material.dart';
import 'Calculator.dart';
import 'notes.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Router App',
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),//set initial route to homepage
        '/calculator': (context) => Calculator(),//define route for calculator page
        '/notes': (context) => notes(),//route for notes page

      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Greetings!!!!!!')),//display appbar with title
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 20.0),
              child: Column(
                children: [
                  Image.network(
                    'https://www.fluentu.com/blog/english/wp-content/uploads/sites/4/2014/01/english-greetings.jpg.webp', //display image
                    width: 300,
                    height: 300,
                  ),
                  SizedBox(height: 10),
                  Text('Welcome to My App',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/calculator'),//navigate to calculator page
              child: Text('Calculator'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/notes'),//navigate to notes page
              child: Text('Notes'),
            ),
          ],
        ),
      ),
    );
  }
}

