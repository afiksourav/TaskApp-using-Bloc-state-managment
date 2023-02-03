import 'package:flutter/material.dart';
import 'package:taskapp/screens/complated_task_screen.dart';
import 'package:taskapp/screens/favorite_task_screen.dart';
import 'package:taskapp/screens/pending_screen.dart';

import 'add_task.dart';
import 'my_drawer.dart';

class TabsScreen extends StatefulWidget {
  TabsScreen({super.key});

  static const id = 'tabs_screen';

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, dynamic>> _pageDetails = [
    {'pageName': const PendingTasksScreen(), 'title': 'Pending Tasks'},
    {'pageName': const CompletedTasksScreen(), 'title': 'Completed Tasks'},
    {'pageName': const FavoriteTasksScreen(), 'title': 'Favorite Tasks'}
  ];

  var _seletedPageIndex = 0;

  //add task function
  void _addTask(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: AddTaskScreen(),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pageDetails[_seletedPageIndex]['title']),
        actions: [
          IconButton(
            onPressed: () => _addTask(context),
            icon: const Icon(Icons.add),
          )
        ],
      ),
      drawer: MyDrawer(),
      body: _pageDetails[_seletedPageIndex]['pageName'],
      floatingActionButton: _seletedPageIndex == 0
          ? FloatingActionButton(
              onPressed: () => _addTask(context),
              tooltip: 'Add Task',
              child: const Icon(Icons.add),
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _seletedPageIndex,
        onTap: (index) {
          setState(() {
            _seletedPageIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.incomplete_circle_sharp),
              label: 'Pending Tasks'),
          BottomNavigationBarItem(
              icon: Icon(Icons.done), label: 'Completed Tasks Task'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorite Task')
        ],
      ),
    );
  }
}
