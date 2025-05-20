import 'package:flutter/material.dart';
import 'package:flutter_taskone/login/login_page/login_screen.dart';
import 'package:flutter_taskone/signup/signup_model.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Consumer<SignupModel>(
            builder: (context, signupModel, child)
              {return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Center(
                    child: ClipOval(
                      child: Icon(
                        Icons.person_add_alt_1,
                        size: 100,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Center(
                  child: Column(
                    children: [
                      Text(
                        "Create Account",
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight
                            .bold),
                      ),
                      Text(
                        "Sign up to get started",
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),

                Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 32),

                TextField(
                  controller: signupModel.fullName,
                  decoration: InputDecoration(
                    hintText: 'Full Name',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),

                TextField(
                  controller: signupModel.email,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),

                TextField(
                  controller: signupModel.password,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),

                TextField(
                  controller: signupModel.confirmPassword,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Confirm Password',
                    prefixIcon: Icon(Icons.lock_outline),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 12),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        "Already have an account? ",
                        style: TextStyle(fontSize: 17),
                      ),
                      InkWell(
                        onTap: () {
                          signupModel.clearVar();
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Sign in now",
                          style: TextStyle(
                            fontSize: 17,
                            decoration: TextDecoration.underline,
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async{
                      if(signupModel.validateInputs()) {
                        await signupModel.addUser();
                        signupModel.clearVar();
                        Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) => LoginPage()));
                      }
                      else{
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Please fill all fields correctly"),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                    ),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            );},
          ),
        ),
      ),
    );
  }
}
