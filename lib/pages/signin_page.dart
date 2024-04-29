import 'package:flutter/material.dart';
import 'package:home_service_flutter_app/animation/FadeAnimation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:home_service_flutter_app/pages/start_page.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/build_custom_scaffold.dart';
import '../widgets/show_snackbar.dart';
import '../widgets/build_text_field.dart';
import 'forget_passsword_page.dart';
import 'signup_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final formSignInKey = GlobalKey<FormState>();
  bool rememberMe = false;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getUserDetail();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> getUserDetail() async {
    final prefs = await SharedPreferences.getInstance();
    final uid = prefs.getString('uid');
    final email = prefs.getString('email');
    final password = prefs.getString('password');
    debugPrint('getString => uid: $uid userEmail: $email, password: $password');
    if (email != null && password != null) {
      emailController.text = email;
      passwordController.text = password;
    }
  }

  Future<void> signInUser() async {
    try {
      final userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      final userId = userCredential.user?.uid;
      debugPrint('uid: $userId');
      if (rememberMe) {
        final prefs = await SharedPreferences.getInstance();
        final uid = prefs.setString('uid', userId!);
        final email = prefs.setString('email', emailController.text);
        final password = prefs.setString('password', passwordController.text);
        debugPrint(
            'setString => uid: $uid userEmail: $email, password: $password');
      }
      if (!mounted) return;
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        showSnackBar('Signing In'),
      );
      Navigator.pushAndRemoveUntil(
        context,
        PageRouteBuilder(
          pageBuilder: (context, _, __) => const StartPage(),
        ),
        (route) => false,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        debugPrint('No User Found for that Email');
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
          showSnackBar('No User Found for that Email'),
        );
      } else if (e.code == 'wrong-password') {
        debugPrint('Wrong Password Provided by User');
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
          showSnackBar('Wrong Password Provided by User'),
        );
      } else {
        debugPrint('$e');
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(showSnackBar('$e'));
      }
    }
  }

  @override
  Widget build(BuildContext context) => BuildCustomScaffold(
        child: Column(
          children: [
            const Expanded(flex: 1, child: SizedBox(height: 10)),
            Expanded(
              flex: 2,
              child: FadeAnimation(
                1, Container(
                  padding: const EdgeInsets.fromLTRB(25, 50, 25, 20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Form(
                      key: formSignInKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Welcome back',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w900,
                              color: Colors.blue,
                            ),
                          ),
                          const SizedBox(height: 40),
                          BuildTextField(
                            validateText: 'Please enter Email',
                            labelText: 'Email',
                            controller: emailController,
                          ),
                          const SizedBox(height: 25),
                          BuildTextField(
                            validateText: 'Please enter Password',
                            labelText: 'Password',
                            obscureText: true,
                            controller: passwordController,
                          ),
                          const SizedBox(height: 25),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                    value: rememberMe,
                                    onChanged: (value) =>
                                        setState(() => rememberMe = value!),
                                    activeColor: Colors.blue,
                                  ),
                                  const Text(
                                    'Remember me',
                                    style: TextStyle(color: Colors.black45),
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () => Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const ForgetPasswordPage(),
                                  ),
                                ),
                                child: const Text(
                                  'Forget password?',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 25),
                          ElevatedButton(
                            onPressed: () {
                              if (formSignInKey.currentState!.validate()) {
                                signInUser();
                              }
                            },
                            child: const Text('Sign in'),
                          ),
                          const SizedBox(height: 25),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Divider(
                                  thickness: 0.7,
                                  color: Colors.grey.withOpacity(0.5),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'Sign in with',
                                  style: TextStyle(color: Colors.black45),
                                ),
                              ),
                              Expanded(
                                child: Divider(
                                  thickness: 0.7,
                                  color: Colors.grey.withOpacity(0.5),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 25),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Logo(Logos.facebook_f),
                              Logo(Logos.twitter),
                              Logo(Logos.google),
                              Logo(Logos.apple),
                            ],
                          ),
                          const SizedBox(height: 25),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Don\'t have an account? ',
                                style: TextStyle(color: Colors.black45),
                              ),
                              GestureDetector(
                                onTap: () => Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const SignUpPage(),
                                  ),
                                ),
                                child: const Text(
                                  'Sign up',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
