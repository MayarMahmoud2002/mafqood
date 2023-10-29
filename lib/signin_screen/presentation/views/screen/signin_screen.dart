import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 90.0, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 70.0,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Phone number',
                  labelStyle: TextStyle(
                      color: Colors.black
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                          color: Colors.black
                      )

                  ),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                          color: Colors.black
                      )

                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                          color: Colors.black
                      )

                  ),
                  disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                          color: Colors.black
                      )

                  ),
                  prefixIcon: Icon(Icons.phone),
                ),
              ),
              SizedBox(
                height: 35.0,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(
                      color: Colors.black45
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                          color: Colors.black45
                      )

                  ),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                          color: Colors.black
                      )

                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                          color: Colors.black
                      )

                  ),
                  disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                          color: Colors.black
                      )

                  ),
                  prefixIcon: Icon(Icons.lock_outline),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              const Text(
                'Forgot password?',
                style: TextStyle(
                    fontSize: 10.0,
                    fontFamily: 'Lato',
                    color: Colors.black

                ),
              ),
              SizedBox(
                height: 35.0,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.black,

                    borderRadius: BorderRadius.circular(5.0)
                ),
                height: 45.0,
                width: double.infinity,
                child: Center(child: Text('Sign in',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Lato',

                  ),
                )),
              ),
              SizedBox(
                height: 22.0,
              ),
               Row(
                mainAxisAlignment: MainAxisAlignment.center,


                children: [
                  Center(
                    child: Text(
                      'Don\'t have an account?',
                      style: TextStyle(
                          color: Colors.black,
                      ),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {  },
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Lato',
                        decorationThickness: 0.8,
                        decoration: TextDecoration.underline,

                      ),

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
