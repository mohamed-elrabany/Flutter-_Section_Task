import 'package:flutter/material.dart';
import 'package:flutter_taskone/dashboard/nav_bar.dart';
import 'package:flutter_taskone/login/login_model.dart';
import 'package:flutter_taskone/signup/signup_page/signup_screen.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Consumer<LoginModel>(
            builder: (context, loginModel, child)
            { return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Center(child: ClipOval(child: Icon(
                    Icons.lock_outline, size: 100,
                    color: Colors.deepPurple,),)),
                ),
                SizedBox(height: 5,),
                Center(child: Column(
                  children: [
                    Text("Welcome Back",
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight
                          .bold),),
                    Text("Login to Your Account",
                      style: TextStyle(fontSize: 15, color: Colors.grey),)
                  ],
                )),
                SizedBox(height: 20,),

                Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 32),

                TextField(
                  controller: loginModel.enteredEmail,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),

                TextField(
                  controller: loginModel.enteredPassword,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 12),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text("Doesn't has an account? ",
                        style: TextStyle(fontSize: 17),)
                      ,
                      InkWell(onTap: () {
                        Navigator.push((context), MaterialPageRoute(
                            builder: (context) => SignupScreen()));
                        loginModel.clearVar();
                      }, child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Text("Sign up now", style: TextStyle(
                            fontSize: 17,
                            decoration: TextDecoration.underline,
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.w500),),
                      ),),
                    ],
                  ),
                ),
                SizedBox(height: 12),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      if(await loginModel.checkLogin()){
                        loginModel.clearVar();
                        Navigator.pushReplacement(
                            context, MaterialPageRoute(builder: (context) =>
                            NavBar()));
                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Please fill all fields correctly"),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    }
                    ,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple)
                    ,
                    child: Text(
                      'Login', style: TextStyle(color: Colors.white),),
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
