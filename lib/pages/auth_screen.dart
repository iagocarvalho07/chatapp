import 'package:chatapp/components/auth_form.dart';
import 'package:chatapp/models/auth_form_data.dart';
import 'package:chatapp/services/auth/auth_service_mock.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool _isloading = false;

  Future<void> _handleSubmit(AuthFormData formData) async {
    try {
      setState(() => _isloading = true);
      if (formData.islogin) {
        await AuthServiceMock().login(formData.email, formData.password);
      } else {
        await AuthServiceMock().singUp(formData.email, formData.password,
            formData.password, formData.Image);
      }
    } catch (error) {
      // tratar o error
    } finally {
      setState(() => _isloading = false);
    }
    print("AuthPAge");
    print(formData.email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              child: AuthForm(
                onSubmit: _handleSubmit,
              ),
            ),
          ),
          if (_isloading)
            Container(
              decoration:
                  const BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.5)),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            )
        ],
      ),
    );
  }
}
