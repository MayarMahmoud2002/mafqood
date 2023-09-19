import 'package:flutter/material.dart';
import 'package:mafqood/core/shared_widgets/text_widget.dart';
import 'package:mafqood/core/utilis/styles.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}


class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromRGBO(24, 13, 31, 1.0),
        // appBar: AppBar(
        //   backgroundColor: Colors.white,
        //   elevation: 0.0,
        //   title: Center(
        //     child: Text('Sign Up',
        //     textAlign: TextAlign.center,
        //     style: TextStyle(
        //       color: Colors.black87,
        //     ),
        //     ),
        //   ),
        // ),
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Color.fromRGBO(24, 13, 31, 1.0),
          leading: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: IconButton( onPressed: () {  }, icon: Icon(Icons.arrow_back_ios ),),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 35, left: 20.0, right: 20.0),
              child: Row(
                children: [
                  TextWidget(
                      text: 'Create New Account', textStyle: Styles.textStyle2),
                  Spacer(),
                  TextWidget(text: '1/4', textStyle: Styles.textStyle1)
                ],
              ),
            ),
            SizedBox(
              height: 35.0,
            ),
            Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 2.0,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Color.fromRGBO(88, 45, 92, 1.0),
                          Color.fromRGBO(177, 104, 79, 1.0),
                        ]),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 35.0,
                  ),
                  TextWidget(
                      text: 'Full Legal Name&National Id',
                      textStyle: Styles.textStyle1),
                  SizedBox(
                    height: 40.0,
                  ),
                  TextFormField(
                    cursorColor: Colors.white,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Please enter your Full Name',
                      labelStyle: TextStyle(
                        color: Color.fromRGBO(109, 102, 114, 1.0),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                            color: Color.fromRGBO(109, 102, 114, 1.0),
                          )),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: Color.fromRGBO(109, 102, 114, 1.0),
                          )),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: Color.fromRGBO(109, 102, 114, 1.0),
                          )
                      ),
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: Color.fromRGBO(109, 102, 114, 1.0),
                          ),

                      ),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(color: Colors.red)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(

                          color: Color.fromRGBO(109, 102, 114, 1.0),
                        ),

                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  TextFormField(

                    cursorColor: Colors.white,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Please enter your National Id',
                      labelStyle: TextStyle(
                        color: Color.fromRGBO(109, 102, 114, 1.0),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: Color.fromRGBO(109, 102, 114, 1.0),
                          )),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: Color.fromRGBO(109, 102, 114, 1.0),
                          )),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: Color.fromRGBO(109, 102, 114, 1.0),
                          )),
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: Color.fromRGBO(109, 102, 114, 1.0),
                          )),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(color: Colors.red)),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 25.0),
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Color.fromRGBO(88, 45, 92, 1.0),
                          Color.fromRGBO(177, 104, 79, 1.0),
                        ]),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6.0)),
                child: Center(
                  child: MaterialButton(
                    onPressed: () {},
                    child: TextWidget(
                      text: 'Continue',
                      textStyle: Styles.textStyle1,
                    ),
                  ),
                ),
                height: 55.0,
                width: double.infinity,
              ),
            ),
          ],
        ));
  }
}
