import 'package:data_api/data_api.dart';
import 'package:domain_api/domain_api.dart';

class SaveAuthTokenUseCaseImpl extends SaveAuthTokenUseCase {
  SaveAuthTokenUseCaseImpl({required this.storageRepository});

  final StorageRepository storageRepository;

  @override
  void makeRequest(t) {
    final result = storageRepository.setUserToken(t);
    return result;
  }
}
