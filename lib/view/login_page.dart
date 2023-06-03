import 'package:flutter/material.dart';
import 'package:flutter_form_input_app/view/homepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: Form(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(100),
                //   color: Colors.white,
                //   //shadow
                //   boxShadow: [
                //     BoxShadow(
                //       color: Colors.grey.withOpacity(0.5),
                //       spreadRadius: 0.5, //how far shadow
                //       blurRadius: 10, //soften shadow
                //       // offset: Offset(0, 3), //move shadow
                //     ),
                //   ],
                // ),
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Image.network(
                    'https://www.topjobcambodia.com/photos/social/20190711-153302-cam_asean.jpg',
                    // 'https://www.camsolution.biz/images/605dadfc6270e.png',
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: CustomTextField(
                  controller: _emailController,
                  hintText: 'Email',
                  labelText: 'Enter Your Email',
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: CustomTextField(
                  controller: _passwordController,
                  hintText: 'Password',
                  labelText: 'Enter Your Password',
                  prefixIcon: Icon(Icons.password),
                  isPassword: true,
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // print(_emailController.text);
                      // print(_passwordController.text);
                      // print(_emailController.text.runtimeType);
                      // var email = int.parse(_emailController.text);
                      // print(email.runtimeType);
                      // setState(() {
                      //   _emailController.text;
                      //   _passwordController.text;
                      // });
                      // if (_formKey.currentState!.validate()) {
                      //   // final route = MaterialPageRoute(
                      //   //   builder: (context) => Homepage(
                      //   //     email: _emailController.text,
                      //   //     password: _passwordController.text,
                      //   //   ),
                      //   // );
                      //   // // Navigator.of(context).pushReplacement(route);
                      //   // Navigator.of(context).push(route);
                      //   // show snackbar
                      //   SnackBar snackBar = SnackBar(
                      //     content: Text('Please enter email and password'),
                      //   );
                      //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      // } else {
                      //   // show snackbar
                      //   SnackBar snackBar = SnackBar(
                      //     content: Text('Please enter email and password'),
                      //   );
                      //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      // }

                      final route = MaterialPageRoute(
                        builder: (context) => Homepage(
                          email: _emailController.text,
                          password: _passwordController.text,
                        ),
                      );
                      // Navigator.of(context).pushReplacement(route);
                      Navigator.of(context).push(route);
                    },
                    icon: Icon(Icons.login),
                    label: Text('Login'),
                  ),
                ),
              ),
              Divider(),
              Text('Email: ${_emailController.text}'),
              SizedBox(height: 10),
              Text('Password: ${_passwordController.text}'),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    this.controller,
    this.labelText,
    this.hintText,
    this.prefixIcon,
    this.isPassword = false,
  }) : super(key: key);

  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final Icon? prefixIcon;
  final bool isPassword;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _hidePassword;

  @override
  void initState() {
    super.initState();
    _hidePassword = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      // obscureText: widget.isPassword ? true : false,
      obscureText: _hidePassword,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        labelText: widget.labelText,
        hintText: widget.labelText,
        // prefixIcon: Icon(Icons.password),
        prefixIcon: widget.prefixIcon,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.green,
            width: 2.0,
          ),
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    _hidePassword = !_hidePassword;
                  });
                },
                icon: Icon(
                  _hidePassword ? Icons.visibility : Icons.visibility_off,
                ),
              )
            : null,
      ),
    );
  }
}
