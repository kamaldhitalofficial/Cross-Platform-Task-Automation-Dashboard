import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_automation/features/task/presentation/bloc/task_bloc.dart';
import 'package:task_automation/features/task/presentation/bloc/task_event.dart';
import 'package:task_automation/features/task/presentation/bloc/task_state.dart';

class TaskDashboardPage extends StatelessWidget {
  const TaskDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Task Automation Dashboard')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                      hintText: 'Enter task title (e.g., Automate Email)',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    if (controller.text.isNotEmpty) {
                      context.read<TaskBloc>().add(
                        AddTaskEvent(controller.text),
                      );
                      controller.clear();
                    }
                  },
                  child: const Text('Add Task'),
                ),
              ],
            ),
          ),
          Expanded(
            child: BlocBuilder<TaskBloc, TaskState>(
              builder: (context, state) {
                if (state is TaskInitial) {
                  context.read<TaskBloc>().add(LoadTasksEvent());
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is TaskLoaded) {
                  if (state.tasks.isEmpty) {
                    return const Center(child: Text('No tasks added.'));
                  }
                  return ListView.builder(
                    itemCount: state.tasks.length,
                    itemBuilder: (context, index) {
                      final task = state.tasks[index];
                      return ListTile(
                        title: Text(
                          task.title,
                          style: TextStyle(
                            decoration: task.isCompleted
                                ? TextDecoration.lineThrough
                                : null,
                          ),
                        ),
                        trailing: Checkbox(
                          value: task.isCompleted,
                          onChanged: (_) {
                            context.read<TaskBloc>().add(
                              ToggleTaskEvent(task.id),
                            );
                          },
                        ),
                      );
                    },
                  );
                }
                return const Center(child: Text('Error loading tasks.'));
              },
            ),
          ),
        ],
      ),
    );
  }
}
