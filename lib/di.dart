import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/presentation.dart';

final getIt = GetIt.instance;

Future<void> registerGetIt() async {
  CoreDiModule().init();
  PresentationDiModule().init();
  DomainDiModule().init();
  DataDiModule().init();
  await getIt.allReady();
}
