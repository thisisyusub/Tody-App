import 'package:flutter/material.dart';
import 'package:tody_app/counter_bloc.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  final _counterBloc = CounterBloc();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _emailController,
          ),
          TextField(
            controller: _passwordController,
          ),
          StreamBuilder<LoginState>(
            stream: _counterBloc.loginState,
            builder: (context, snapshot) {
              if (snapshot.data == null) return const SizedBox.shrink();

              final state = snapshot.data!;

              if (state is LoginFailure) {
                return Text(state.message);
              } else if (state is LoginSuccess) {
                return const Text('Success');
              }

              return const SizedBox.shrink();
            },
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StreamBuilder<LoginState>(
            stream: _counterBloc.loginState,
            builder: (context, snapshot) {
              if (snapshot.data == null) return const SizedBox.shrink();

              final state = snapshot.data!;

              if (state is LoginInProgress) {
                return const CircularProgressIndicator();
              }

              return FloatingActionButton(
                child: const Text('Log in'),
                onPressed: () {
                  final email = _emailController.text;
                  final password = _passwordController.text;

                  if (email.isNotEmpty && password.isNotEmpty) {
                    _counterBloc.loginEvent.add(
                      LoginRequested(
                        email: email,
                        password: password,
                      ),
                    );
                  }

                  //  _counterBloc.counterSink.add(CounterEvent.up);
                },
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _counterBloc.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
