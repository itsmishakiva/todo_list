import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/task_model.dart';
import '../edit_task_controller.dart';

class TaskTextField extends StatelessWidget {
  const TaskTextField({
    Key? key,
    required TextEditingController textController,
    required this.task,
  })  : _textController = textController,
        super(key: key);

  final TextEditingController _textController;
  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Theme.of(context).primaryColor,
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 4),
                    color: Theme.of(context).shadowColor,
                    blurRadius: 2.0,
                  ),
                  BoxShadow(
                    offset: const Offset(0, 0),
                    color: Theme.of(context).primaryColorDark,
                    blurRadius: 2.0,
                  ),
                ]),
            child: Consumer(builder: (context, ref, child) {
              return TextField(
                key: const Key('text_field'),
                controller: _textController,
                maxLines: null,
                minLines: 4,
                onChanged: (value) {
                  ref.read(editPageProvider.notifier).updateTask(
                        task.copyWith(
                          text: value,
                        ),
                      );
                },
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.needToDo,
                  hintStyle: Theme.of(context).textTheme.subtitle2,
                  isDense: true,
                  filled: true,
                  fillColor: Theme.of(context).primaryColor,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
