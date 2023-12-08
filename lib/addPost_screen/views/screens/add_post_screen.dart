import 'package:flutter/material.dart';
import 'package:mafqood/core/utilis/styles.dart';
import '../../../core/shared_widgets/continue_button.dart';
import '../../../core/shared_widgets/text_form_field.dart';
import '../../../core/shared_widgets/text_widget.dart';

class AddPostScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Container(
                            height: 33,
                            width: 33,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35),
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Color.fromRGBO(106, 66, 132, 1.0),
                            Color.fromRGBO(224, 136, 72, 1.0),
                          ],
                        ),
                      ),

                      height: 300,
                      width: double.infinity,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0 , vertical: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: (){},
                            child: Container(
                              child: Icon(Icons.arrow_back_sharp,color: Colors.white,),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.0),
                                border: Border.all(
                                  width: 1.0,
                                  color: Colors.white,
                                ),
                              ),
                              height: 35,
                              width: 35,
                            ),
                          ),
                          SizedBox(
                            height: 25.0,
                          ),
                          TextWidget(text: 'Create a post', textStyle: Styles.textStyle3,),
                          SizedBox(height: 10,),
                          TextWidget(text: 'Please enter the details below to help us find the person you lost', textStyle: Styles.textStyle4,),
                        ],
                      ),
                    ),
                  ],
                ),
                Spacer(),
                ContinueButtonWidget(text: 'Create',),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100 , left: 15 , right: 15),
              child: Center(
                child: Expanded(
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child:SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(text: 'Full Name', textStyle: Styles.textStyle5),
                            SizedBox(
                              height:10.0,
                            ),
                            TextFormFieldWidget(text: 'Enter the Full name of the person', textInputAction: TextInputAction.next, textInputType: TextInputType.text, hidePassword: false, color: Colors.black87, heightOfTextFormField: 50.0,),
                            SizedBox(
                              height:25.0,),
                            TextWidget(text: 'Enter location', textStyle: Styles.textStyle5),
                            SizedBox(
                              height:10.0,
                            ),
                            TextFormFieldWidget(text: 'Enter the location where you lost the person', textInputAction: TextInputAction.next, textInputType: TextInputType.text, hidePassword: true, color: Colors.black87, heightOfTextFormField: 50.0,),
                           SizedBox(height: 25,),
                            Row(
                              children: [
                                InkWell(
                                  child: Container(
                                    child: Center(child: TextWidget(text: 'Attatch files', textStyle: Styles.textStyle6, )),
                                    height: 34,
                                    width: 111,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 0.3,
                                          color: Color.fromRGBO(
                                          109, 102, 114, 1.0)),
                                      color: Color.fromRGBO(217, 217, 217, 1.0),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: TextWidget(text: 'Drag & drop any images or \n documents. ', textStyle: Styles.textStyle7),
                                ),
                              ],
                            ),
                            SizedBox(
                              height:25.0,
                            ),
                            TextWidget(text: 'Gender', textStyle: Styles.textStyle5),
                            SizedBox(
                              height:10.0,
                            ),
                            Row(
                              children: [
                                 CircleAvatar(
                                   radius: 10,
                                   backgroundColor: Color.fromRGBO(
                                       224, 136, 72, 1.0),
                                 ),
                                SizedBox(
                                  width: 3.0,
                                ),
                                TextWidget(text: 'Female', textStyle: Styles.textStyle6),
                                SizedBox(
                                  width: 10.0,
                                ),
                                CircleAvatar(
                                  radius: 10,
                                  backgroundColor: Colors.black45


                                ),
                                SizedBox(
                                  width: 3.0,
                                ),

                                TextWidget(text: 'Male', textStyle: Styles.textStyle6),




                              ],
                            ),
                            SizedBox(
                              height:25.0,
                            ),

                            TextWidget(text: 'Description', textStyle: Styles.textStyle5),
                            SizedBox(
                              height:10.0,
                            ),
                            TextFormFieldWidget(
                              text: 'Enter description here..', textInputAction: TextInputAction.next, textInputType: TextInputType.text, hidePassword: false, color: Colors.black87, heightOfTextFormField: 134.0,),




                          ],
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    height:350,
                    width: double.infinity,
                  ),
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}
