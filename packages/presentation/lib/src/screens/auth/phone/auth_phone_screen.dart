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

class AuthPhoneScreen extends StatefulWidget {
  const AuthPhoneScreen({super.key});
  static const path = 'authPhone';

  @override
  State<AuthPhoneScreen> createState() => _AuthPhoneScreenState();
}

class _AuthPhoneScreenState extends State<AuthPhoneScreen> {
  final _phoneController = TextEditingController();
  final _maskFormatter = MaskTextInputFormatter(mask: '+7 ### ###-##-##', filter: {'#': RegExp(r'[0-9]')});

  bool get _isValidPhone => _maskFormatter.getUnmaskedText().length == 10;

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldCustomAuth(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 48),
            Text('Вход или регистрация', style: AppTextStyles.title()),
            const SizedBox(height: 32),
            PhoneTextField(
              controller: _phoneController,
              inputFormatters: [_maskFormatter],
              hint: '+7 999 999-99-99',
              onChanged: (_) => setState(() {}),
            ),
            const SizedBox(height: 16),
            BlocConsumer<AuthPhoneCubit, AuthPhoneState>(
              builder: (context, state) {
                String? error;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (state.maybeMap(
                      challenged: (value) {
                        error = value.error;
                        return value.error != null;
                      },
                      orElse: () => false,
                    )) ...[
                      Text(
                        error!,
                        style: AppTextStyles.p(color: MainPalette.red),
                      ),
                      const SizedBox(height: 16),
                    ],

                    ElevatedButtonCustom(
                      text: 'Далее',
                      onTap: () => context.read<AuthPhoneCubit>().challenge('+7${_maskFormatter.getUnmaskedText()}'),
                      enabled: _isValidPhone,
                      isLoading: state.maybeMap(challenging: (value) => true, orElse: () => false),
                    ),
                  ],
                );
              },
              listener: (context, state) {
                Challenge? challenge;
                if (state.maybeMap(
                  challenged: (value) {
                    challenge = value.challenge;
                    return value.challenge != null;
                  },
                  orElse: () => false,
                )) {
                  context.push(AppRoutes.authPhoneOtp, extra: challenge);
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
