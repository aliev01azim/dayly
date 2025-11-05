import 'package:core_api/core_api.dart';
import 'package:data_api/data_api.dart';
import 'package:domain_api/domain_api.dart';

class RemoteUsersDataSourceImpl implements RemoteUsersDataSource {
  const RemoteUsersDataSourceImpl({
    required HttpClient client,
  }) : _client = client;

  final HttpClient _client;

  @override
  Future<List<UserDto>> getUsers() async {
    // final response = await _client.execute<Map<String, dynamic>>(
    //   method: 'get',
    //   url: 'users/users',
    // );

    return [
        UserDto(
        id: 'u1',
        fullName: 'Алим Азимов',
        profession: 'Барбер',
        avatarUrl: 'https://randomuser.me/api/portraits/men/32.jpg',
        sessions: [
          SessionDto(
            id: 's1',
            title: 'Мужская стрижка',
            startTime: DateTime(2025, 10, 30, 11, 15),
            status: SessionStatus.attended,
            online: true,
            createdAt: DateTime(2025, 10, 22, 9),
            duration: const Duration(minutes: 15),
          ),
          SessionDto(
            id: 's2',
            title: 'Свадебный макияж',
            startTime: DateTime(2025, 10, 30, 12),
            status: SessionStatus.confirmed,
            createdAt: DateTime(2025, 10, 22, 10, 30),
            duration: const Duration(minutes: 30),
          ),
          SessionDto(
            id: 's3',
            title: 'Бритьё классическое',
            startTime: DateTime(2025, 10, 30, 13),
            status: SessionStatus.missed,
            description: 'Антон, +7 922 089-78-78',
            createdAt: DateTime(2025, 10, 22, 11),
            duration: const Duration(minutes: 45),
          ),
          SessionDto(
            id: 's3',
            title: 'Бритьё классическое',
            startTime: DateTime(2025, 10, 29, 10),
            status: SessionStatus.confirmed,
            description: 'Антон, +7 922 089-78-78',
            createdAt: DateTime(2025, 10, 22, 11),
            duration: const Duration(minutes: 45),
          ),
          SessionDto(
            id: 's4',
            title: 'Бритьё классическое2',
            startTime: DateTime(2025, 10, 30, 14, 30),
            online: true,

            createdAt: DateTime(2025, 10, 22, 11),
            duration: const Duration(minutes: 45),
          ),
        ],
      ),
      UserDto(
        id: 'u2',
        fullName: 'Малика Турсунова',
        profession: 'Мастер маникюра',
        avatarUrl: 'https://randomuser.me/api/portraits/women/45.jpg',
        sessions: [
          SessionDto(
            id: 's4',
            title: 'Маникюр с покрытием гель-лак',
            startTime: DateTime(2025, 10, 30, 16),
            status: SessionStatus.confirmed,
            online: true,
            createdAt: DateTime(2025, 10, 22, 8, 30),
            duration: const Duration(minutes: 15),
          ),
          SessionDto(
            id: 's5',
            title: 'Коррекция ногтей',
            startTime: DateTime(2025, 10, 30, 13, 45),
            status: SessionStatus.attended,
            online: true,
            createdAt: DateTime(2025, 10, 22, 9, 15),
            duration: const Duration(minutes: 30),
          ),
        ],
      ),
      UserDto(
        id: 'u3',
        fullName: 'Рустам Ахмедов',
        profession: 'Бровист',
        avatarUrl: 'https://randomuser.me/api/portraits/men/72.jpg',
        sessions: [
          SessionDto(
            id: 's6',
            title: 'Коррекция и окрашивание бровей',
            startTime: DateTime(2025, 10, 30, 11, 15),
            status: SessionStatus.attended,
            online: true,
            createdAt: DateTime(2025, 10, 22, 10),
            duration: const Duration(minutes: 15),
          ),
          SessionDto(
            id: 's7',
            title: 'Ламинирование бровей',
            startTime: DateTime(2025, 10, 30, 10, 45),
            description: 'Запись не подтверждена клиентом',
            createdAt: DateTime(2025, 10, 22, 10, 15),
            duration: const Duration(minutes: 30),
          ),
        ],
      ),
    ];
  }
}
