import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Industrial Cylinder Control Robot',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late String serverIP = '';

  Future<void> _getServerIP() async {
    final response = await http.get(Uri.parse('YOUR_BACKEND_API_URL')); // Replace with your API URL
    if (response.statusCode == 200) {
      setState(() {
        serverIP = response.body;
      });
    }
  }

  // Rest of your _toggleRelay and _checkProximity methods...

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Industrial Hydraulic Cylinder Control Robot'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => _getServerIP(),
              child: Text('Get Server IP'),
            ),
            Text('Server IP: $serverIP'),
            // Rest of your UI elements...
          ],
        ),
      ),
    );
  }
}
