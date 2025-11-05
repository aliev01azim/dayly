import 'package:data_api/data_api.dart';
import 'package:domain_api/domain_api.dart';

class GetAuthTokenUseCaseImpl extends GetAuthTokenUseCase {
  GetAuthTokenUseCaseImpl({required this.storageRepository});

  final StorageRepository storageRepository;

  @override
  AuthToken? makeRequest(_) {
    final result = storageRepository.getUserAuthToken();
    return result;
  }
}
