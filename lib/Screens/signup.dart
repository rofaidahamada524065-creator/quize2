import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quize2/Provider/auth_provider.dart';
import 'package:quize2/Screens/login.dart';
import 'package:quize2/Widget/textformfield_custom.dart';

class Signup extends StatelessWidget {
  new({super.key});
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController passwrd = TextEditingController();
  final TextEditingController phone = TextEditingController();
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final object = context.read<AuthProvider>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent,
        title: Text("Sign Up", style: TextStyle(color: Colors.white)),
      ),
      body: Consumer<AuthProvider>(
        builder: (context, value, child) => Form(
          key: _globalKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: .center,
              mainAxisAlignment: .center,
              children: [
                Icon(
                  Icons.person_add_alt_1_sharp,
                  size: 150,
                  color: Colors.deepOrangeAccent,
                ),
                TextformfieldCustom(
                  Picon: Icons.account_circle,
                  text: "Username",
                  controller: name,
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
                TextformfieldCustom(
                  Picon: Icons.lock,
                  text: "Phone",
                  controller: phone,
                  Sicon: Icons.visibility_off,
                ),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrangeAccent,
                  ),
                  onPressed: () async {
                    if (_globalKey.currentState!.validate()) {
                      await object.Signuprequst(
                        name: name.text,
                        phone: phone.text,
                        password: passwrd.text,
                        email: email.text,
                      );

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("${object.authModel!.message}")),
                      );
                      if (object.authModel?.status == true) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),
                        );
                      }
                    }
                  },
                  child: Text("Sign Up", style: TextStyle(color: Colors.white)),
                ),
                SizedBox(height: 20),
                Row(
                  crossAxisAlignment: .center,
                  mainAxisAlignment: .center,
                  children: [
                    Text("Already have Account ?"),
                    SizedBox(width: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),
                        );
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.deepOrangeAccent),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
