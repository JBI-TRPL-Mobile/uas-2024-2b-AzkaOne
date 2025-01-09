import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:template_project/model/user.dart';
import 'package:provider/provider.dart';
import 'package:template_project/provider/providerku.dart';

class Registerpage extends StatefulWidget {
  const Registerpage({super.key});

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  final formkey = GlobalKey<FormState>();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/images/bg1.png', fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.person, size: 100, color: Colors.blue),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: userNameController,
                    decoration: const InputDecoration(
                      labelText: 'Username',
                      labelStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your username!';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email!';
                      }
                      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return 'Please enter a valid email!';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password!';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters!';
                      }
                      return null;
                    },
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: confirmPasswordController,
                    decoration: const InputDecoration(
                      labelText: 'Confirm Password',
                      labelStyle:
                          TextStyle(color: Colors.white),
                      border:
                          OutlineInputBorder(),
                      enabledBorder:
                          OutlineInputBorder(borderSide:
                              BorderSide(color:
                                  Colors.white),),
                      focusedBorder:
                          OutlineInputBorder(borderSide:
                              BorderSide(color:
                                  Colors.white),),
                    ),
                    validator:
                        (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please confirm your password!';
                          }
                          if (value != passwordController.text) {
                            return 'Passwords do not match!';
                          }
                          return null;
                        },
                    obscureText:
                        true,
                  ),
                  SizedBox(height:
                          20),
                  ElevatedButton(
                    onPressed:
                        () {
                          if (formkey.currentState!.validate()) {
                            var newUser =
                                Users(userName:
                                    userNameController.text,
                                    email:
                                    emailController.text,
                                    password:
                                    passwordController.text);
                            Provider.of<Providerku>(context, listen:
                                false).registerUser(newUser);
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:
                                Text('Registration Successful!')));
                            Navigator.pushNamed(context, '/');
                          }
                        },
                    child:
                        Text('Register'),
                  ),
                  const SizedBox(height:
                          20.0,),
                  const Row(mainAxisAlignment:
                          MainAxisAlignment.center, children:
                              [
                                Expanded(child:
                                  Divider(thickness:
                                      0.7, color:
                                      Colors.white,),),
                                Padding(padding:
                                  EdgeInsets.symmetric(vertical:
                                      0, horizontal:
                                      10,), child:
                                  Text('Login With', style:
                                      TextStyle(color:
                                          Colors.white,),),),
                                Expanded(child:
                                  Divider(thickness:
                                      0.7, color:
                                      Colors.white,),),
                              ],
                            ),
                  const SizedBox(height:
                          20.0,),
                  Row(mainAxisAlignment:
                          MainAxisAlignment.spaceEvenly, children:[
                              // Add logos for social login here
                            ],
                          ),
                  TextButton(onPressed:
                          () { Navigator.pop(context); },
                            child:
                              const Text('Already have an account? Login',
                                style :TextStyle(color :
                                  Colors.white),),)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}