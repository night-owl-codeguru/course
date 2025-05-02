import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const TodoScreen(),
    );
  }
}

class Todo {
  Todo({required this.title})
    : id = const Uuid().v4(),
      createdAt = DateTime.now();

  final String id;
  final String title;
  final DateTime createdAt;
}

enum SortType { name, date }

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final List<Todo> _todos = [];
  final _todoController = TextEditingController();
  bool _isAscending = true;
  SortType _sortType = SortType.date;

  @override
  void dispose() {
    _todoController.dispose();
    super.dispose();
  }

  void _addTodo() {
    if (_todoController.text.trim().isEmpty) return;

    setState(() {
      _todos.add(Todo(title: _todoController.text));
      _todoController.clear();
      _sortTodos();
    });
  }

  void _removeTodo(String id) {
    setState(() {
      _todos.removeWhere((todo) => todo.id == id);
    });
  }

  void _toggleSortOrder() {
    setState(() {
      _isAscending = !_isAscending;
      _sortTodos();
    });
  }

  void _changeSortType(SortType? type) {
    if (type != null) {
      setState(() {
        _sortType = type;
        _sortTodos();
      });
    }
  }

  void _sortTodos() {
    setState(() {
      _todos.sort((a, b) {
        if (_sortType == SortType.name) {
          return _isAscending
              ? a.title.compareTo(b.title)
              : b.title.compareTo(a.title);
        } else {
          return _isAscending
              ? a.createdAt.compareTo(b.createdAt)
              : b.createdAt.compareTo(a.createdAt);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          PopupMenuButton<SortType>(
            initialValue: _sortType,
            onSelected: _changeSortType,
            itemBuilder:
                (context) => [
                  const PopupMenuItem(
                    value: SortType.name,
                    child: Text('Sort by Name'),
                  ),
                  const PopupMenuItem(
                    value: SortType.date,
                    child: Text('Sort by Date'),
                  ),
                ],
            tooltip: 'Sort by',
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Icon(
                    _sortType == SortType.name
                        ? Icons.sort_by_alpha
                        : Icons.access_time,
                  ),
                  const SizedBox(width: 4),
                  const Text('Sort'),
                ],
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              _isAscending ? Icons.arrow_upward : Icons.arrow_downward,
            ),
            onPressed: _toggleSortOrder,
            tooltip: _isAscending ? 'Sort Descending' : 'Sort Ascending',
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _todoController,
                    decoration: const InputDecoration(hintText: 'Enter a todo'),
                  ),
                ),
                IconButton(onPressed: _addTodo, icon: const Icon(Icons.add)),
              ],
            ),
          ),
          const Divider(),
          Expanded(child: TodoList(todos: _todos, onRemoveTodo: _removeTodo)),
        ],
      ),
    );
  }
}

class TodoList extends StatelessWidget {
  const TodoList({super.key, required this.todos, required this.onRemoveTodo});

  final List<Todo> todos;
  final void Function(String id) onRemoveTodo;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        return TodoItem(
          key: ValueKey(todos[index].id),
          todo: todos[index],
          onRemove: () => onRemoveTodo(todos[index].id),
        );
      },
    );
  }
}

class TodoItem extends StatelessWidget {
  const TodoItem({super.key, required this.todo, required this.onRemove});

  final Todo todo;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(todo.id),
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 16),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (_) => onRemove(),
      child: ListTile(
        title: Text(todo.title),
        subtitle: Text(
          'Created: ${todo.createdAt.toString().split('.')[0]}',
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
    );
  }
}
