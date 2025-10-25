import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_dayly/controllers/users_controller.dart';
import 'package:test_dayly/heplers/date_helper.dart';
import 'package:test_dayly/models/session_model.dart';
import 'package:test_dayly/models/user_model.dart';

class SessionCreate extends StatefulWidget {
  const SessionCreate({super.key, required this.userModel, required this.startTime});
  final UserModel userModel;
  final DateTime startTime;

  @override
  State<SessionCreate> createState() => _SessionCreateState();
}

class _SessionCreateState extends State<SessionCreate> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _durationController = TextEditingController(text: '15');
  SessionStatus? _selectedStatus;
  bool _online = false;

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _durationController.dispose();
    super.dispose();
  }

  void _saveSession() {
    if (!_formKey.currentState!.validate()) return;

    final duration = int.tryParse(_durationController.text) ?? 15;
    final newSession = SessionModel(
      id: 's${DateTime.now().millisecondsSinceEpoch}',
      title: _titleController.text,
      startTime: widget.startTime,
      status: _selectedStatus,
      online: _online,
      description: _descriptionController.text.isNotEmpty ? _descriptionController.text : null,
      createdAt: DateTime.now(),
      duration: Duration(minutes: duration),
    );

    final usersController = Get.find<UsersController>();
    final userIndex = usersController.users.indexWhere((u) => u.id == widget.userModel.id);
    if (userIndex != -1) {
      final updatedUser = widget.userModel.copyWith(
        sessions: [...widget.userModel.sessions, newSession],
      );
      usersController.users[userIndex] = updatedUser;
    }

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Создание сессии'),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Время: ${widget.startTime.hourReadable}',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Название услуги',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Пожалуйста, введите название';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Описание (опционально)',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _durationController,
                decoration: const InputDecoration(
                  labelText: 'Длительность (минуты)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Пожалуйста, введите длительность';
                  }
                  final duration = int.tryParse(value);
                  if (duration == null || duration <= 0) {
                    return 'Введите корректную длительность';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<SessionStatus>(
                value: _selectedStatus,
                decoration: const InputDecoration(
                  labelText: 'Статус',
                  border: OutlineInputBorder(),
                ),
                items: SessionStatus.values.map((status) {
                  return DropdownMenuItem(
                    value: status,
                    child: Text(status.text),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedStatus = value;
                  });
                },
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Checkbox(
                    value: _online,
                    onChanged: (value) {
                      setState(() {
                        _online = value ?? false;
                      });
                    },
                  ),
                  const Text('Онлайн сессия'),
                ],
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _saveSession,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text(
                    'Сохранить',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
