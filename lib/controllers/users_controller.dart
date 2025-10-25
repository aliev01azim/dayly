import 'package:get/get.dart';
import 'package:test_dayly/models/session_model.dart';
import 'dart:async';

import 'package:test_dayly/models/user_model.dart';

class UsersController extends GetxController {
  final users = <UserModel>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    _loadUsers();
  }

  Future<void> _loadUsers() async {
    isLoading.value = true;

    // имитация запроса на backend (API)
    await Future.delayed(const Duration(seconds: 2));

    // возвращаем фейковые данные
    users.value = [
      UserModel(
        id: 'u1',
        fullName: 'Алим Азимов',
        profession: 'Барбер',
        avatarUrl: 'https://randomuser.me/api/portraits/men/32.jpg',
        sessions: [
          SessionModel(
            id: 's1',
            title: 'Мужская стрижка',
            startTime: DateTime(2025, 10, 25, 11, 15),
            status: SessionStatus.attended,
            online: true,
            createdAt: DateTime(2025, 10, 22, 9, 0),
            duration: Duration(minutes: 15),
          ),
          SessionModel(
            id: 's2',
            title: 'Свадебный макияж',
            startTime: DateTime(2025, 10, 25, 12, 00),
            status: SessionStatus.confirmed,
            online: false,
            createdAt: DateTime(2025, 10, 22, 10, 30),
            duration: Duration(minutes: 30),
          ),
          SessionModel(
            id: 's3',
            title: 'Бритьё классическое',
            startTime: DateTime(2025, 10, 25, 13, 00),
            status: SessionStatus.missed,
            online: false,
            description: 'Антон, +7 922 089-78-78',
            createdAt: DateTime(2025, 10, 22, 11, 0),
            duration: Duration(minutes: 45),
          ),
          SessionModel(
            id: 's3',
            title: 'Бритьё классическое',
            startTime: DateTime(2025, 10, 26, 10, 00),
            status: SessionStatus.confirmed,
            online: false,
            description: 'Антон, +7 922 089-78-78',
            createdAt: DateTime(2025, 10, 22, 11, 0),
            duration: Duration(minutes: 45),
          ),
          SessionModel(
            id: 's4',
            title: 'Бритьё классическое2',
            startTime: DateTime(2025, 10, 25, 14, 30),
            online: true,

            createdAt: DateTime(2025, 10, 22, 11, 0),
            duration: Duration(minutes: 45),
          ),
        ],
      ),
      UserModel(
        id: 'u2',
        fullName: 'Малика Турсунова',
        profession: 'Мастер маникюра',
        avatarUrl: 'https://randomuser.me/api/portraits/women/45.jpg',
        sessions: [
          SessionModel(
            id: 's4',
            title: 'Маникюр с покрытием гель-лак',
            startTime: DateTime(2025, 10, 25, 16, 0),
            status: SessionStatus.confirmed,
            online: true,
            createdAt: DateTime(2025, 10, 22, 8, 30),
            duration: Duration(minutes: 15),
          ),
          SessionModel(
            id: 's5',
            title: 'Коррекция ногтей',
            startTime: DateTime(2025, 10, 25, 13, 45),
            status: SessionStatus.attended,
            online: true,
            createdAt: DateTime(2025, 10, 22, 9, 15),
            duration: Duration(minutes: 30),
          ),
        ],
      ),
      UserModel(
        id: 'u3',
        fullName: 'Рустам Ахмедов',
        profession: 'Бровист',
        avatarUrl: 'https://randomuser.me/api/portraits/men/72.jpg',
        sessions: [
          SessionModel(
            id: 's6',
            title: 'Коррекция и окрашивание бровей',
            startTime: DateTime(2025, 10, 25, 11, 15),
            status: SessionStatus.attended,
            online: true,
            createdAt: DateTime(2025, 10, 22, 10, 0),
            duration: Duration(minutes: 15),
          ),
          SessionModel(
            id: 's7',
            title: 'Ламинирование бровей',
            startTime: DateTime(2025, 10, 25, 10, 45),
            online: false,
            description: 'Запись не подтверждена клиентом',
            createdAt: DateTime(2025, 10, 22, 10, 15),
            duration: Duration(minutes: 30),
          ),
        ],
      ),
    ];

    isLoading.value = false;
  }
}
