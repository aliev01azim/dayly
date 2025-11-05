import 'package:data/features/auth/auth.dart';

Future registerDataAsyncServices() async {
  //root independent: firebase app, Hive
  await Future.wait([
   TokensStorageImpl.initHive(),
  ]);

}
