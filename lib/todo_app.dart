import 'package:flutter/material.dart';

class todo_apps extends StatefulWidget {
  const todo_apps({super.key});

  @override
  State<todo_apps> createState() => _todo_appsState();
}

class _todo_appsState extends State<todo_apps> {
  final TextEditingController controller = TextEditingController();
  List<Map<String, dynamic>> tasks = [];

  void addtask() {
    if (controller.text.trim().isEmpty) return;
    setState(() {
      tasks.add({"title": controller.text, "done": false});
      controller.clear();
    });
  }

  void toggletask(int index) {
    setState(() {
      tasks[index]["done"] = !tasks[index]["done"];
    });
  }

  void deletetask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
      backgroundColor: Color.fromARGB(255, 244, 246, 246),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(223, 37, 37, 37),
        title: Text(
          "Todo_App",
          style: TextStyle(color: Colors.white,fontSize: 30, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        controller: controller,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Enter Your Task"),
                      ),
                    ),
                  )),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: addtask,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Icon(
                        Icons.add,
                        color: Colors.black,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[300],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(child: ListView.builder(itemCount: tasks.length, itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(13.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(107, 65, 62, 62),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  leading: Checkbox(
                      value: tasks[index]["done"],
                      onChanged: (value) {
                        toggletask(index);
                      }),
                  title: Text(
                    tasks[index]["title"],
                    style: TextStyle(
                      decoration:
                          tasks[index]["done"] ? TextDecoration.lineThrough : null,
                    ),
                  ),
                  trailing: IconButton(
                      onPressed: () {
                        deletetask(index);
                      },
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red[300],
                      )),
                ),
              ),
            );
          }))
        ],
      ),
    );
  }
}
