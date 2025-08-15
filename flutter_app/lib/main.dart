import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_automation/core/injection/injection_container.dart';
import 'package:task_automation/features/task/presentation/pages/task_dashboard_page.dart';

void main() {
  runApp(const TaskAutomation());
}

class TaskAutomation extends StatelessWidget {
  const TaskAutomation({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InjectionContainer.taskBloc,
      child: MaterialApp(
        title: 'Task Automation Dashboard',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const TaskDashboardPage(),
      ),
    );
  }
}
