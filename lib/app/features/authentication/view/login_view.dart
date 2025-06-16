import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/login_bloc.dart';
import '../bloc/login_event.dart';
import '../bloc/login_state.dart';


// Login Page Widget
class LoginPage extends StatelessWidget {
  final TextEditingController _studentIdController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: Scaffold(
        appBar: AppBar(        backgroundColor: Color(0xffEAF1F6),),
        backgroundColor: Color(0xffEAF1F6),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo and Title
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   Image.asset('assets/shikkhayan_logo.png',height: 60,width: 200,)
                  ],
                ),
                SizedBox(height: 32),
                Text(
                  'Sign in to your account',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 16),
                // Student ID Field
                TextField(
                  controller: _studentIdController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    labelText: 'Student ID',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                // Password Field
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                // Remember Me and Forgot Password Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BlocBuilder<LoginBloc, LoginState>(
                      builder: (context, state) {
                        return Row(
                          children: [
                            Checkbox(
                              value: state is LoginInitial ? state.rememberMe : false,
                              onChanged: (value) {
                                context.read<LoginBloc>().add(ToggleRememberMe(value!));
                              },
                            ),
                            Text('Remember me'),
                          ],
                        );
                      },
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text('Forgot Password?'),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                // Sign In Button
                BlocConsumer<LoginBloc, LoginState>(
                  listener: (context, state) {
                    if (state is LoginSuccess) {
                      // Navigate to next screen or show success message
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Login Successful!')),
                      );
                    } else if (state is LoginFailure) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.error)),
                      );
                    }
                  },
                  builder: (context, state) {
                    return SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: state is LoginLoading
                            ? null
                            : () {
                          context.read<LoginBloc>().add(
                            LoginSubmitted(
                              _studentIdController.text,
                              _passwordController.text,
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          'Sign In',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    );
                  },
                ),
                Spacer(),
                // Privacy Statement and Credits
                Text(
                  'By continuing you acknowledge that your personal data will be processed in accordance with the PRIVACY STATEMENT',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8),
                Text(
                  '© mPair',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}