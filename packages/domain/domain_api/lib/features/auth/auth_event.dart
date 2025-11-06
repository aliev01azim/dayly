import 'dart:async';

class AuthEvent {
  AuthEvent(this.signInRequired);

  final bool signInRequired;
}

class AuthEventManager {
  final StreamController<AuthEvent> _authEventController = StreamController<AuthEvent>.broadcast();

  Stream<AuthEvent> get authEvents => _authEventController.stream;

  void notifySignInRequired() {
    _authEventController.add(AuthEvent(true));
  }

  void dispose() {
    _authEventController.close();
  }
}
