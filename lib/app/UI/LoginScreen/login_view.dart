import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_assignment_5/app/UI/LoginScreen/login_view.dart';
import 'package:flutter_assignment_5/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment_5/app/UI/LoginScreen/login_viewmodel.dart'
    as model;

import 'package:stacked/stacked.dart';

// Color _primarycolor = Color(0xff0F2F44);
Color _primarycolor = Color(0xff0F2F44);
Color _bluecolor = Color(0xff2D7FF9);

TextEditingController _emailController = TextEditingController();
TextEditingController _passwordController = TextEditingController();

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => model.LoginViewmodel(),
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 50,
                    child: Image.asset('assets/images/logo.png'),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Login to Your Account',
                  style: TextStyle(
                    color: Color(0xff0F2F44),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                _CurptinoTextField(
                  cntroller: _emailController,
                  placeholder: 'Enter email',
                  prefixicon: Icons.email,
                ),
                SizedBox(height: 10),
                _CurptinoTextField(
                  cntroller: _passwordController,
                  placeholder: 'Enter password',
                  prefixicon: Icons.lock,
                  suffixicon: Icons.remove_red_eye,
                ),
                SizedBox(height: 5),
                rememberme_checkbox(model.ischeck, (newValue) {
                  model.checkbox(newValue);
                }),
                SizedBox(height: 5),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _bluecolor,
                    minimumSize: Size(double.infinity, 55),
                    elevation: 6,
                  ),

                  onPressed: () async {
                    try {
                      final credential = await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                            email: _emailController.text.trim(),
                            password: _passwordController.text.trim(),
                          );

                      model.navigateToMainView();
                    } on FirebaseAuthException catch (e) {
                      var snackBar = SnackBar(content: Text("${e.code}"));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } catch (e, s) {
                      var snackBar = SnackBar(
                        content: Text("Unknown error: $e"),
                      );
                    }
                  },
                  child: Text(
                    'Sign in',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                // forget password text
                InkWell(
                  onTap: () {},
                  child: Text(
                    'Forget the password?',
                    style: TextStyle(
                      color: _bluecolor,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // or continue line
                Row(
                  children: [
                    Expanded(child: Divider(thickness: 1, color: Colors.grey)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "or continue with",
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Expanded(child: Divider(thickness: 1, color: Colors.grey)),
                  ],
                ),
                SizedBox(height: 20),
                // facebook, google and apple button
                loginwithsocialmedia(),
                SizedBox(height: 15),
                // don't have an account
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(width: 5),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        "Sign up",
                        style: TextStyle(
                          color: _bluecolor,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget _CurptinoTextField({
  required String placeholder,
  required IconData prefixicon,
  required TextEditingController cntroller,
  IconData? suffixicon,
}) {
  return CupertinoTextField(
    padding: EdgeInsets.all(17),
    controller: cntroller,

    placeholder: placeholder,
    placeholderStyle: TextStyle(
      color: CupertinoColors.systemGrey,
      fontSize: 14,
    ),

    style: TextStyle(color: _primarycolor, fontSize: 12),
    prefix: Padding(
      padding: EdgeInsets.only(left: 8.0),
      child: Icon(prefixicon, color: _primarycolor, size: 20),
    ),
    suffix: Padding(
      padding: const EdgeInsets.only(right: 18.0),
      child: Icon(suffixicon, color: _primarycolor, size: 20),
    ),
    decoration: BoxDecoration(
      color: Color.fromARGB(131, 234, 241, 255),
      borderRadius: BorderRadius.circular(12),
    ),
  );
}

Widget rememberme_checkbox(bool defaultvalue, ValueChanged<bool?> onChanged) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Checkbox(
        checkColor: Colors.white,
        activeColor: _bluecolor,
        side: BorderSide(color: _bluecolor, width: 2),

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),

        value: defaultvalue,
        onChanged: onChanged,
      ),
      Text(
        'Remember me',
        style: TextStyle(
          fontSize: 11,
          color: _primarycolor,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  );
}

Widget loginwithsocialmedia() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,

    children: [
      Flexible(
        child: InkWell(
          onTap: () {},
          child: Container(
            height: 50,
            width: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.transparent,
              border: Border.all(
                color: const Color.fromARGB(91, 158, 158, 158),
                width: 1,
              ),
            ),
            child: Center(
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage('assets/images/FacebookLogo.jpeg'),
                radius: 13,
              ),
            ),
          ),
        ),
      ),
      Flexible(
        child: InkWell(
          onTap: () {},
          child: Container(
            height: 50,
            width: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.transparent,
              border: Border.all(
                color: const Color.fromARGB(91, 158, 158, 158),
                width: 1,
              ),
            ),
            child: Center(
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage('assets/images/GoogleLogo.jpg'),
                radius: 13,
              ),
            ),
          ),
        ),
      ),
      Flexible(
        child: InkWell(
          onTap: () {},
          child: Container(
            height: 50,
            width: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.transparent,
              border: Border.all(
                color: const Color.fromARGB(91, 158, 158, 158),
                width: 1,
              ),
            ),
            child: Center(
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage('assets/images/AppleLogo.png'),
                radius: 13,
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
