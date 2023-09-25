import 'package:flutter/material.dart';
import 'package:gradient_borders/input_borders/gradient_outline_input_border.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:mafqood/core/shared_widgets/text_form_field.dart';
import 'package:mafqood/core/shared_widgets/text_widget.dart';
import 'package:mafqood/core/utilis/styles.dart';
import '../../../../core/shared_widgets/container_line.dart';
import '../../../../core/shared_widgets/title.dart';

class SignUpScreen3 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(24, 13, 31, 1.0),
        resizeToAvoidBottomInset: false,

        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Color.fromRGBO(24, 13, 31, 1.0),
          leading: Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_back_ios),
              color: Colors.white,
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30.0,
            ),
            TitleOfScreen(
              text: 'Create New Account',
              number: '3/4',
            ),
            SizedBox(
              height: 35.0,
            ),
            ContainerLineWidget(),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 35.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(text: 'Phone Number', textStyle: Styles.textStyle1,),
                  SizedBox(
                    height: 40.0,
                  ),
                                              IntlPhoneField(
              pickerDialogStyle: PickerDialogStyle(
                searchFieldCursorColor: Colors.black87,
              ),
              autofocus: true,
              dropdownTextStyle: TextStyle(
                color: Colors.white,
              ),
              cursorColor: Colors.white,
              style: TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                labelText: 'Enter your Phone Number',
                labelStyle: TextStyle(
                    color: Color.fromRGBO(109, 102, 114, 1.0),
                    fontSize: 12.0
                ),

                border: OutlineInputBorder(
                  borderSide: BorderSide(),
                ),              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(
                  color: Color.fromRGBO(109, 102, 114, 1.0),
                ),

              ),
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
                focusedBorder: GradientOutlineInputBorder(
                    gradient: LinearGradient(colors: [     Color.fromRGBO(177, 104, 79, 1.0),
                      Color.fromRGBO(88, 45, 92, 1.0),
                    ])
                ),
              ),
              initialCountryCode: 'IN',
              onChanged: (phone) {
                print(phone.completeNumber);
              },
            ),




                ],
              ),
            ),


            Spacer(),
            Padding(
              padding:
              const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 25.0),
              child: GestureDetector(
                onTap: ()
                {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  SignUpScreen3()),
                  );

                },
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color.fromRGBO(88, 45, 92, 1.0),
                        Color.fromRGBO(177, 104, 79, 1.0),
                      ],
                    ),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: Center(
                    child: TextWidget(
                      text: 'Continue',
                      textStyle: Styles.textStyle1,
                    ),
                  ),
                  height: 55.0,
                  width: double.infinity,
                ),
              ),
            ),

            // ContinueButtonWidget(),

            // TextFor
            // mFieldOfSignUp(),
            // Spacer(),
            // ContinueButtonWidget(),
          ],
        ));

  }
}


