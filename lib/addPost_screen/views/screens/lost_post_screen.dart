
import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../../../core/shared_widgets/text_form_field_widget.dart';
import '../../../core/shared_widgets/text_widget.dart';
import '../../../core/utilis/styles.dart';

class LostPostScreen extends StatelessWidget {
  const LostPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> items = [
      'Male',
      'Female',
    ];
    String? selectedValue;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                children: [
                  Container(
                    height: 336.0,
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
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: ()
                            {
                              Navigator.pop(context);

                            },
                            child: Container(
                              child: Icon(
                                Icons.arrow_back_sharp,
                                color: Colors.white,
                              ),
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
                          TextWidget(text: 'Create a post', textStyle: Styles.textStyle20Black),
                          SizedBox(
                            height: 10,
                          ),
                          TextWidget(
                            text: 'Please enter the details below to help us find the person you lost',
                            textStyle: Styles.textStyle13White,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 222.0, left: 15.0, right: 15.0),
                    child:Container(
                      width: 382,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 30.0, left: 16.0, right: 16.0 , bottom: 26.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(text: 'Full Name', textStyle: Styles.textStyle15Grey),
                            SizedBox(
                              height: 10.0,
                            ),
                            TextFormFieldWidget(
                              text: 'Enter the Full name of the person you lost',
                              textInputAction: TextInputAction.next,
                              textInputType: TextInputType.text,
                              hidePassword: false,
                              color: Colors.black87,
                              heightOfTextFormField: 50.0,
                            ),
                            SizedBox(
                              height: 25.0,
                            ),
                            TextWidget(text: 'Enter Country', textStyle: Styles.textStyle15Grey),
                            SizedBox(
                              height: 10.0,
                            ),
                            TextFormFieldWidget(
                              text: 'Enter the country where you lost the person',
                              textInputAction: TextInputAction.next,
                              textInputType: TextInputType.text,
                              hidePassword: true,
                              color: Colors.black87,
                              heightOfTextFormField: 50.0,
                            ),
                            SizedBox(
                              height: 25.0,
                            ),


                            TextWidget(text: 'Enter City', textStyle: Styles.textStyle15Grey),
                            SizedBox(
                              height: 10.0,
                            ),
                            TextFormFieldWidget(
                              text: 'Enter the city where you lost the person',
                              textInputAction: TextInputAction.next,
                              textInputType: TextInputType.text,
                              hidePassword: true,
                              color: Colors.black87,
                              heightOfTextFormField: 50.0,
                            ),
                            SizedBox(
                              height: 25.0,
                            ),


                            TextWidget(text: 'Enter State', textStyle: Styles.textStyle15Grey),
                            SizedBox(
                              height: 10.0,
                            ),
                            TextFormFieldWidget(
                              text: 'Enter the state where you lost the person',
                              textInputAction: TextInputAction.next,
                              textInputType: TextInputType.text,
                              hidePassword: true,
                              color: Colors.black87,
                              heightOfTextFormField: 50.0,
                            ),

                            SizedBox(height: 40),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(5.0),
                              child: DottedBorder(
                                color: Color.fromRGBO(217, 217, 217, 1.0),
                                strokeWidth: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Row(
                                    children: [
                                      InkWell(
                                        child: Container(
                                          child: Center(
                                            child: TextWidget(
                                              text: 'Select Image',
                                              textStyle: Styles.textStyle13Black,
                                            ),
                                          ),
                                          height: 34,
                                          width: 111,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 0.3,
                                                color: Color.fromRGBO(
                                                    217, 217, 217, 1.0)),
                                            color: Color.fromRGBO(248, 248, 248, 1.0),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 15),
                                      Expanded(
                                        child: TextWidget(
                                          text: 'Choose a picture of the missing person.',
                                          textStyle: Styles.textStyle10Black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(
                              height: 40.0,
                            ),
                            TextWidget(text: 'Gender', textStyle: Styles.textStyle15Grey),
                            SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 10,
                                  backgroundColor: Color.fromRGBO(224, 136, 72, 1.0),
                                ),
                                SizedBox(
                                  width: 3.0,
                                ),
                                TextWidget(text: 'Female', textStyle: Styles.textStyle13Black),
                                SizedBox(
                                  width: 10.0,
                                ),
                                CircleAvatar(
                                  radius: 10,
                                  backgroundColor: Colors.black45,
                                ),
                                SizedBox(
                                  width: 3.0,
                                ),
                                TextWidget(text: 'Male', textStyle: Styles.textStyle13Black),
                              ],
                            ),
                            SizedBox(
                              height: 25.0,
                            ),
                            Row(
                              children: [
                                TextWidget(text: 'Description', textStyle: Styles.textStyle15Grey),
                                TextWidget(text: ' (optional)', textStyle: Styles.textStyle15Grey),
                              ],
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            TextWidget(text: 'If there is a distinctive mark or disability in the person, please write it.', textStyle:TextStyle(
                              fontSize: 13.0,

                            )),
                            SizedBox(
                              height: 10.0,
                            ),

                            TextFormFieldWidget(
                              text: 'Enter description here..',
                              textInputAction: TextInputAction.done,
                              textInputType: TextInputType.text,
                              hidePassword: false,
                              color: Colors.black87,
                              // heightOfTextFormField: 500.0,
                            ),
                            SizedBox(
                              height: 25.0,
                            ),
                            TextWidget(text: 'What is the age of the person you lost are required?', textStyle: Styles.textStyle15Grey),
                            SizedBox(
                              height: 10.0,
                            ),
                            TextWidget(text:'Please enter the age of the person you lost.', textStyle: TextStyle(
                              fontSize: 13.0,

                            )),
                            SizedBox(
                              height: 10.0,
                            ),
                            Center(
                              child: Container(
                                width: double.infinity,
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton2<String>(
                                    isExpanded: true,
                                    hint: const Row(
                                      children: [
                                        SizedBox(
                                          width: 4,
                                        ),
                                        Expanded(
                                          child: Text(
                                            'Select Range of Age',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black87,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                    items: items
                                        .map((String item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(
                                        item,
                                        style: const TextStyle(
                                          fontSize: 13,
                                          color: Colors.black87,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ))
                                        .toList(),
                                    value: selectedValue,
                                    onChanged: (String? value) {

                                    },
                                    buttonStyleData: ButtonStyleData(
                                      height: 50,
                                      width: 160,
                                      padding: const EdgeInsets.only(left: 14, right: 14),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(14),
                                        border: Border.all(
                                          color: Color.fromRGBO(109, 102, 114, 1.0),
                                        ),
                                        color: Colors.white,
                                      ),
                                      // elevation: 2,
                                    ),
                                    iconStyleData: const IconStyleData(
                                      icon: Icon(
                                        Icons.arrow_forward_ios_outlined,
                                      ),
                                      iconSize: 14,
                                      iconEnabledColor: Colors.black87,
                                      iconDisabledColor: Colors.blue,
                                    ),
                                    dropdownStyleData: DropdownStyleData(
                                      maxHeight: 200,
                                      width: 200,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(14),
                                        color: Colors.white,
                                      ),
                                      offset: const Offset(-20, 0),
                                      scrollbarTheme: ScrollbarThemeData(
                                        radius: const Radius.circular(40),
                                        thickness: MaterialStateProperty.all<double>(6),
                                        thumbVisibility: MaterialStateProperty.all<bool>(true),
                                      ),
                                    ),
                                    menuItemStyleData: const MenuItemStyleData(
                                      height: 40,
                                      padding: EdgeInsets.only(left: 14, right: 14),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40.0,
                            ),

                            Container(
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
                                  textStyle: Styles.textStyle15White, text: 'Create',
                                ),
                              ),
                              height: 48.0,
                              width: double.infinity,
                            ),
                          ],
                        ),
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

