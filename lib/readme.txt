import 'package:flutter/material.dart';


class TodoHomePage extends StatefulWidget {
  const TodoHomePage({super.key});

  @override
  State<TodoHomePage> createState() => _TodoHomePageState();
}

class _TodoHomePageState extends State<TodoHomePage> {
  final TextEditingController _controller = TextEditingController();

  // ✅ Task list (each task is a map with 'title' and 'done')
  List<Map<String, dynamic>> _tasks = [];

  // Add new task
  void _addTask() {
    if (_controller.text.trim().isEmpty) return;
    setState(() {
      _tasks.add({"title": _controller.text, "done": false});
      _controller.clear();
    });
  }

  // Toggle task (done/undone)
  void _toggleTask(int index) {
    setState(() {
      _tasks[index]["done"] = !_tasks[index]["done"];
    });
  }

  // Delete task
  void _deleteTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Todo List"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Input box + add button
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter a task",
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _addTask,
                  child: const Text("Add"),
                ),
              ],
            ),
          ),

          // Show task list
          Expanded(
            child: ListView.builder(
              itemCount: _tasks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Checkbox(
                    value: _tasks[index]["done"],
                    onChanged: (value) {
                      _toggleTask(index);
                    },
                  ),
                  title: Text(
                    _tasks[index]["title"],
                    style: TextStyle(
                      decoration: _tasks[index]["done"]
                          ? TextDecoration.lineThrough
                          : null,
                    ),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _deleteTask(index),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
