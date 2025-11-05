import 'package:presentation/src/screens/auth/phone/auth_phone_otp_screen.dart';
import 'package:presentation/src/screens/auth/phone/auth_phone_screen.dart';
import 'package:presentation/src/screens/home/home_screen.dart';
import 'package:presentation/src/screens/splash/splash_screen.dart';

class AppRoutes {
  const AppRoutes._();
  static const splash = '/${SplashScreen.path}';
  static const home = '/${Home.path}';
  static const authPhone = '/${AuthPhoneScreen.path}';
  static const authPhoneOtp = '/${AuthPhoneOtpScreen.path}';
}
