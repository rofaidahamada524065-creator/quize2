import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quize2/Provider/auth_provider.dart';
import 'package:quize2/Screens/homepage.dart';
import 'package:quize2/Screens/signup.dart';
import 'package:quize2/Widget/textformfield_custom.dart';

class Login extends StatelessWidget {
  new({super.key});

  TextEditingController email = TextEditingController();
  TextEditingController passwrd = TextEditingController();

  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final object = context.read<AuthProvider>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent,
        title: Text("Login", style: TextStyle(color: Colors.white)),
      ),
      body: Consumer<AuthProvider>(
        builder: (context, value, child) => Form(
          key: _globalKey,
          child: Column(
            crossAxisAlignment: .center,
            mainAxisAlignment: .center,
            children: [
              Icon(
                Icons.laptop_mac_rounded,
                size: 150,
                color: Colors.deepOrangeAccent,
              ),
              TextformfieldCustom(
                Picon: Icons.email,
                text: "Email",
                controller: email,
              ),
              TextformfieldCustom(
                Picon: Icons.lock,
                text: "Password",
                controller: passwrd,
                Sicon: Icons.visibility_off,
              ),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrangeAccent,
                ),
                onPressed: () async {
                  if (_globalKey.currentState!.validate()) {
                    await object.Loginprequst(
                      password: passwrd.text,
                      email: email.text,
                    );

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("${object.authModel!.message}")),
                    );
                    if (object.authModel!.status == true) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Homepage()),
                      );
                    }
                  }
                },
                child: Text("Login", style: TextStyle(color: Colors.white)),
              ),
              SizedBox(height: 20),
              Row(
                crossAxisAlignment: .center,
                mainAxisAlignment: .center,
                children: [
                  Text("Don't have Account ?"),
                  SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Signup()),
                      );
                    },
                    child: Text(
                      "SignUp",
                      style: TextStyle(color: Colors.deepOrangeAccent),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
