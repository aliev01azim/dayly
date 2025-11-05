import 'package:domain_api/domain_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:presentation/presentation.dart';
import 'package:presentation/src/screens/auth/phone/blocs/auth_phone_cubit/auth_phone_cubit.dart';
import 'package:presentation/src/screens/auth/phone/blocs/auth_phone_cubit/auth_phone_state.dart';
import 'package:ui_kit/ui_kit.dart';
import 'package:ui_kit/widgets/buttons/buttons.dart';

class AuthPhoneOtpScreen extends StatefulWidget {
  const AuthPhoneOtpScreen({super.key, required this.challenge});
  static const path = 'authPhoneOtp';
  final Challenge challenge;
  @override
  State<AuthPhoneOtpScreen> createState() => _AuthPhoneOtpScreenState();
}

class _AuthPhoneOtpScreenState extends State<AuthPhoneOtpScreen> {
  final pinTextController = TextEditingController();

  bool get _isValidCode => pinTextController.text.length == 4;

  @override
  void dispose() {
    pinTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldCustomAuth(
      showOnlyBackButton: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 48),
            Text('Отправили код на ${PhoneFormatter.maskPhone(widget.challenge.phone)}', style: AppTextStyles.title()),
            const SizedBox(height: 32),
            BlocBuilder<AuthPhoneCubit, AuthPhoneState>(
              builder: (context, state) {
                return CodeTextField(
                  controller: pinTextController,
                  enabled: state.maybeMap(verifying: (value) => true, orElse: () => false),
                  hasError: state.maybeMap(verified: (value) => value.error != null, orElse: () => false),
                  onCodeCompleted: (code) =>
                      context.read<AuthPhoneCubit>().verify(challengeId: widget.challenge.id, code: code),
                  onCodeChanged: (_) => setState(() {}),
                );
              },
            ),
            const SizedBox(height: 16),
            BlocConsumer<AuthPhoneCubit, AuthPhoneState>(
              builder: (context, state) {
                String? error;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (state.maybeMap(
                      verified: (value) {
                        error = value.error;
                        return value.error != null;
                      },
                      orElse: () => false,
                    )) ...[
                      Text(error!, style: AppTextStyles.p(color: MainPalette.red)),
                      const SizedBox(height: 16),
                    ],

                    ElevatedButtonCustom(
                      text: 'Далее',
                      onTap: () => context.read<AuthPhoneCubit>().verify(
                        challengeId: widget.challenge.id,
                        code: pinTextController.text,
                      ),
                      enabled: _isValidCode,
                      isLoading: state.maybeMap(verifying: (value) => true, orElse: () => false),
                    ),
                  ],
                );
              },
              listener: (context, state) {
                if (state.maybeMap(verified: (value) => value.authToken != null, orElse: () => false)) {
                  context.go(AppRoutes.home);
                }
              },
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
