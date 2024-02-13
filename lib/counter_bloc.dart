import 'dart:async';

import 'package:rxdart/subjects.dart';

/// events - LoginRequested(email, password)
/// states - initial, inProgress, Failure, success

class LoginRequested {
  const LoginRequested({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;
}

sealed class LoginState {}

class LoginInitial extends LoginState {}

class LoginInProgress extends LoginState {}

class LoginFailure extends LoginState {
  LoginFailure(this.message);

  final String message;
}

class LoginSuccess extends LoginState {}

class CounterBloc {
  CounterBloc() {
    _subscription = _loginEventController.stream.listen(
      (event) async {
        _loginStateController.add(LoginInProgress());
        await Future.delayed(const Duration(seconds: 2));

        _loginStateController.add(LoginFailure('something went wrong!'));
      },
    );
  }

  StreamSubscription<LoginRequested>? _subscription;

  /// state's controller
  final _loginStateController = BehaviorSubject<LoginState>()
    ..add(LoginInitial());

  /// state (output)
  Stream<LoginState> get loginState => _loginStateController.stream;

  /// event's controller
  final _loginEventController = StreamController<LoginRequested>();

  /// event's sink (input)
  StreamSink<LoginRequested> get loginEvent => _loginEventController.sink;

  void dispose() {
    _subscription?.cancel();
    _loginStateController.close();
    _loginEventController.close();
  }
}
