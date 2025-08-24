import 'package:flutter/material.dart';

class TodoTry extends StatefulWidget {
  const TodoTry({super.key});

  @override
  State<TodoTry> createState() => _TodoTryState();
}

class _TodoTryState extends State<TodoTry> {
  TextEditingController mycontroller = TextEditingController();
  void addtodo(){
    print(mycontroller.text);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: mycontroller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter your Todo",
              ),
            ),
          ),
          SizedBox(height: 20,),
          ElevatedButton(onPressed:addtodo, child: Text("Tap")),
        ],
      ),),
    );
  }
}