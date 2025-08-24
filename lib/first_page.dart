import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int counter=0;

  void incrementCounter(){
    setState(() {
      counter++;    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: Text("AppBar"),
        centerTitle: true,
      ),
      drawer: Drawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("You have pushed the button this many times"),

            //counter value
            Text(
              counter.toString(),
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(height: 20,),

            ElevatedButton(onPressed: incrementCounter, child: const Text("Increment"))
          ],
        ),
      ),
    );
  }
}