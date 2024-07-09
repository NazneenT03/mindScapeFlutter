import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GoalCalendarPage(),
    );
  }
}

class GoalCalendarPage extends StatefulWidget {
  @override
  _GoalCalendarPageState createState() => _GoalCalendarPageState();
}

class _GoalCalendarPageState extends State<GoalCalendarPage> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  final Map<DateTime, List<Map<String, String>>> _goals = {};
  final Map<DateTime, bool> _streaks = {};
  final List<String> _categories = ['Work', 'Health', 'Personal', 'Other'];
  String _selectedCategory = 'Work';
  String _goalText = '';
  TextEditingController _goalController = TextEditingController();

  final Map<String, IconData> _categoryIcons = {
    'Work': Icons.work,
    'Health': Icons.health_and_safety,
    'Personal': Icons.person,
    'Other': Icons.category,
  };

  void _showGoalDialog(DateTime selectedDay,
      {String? goalText, String? category}) {
    _goalText = goalText ?? '';
    _goalController.text = _goalText;
    _selectedCategory = category ?? 'Work';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Set Goal for ${DateFormat.yMMMd().format(selectedDay)}'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Select Category',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 8),
              DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
                value: _selectedCategory,
                items: _categories.map((String category) {
                  return DropdownMenuItem(
                    value: category,
                    child: Row(
                      children: [
                        Icon(_categoryIcons[category], color: Colors.black54),
                        SizedBox(width: 8),
                        Text(category),
                      ],
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value!;
                  });
                },
              ),
              SizedBox(height: 16),
              TextField(
                controller: _goalController,
                decoration: InputDecoration(
                  hintText: 'Enter your goal',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  _goalText = value;
                },
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                if (_goalText.isNotEmpty) {
                  setState(() {
                    if (_goals[selectedDay] == null) {
                      _goals[selectedDay] = [];
                    }
                    _goals[selectedDay]!.add({
                      'category': _selectedCategory,
                      'goal': _goalText,
                      'completed': 'false',
                      'time':
                          DateFormat('yMMMd').add_jm().format(DateTime.now())
                    });
                  });
                }
                Navigator.of(context).pop();
              },
              child: Text('Save Goal'),
            ),
          ],
        );
      },
    );
  }

  void _deleteGoal(DateTime date, int index) {
    setState(() {
      _goals[date]!.removeAt(index);
    });
  }

  void _editGoal(DateTime date, int index) {
    final goal = _goals[date]![index];
    if (goal['completed'] == 'true') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Completed goals cannot be edited!')),
      );
      return;
    }
    setState(() {
      _selectedCategory = goal['category']!;
      _goalText = goal['goal']!;
    });
    _showGoalDialog(date, goalText: goal['goal'], category: goal['category']);
    _deleteGoal(date, index);
  }

  void _toggleCompletion(DateTime date, int index) {
    setState(() {
      _goals[date]![index]['completed'] = 'true';
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Congratulations on completing the goal!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 63, 139, 226),
        title: Text('Set Daily Goals'),
        centerTitle: true,
      ),
      backgroundColor: Color.fromARGB(255, 233, 233, 233),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
              _showGoalDialog(selectedDay);
            },
            calendarBuilders: CalendarBuilders(
              defaultBuilder: (context, day, focusedDay) {
                if (_streaks[day] == true) {
                  return Stack(
                    children: [
                      Center(child: Text(day.day.toString())),
                      Positioned(
                        top: 4,
                        right: 4,
                        child: Icon(
                          Icons.local_fire_department,
                          color: Colors.orange,
                          size: 16,
                        ),
                      ),
                    ],
                  );
                }
                return null;
              },
              todayBuilder: (context, day, focusedDay) {
                return Container(
                  margin: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      day.day.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
              headerTitleBuilder: (context, day) {
                return Center(
                  child: Text(
                    '${DateFormat.yMMMM().format(day)}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                );
              },
            ),
            calendarStyle: CalendarStyle(
              todayTextStyle: TextStyle(
                color: Colors.white,
              ),
              todayDecoration: BoxDecoration(
                color: Colors.redAccent,
                shape: BoxShape.circle,
              ),
              weekendTextStyle: TextStyle(color: Colors.redAccent),
              weekendDecoration: BoxDecoration(color: Colors.transparent),
              outsideDaysVisible: false,
            ),
            daysOfWeekStyle: DaysOfWeekStyle(
              weekendStyle: TextStyle(
                color: Colors.redAccent,
              ),
            ),
            availableCalendarFormats: const {
              CalendarFormat.month: 'Month',
            },
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Goals',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
          Expanded(
            child: _goals[_selectedDay]?.isEmpty ?? true
                ? Center(
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black54),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text('No goals set yet!'),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    itemCount: _goals[_selectedDay]?.length ?? 0,
                    itemBuilder: (context, index) {
                      final goal = _goals[_selectedDay]![index];
                      final isCompleted = goal['completed'] == 'true';
                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: ListTile(
                                leading:
                                    Icon(_categoryIcons[goal['category']!]),
                                title: Text(
                                  goal['category']!,
                                  style: TextStyle(
                                    decoration: isCompleted
                                        ? TextDecoration.lineThrough
                                        : TextDecoration.none,
                                  ),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      goal['goal']!,
                                      style: TextStyle(
                                        decoration: isCompleted
                                            ? TextDecoration.lineThrough
                                            : TextDecoration.none,
                                      ),
                                    ),
                                    if (!isCompleted)
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Theme(
                                              data: ThemeData(
                                                checkboxTheme:
                                                    CheckboxThemeData(
                                                  materialTapTargetSize:
                                                      MaterialTapTargetSize
                                                          .shrinkWrap,
                                                ),
                                              ),
                                              child: CheckboxListTile(
                                                contentPadding:
                                                    EdgeInsets.all(0),
                                                title: Text(
                                                  'Mark as completed',
                                                  style:
                                                      TextStyle(fontSize: 14),
                                                ),
                                                value: false,
                                                onChanged: (value) {
                                                  _toggleCompletion(
                                                      _selectedDay, index);
                                                },
                                                controlAffinity:
                                                    ListTileControlAffinity
                                                        .leading,
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    else
                                      Text(
                                        'Completed!',
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                  ],
                                ),
                                trailing: isCompleted
                                    ? null
                                    : Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          IconButton(
                                            icon: Icon(Icons.edit),
                                            onPressed: () =>
                                                _editGoal(_selectedDay, index),
                                          ),
                                          IconButton(
                                            icon: Icon(Icons.delete),
                                            onPressed: () => _deleteGoal(
                                                _selectedDay, index),
                                          ),
                                        ],
                                      ),
                              ),
                            ),
                            Positioned(
                              top: 8,
                              right: 16,
                              child: Text(
                                'Saved on: ${goal['time']}',
                                style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),
                          ],
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
