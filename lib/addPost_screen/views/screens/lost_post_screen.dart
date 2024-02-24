import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mafqood/classes/new_post_model.dart';
import 'package:mafqood/core/shared_widgets/flush_bar.dart';
import 'package:mafqood/home_screen/presentation/views/screen/main_screen.dart';
import '../../../classes/post_model.dart';
import '../../../core/shared_widgets/text_form_field_widget.dart';
import '../../../core/shared_widgets/text_widget.dart';
import '../../../core/utilis/shared_methods.dart';
import '../../../core/utilis/styles.dart';
import '../../../persons_bloc/persons_bloc.dart';

class LostPostScreen extends StatefulWidget {
   String? nameMissed;
   String? descriptionMissed;
   String? countryMissed;
   String? stateMissed;
   int? id;
   String? cityMissed;
   String? selectedValueEdit;
   DateTime? LostEdit;
   LostPostScreen({this.id,this.cityMissed,this.countryMissed,this.descriptionMissed,this.LostEdit,this.nameMissed,this.selectedValueEdit,this.stateMissed});
  @override
  State<LostPostScreen> createState() => _LostPostScreenState();
}

class _LostPostScreenState extends State<LostPostScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameLostController.text = widget.nameMissed ?? "";
    descriptionLostController.text = widget.descriptionMissed ?? "";
    countryLostController.text = widget.countryMissed ?? "";
    stateLostController.text = widget.stateMissed ?? "";
    cityLostController.text = widget.cityMissed ?? "";
    selectedValue = widget.selectedValueEdit ;
    foundedLost = widget.LostEdit ?? null;
  }

  final TextEditingController nameLostController = TextEditingController();

  final TextEditingController descriptionLostController = TextEditingController();

  final TextEditingController countryLostController = TextEditingController();

  final TextEditingController stateLostController = TextEditingController();

  final TextEditingController cityLostController = TextEditingController();

   DateTime? foundedLost;

  String imgPath="";

   final List<String> items = [
     'Male',
     'Female',
   ];

   String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PersonsBloc, PersonsState>(
      listener: (context, state) {
        if (state is AddFoundedOrMissingPersonSuccess) {
          showFlushBar("Added Successfully", isError: false);
          EasyLoading.dismiss();
          Future.delayed(Duration(seconds: 1), () {
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => MainScreen()), (route) => false);
          });
        } else if (state is AddFoundedOrMissingPersonFailure) {
          showFlushBar(state.error);
          EasyLoading.dismiss();
        }else if (state is UpdateFoundedOrMissingPersonSuccess) {
          showFlushBar("Updated Successfully", isError: false);
          EasyLoading.dismiss();
          Future.delayed(Duration(seconds: 1), () {
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => MainScreen()), (route) => false);
          });
        } else if (state is UpdateFoundedOrMissingPersonFailure) {
          showFlushBar(state.error);
          EasyLoading.dismiss();
        }else if (state is AddFoundedOrMissingPersonLoading || state is UpdateFoundedOrMissingPersonLoading) {
          EasyLoading.show(status: 'loading...');
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            key: _scaffoldKey,
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
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 25),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {
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
                              TextWidget(
                                  text: 'Create a post',
                                  textStyle: Styles.textStyle20Black),
                              SizedBox(
                                height: 10,
                              ),
                              TextWidget(
                                text:
                                    'Please enter the details below to help us find the person you lost',
                                textStyle: Styles.textStyle13White,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 222.0, left: 15.0, right: 15.0),
                        child: Container(
                          width: 382,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 30.0,
                                left: 16.0,
                                right: 16.0,
                                bottom: 26.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWidget(
                                    text: 'Full Name',
                                    textStyle: Styles.textStyle15Grey),
                                SizedBox(
                                  height: 10.0,
                                ),
                                TextFormFieldWidget(
                                  controller: nameLostController,
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
                                TextWidget(
                                    text: 'Enter Country',
                                    textStyle: Styles.textStyle15Grey),
                                SizedBox(
                                  height: 10.0,
                                ),
                                TextFormFieldWidget(
                                  controller: countryLostController,
                                  text: 'Enter the country where you lost the person',
                                  textInputAction: TextInputAction.next,
                                  textInputType: TextInputType.text,
                                  hidePassword: false,
                                  color: Colors.black87,
                                  heightOfTextFormField: 50.0,
                                ),
                                SizedBox(
                                  height: 25.0,
                                ),
                                TextWidget(
                                    text: 'Enter City',
                                    textStyle: Styles.textStyle15Grey),
                                SizedBox(
                                  height: 10.0,
                                ),
                                TextFormFieldWidget(
                                  controller: cityLostController,
                                  text: 'Enter the city where you lost the person',
                                  textInputAction: TextInputAction.next,
                                  textInputType: TextInputType.text,
                                  hidePassword: false,
                                  color: Colors.black87,
                                  heightOfTextFormField: 50.0,
                                ),
                                SizedBox(
                                  height: 25.0,
                                ),
                                TextWidget(
                                    text: 'Enter State',
                                    textStyle: Styles.textStyle15Grey),
                                SizedBox(
                                  height: 10.0,
                                ),
                                TextFormFieldWidget(
                                  controller: stateLostController,
                                  text: 'Enter the state where you lost the person',
                                  textInputAction: TextInputAction.next,
                                  textInputType: TextInputType.text,
                                  hidePassword: false,
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
                                      child:
                                      (imgPath != "")?
                                      Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Image.file(File(imgPath), height: MediaQuery.of(context).size.height*0.5, width: MediaQuery.of(context).size.width*0.85, fit: BoxFit.cover),

                                          Positioned(
                                            right: 0,
                                            top: 0,
                                            child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  imgPath = "";
                                                });
                                              },
                                              child: Container(
                                                height: 30,
                                                width: 30,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.circular(50.0),
                                                ),
                                                child: Icon(Icons.close, color: Colors.black,),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ) :
                                      Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              showModalBottomSheet(context: context, builder: (BuildContext context) {
                                                return Container(
                                                  height: MediaQuery.of(context).size.height * 0.18,
                                                  color: Colors.white,
                                                  child: Column(
                                                    children: [
                                                      ListTile(
                                                        leading: Icon(Icons.camera_alt),
                                                        title: Text('Camera'),
                                                        onTap: () async {
                                                          var image = await ImagePicker().pickImage(source: ImageSource.camera);
                                                          if (image != null) {
                                                            setState(() {
                                                              imgPath = image.path;
                                                            });
                                                          }
                                                          Navigator.pop(context);
                                                        },
                                                      ),
                                                      ListTile(
                                                        leading: Icon(Icons.photo),
                                                        title: Text('Gallery'),
                                                        onTap: () async{
                                                          var image =await ImagePicker().pickImage(source: ImageSource.gallery);
                                                          if (image != null) {
                                                            setState(() {
                                                              imgPath = image.path;
                                                            });
                                                          }
                                                          Navigator.pop(context);
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              });
                                            },
                                            child: Container(
                                              child: Center(
                                                child: TextWidget(
                                                  text: 'Select Image',
                                                  textStyle:
                                                      Styles.textStyle13Black,
                                                ),
                                              ),
                                              height: 34,
                                              width: 111,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 0.3,
                                                    color: Color.fromRGBO(
                                                        217, 217, 217, 1.0)),
                                                color: Color.fromRGBO(
                                                    248, 248, 248, 1.0),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 15),
                                          Expanded(
                                            child: TextWidget(
                                              text:
                                                  'Choose a picture of the missing person.',
                                              textStyle:
                                                  Styles.textStyle10Black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 25.0,
                                ),
                                Row(
                                  children: [
                                    TextWidget(
                                        text: 'Description',
                                        textStyle: Styles.textStyle15Grey),
                                    TextWidget(
                                        text: ' (optional)',
                                        textStyle: Styles.textStyle15Grey),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                TextWidget(
                                    text:
                                        'If there is a distinctive mark or disability in the person, please write it.',
                                    textStyle: TextStyle(
                                      fontSize: 13.0,
                                    )),
                                SizedBox(
                                  height: 10.0,
                                ),
                                TextFormFieldWidget(
                                  controller: descriptionLostController,
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
                                TextWidget(
                                    text:
                                        'Gender',
                                    textStyle: Styles.textStyle15Grey),
                                SizedBox(
                                  height: 10.0,
                                ),
                                TextWidget(
                                    text:
                                        'Please enter the gender of the person you lost.',
                                    textStyle: TextStyle(
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
                                        hint: Row(
                                          children: [
                                            SizedBox(
                                              width: 4,
                                            ),
                                            Expanded(
                                              child: Text(
                                                'Select Gender',
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
                                        onChanged: (value) {
                                          setState(() {
                                            selectedValue = value;
                                          });
                                        },
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
                                        value: selectedValue,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 25.0,
                                ),
                                TextWidget(
                                    text: 'Lost At',
                                    textStyle: Styles.textStyle15Grey),
                                SizedBox(
                                  height: 10.0,
                                ),
                                TextWidget(
                                    text:
                                        'Please enter the date when you lost the person.',
                                    textStyle: TextStyle(
                                      fontSize: 13.0,
                                    )),
                                SizedBox(
                                  height: 10.0,
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(5.0),
                                  child: DottedBorder(
                                    color: Color.fromRGBO(217, 217, 217, 1.0),
                                    strokeWidth: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child:

                                      Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime(2023),
                                                lastDate: DateTime.now(),
                                              ).then((value) {
                                                setState(() {
                                                  foundedLost = value;
                                                });
                                              });                                            },
                                            child: Container(
                                              child: Center(
                                                child: TextWidget(
                                                  text: foundedLost != null
                                                      ?"Change Date"
                                                      : 'Select Date',
                                                  textStyle:
                                                  Styles.textStyle13Black,
                                                ),
                                              ),
                                              height: 34,
                                              width: 111,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 0.3,
                                                    color: Color.fromRGBO(
                                                        217, 217, 217, 1.0)),
                                                color: Color.fromRGBO(
                                                    248, 248, 248, 1.0),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 15),
                                          Expanded(
                                            child: foundedLost != null
                                                ? Align(
                                                alignment: Alignment.center,
                                                  child: TextWidget(

                                                  text: foundedLost!.year.toString() +
                                                      '-' +
                                                      foundedLost!.month.toString() +
                                                      '-' +
                                                      foundedLost!.day.toString(),
                                                  textStyle: Styles.textStyle15Black),
                                                )
                                                : Align(
                                              alignment: Alignment.center,
                                              child: TextWidget( text: 'No Date Selected',
                                                  textStyle: Styles.textStyle15Black),
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
                                InkWell(
                                  onTap: ()
                                  async {
                                    if (widget.id==null)
                                      context.read<PersonsBloc>().add(
                                          AddFoundedOrMissingPersonEvent(postModel:
                                          NewPostModel(
                                            personType: PersonType.missingPerson,
                                            city: cityLostController.text,
                                            country:  countryLostController.text,
                                            date:  foundedLost.toString(),
                                            description: descriptionLostController.text,
                                            gender:  selectedValue.toString().toLowerCase(),
                                            name: nameLostController.text,
                                            image: imgPath,
                                            state: stateLostController.text,
                                          ),personType: PersonType.missingPerson
                                          ));
                                    else
                                      context.read<PersonsBloc>().add(
                                        UpdateFoundedOrMissingPersonEvent(

                                            newPostModel: NewPostModel(
                                                personType: PersonType.missingPerson,
                                                city: cityLostController.text,
                                                country:  countryLostController.text,
                                                date:  foundedLost.toString(),
                                                description: descriptionLostController.text,
                                                gender:  selectedValue.toString().toLowerCase(),
                                                name: nameLostController.text,
                                                image: imgPath,
                                                state: stateLostController.text,
                                                id: widget.id
                                            ),
                                            personType: PersonType.missingPerson,
                                            oldPostModel: NewPostModel(
                                                personType: PersonType.missingPerson,
                                                city: widget.cityMissed,
                                                country:  widget.countryMissed,
                                                date:  widget.LostEdit.toString(),
                                                description: widget.descriptionMissed,
                                                gender:  widget.selectedValueEdit.toString().toLowerCase(),
                                                name: widget.nameMissed,
                                                image: imgPath,
                                                state: widget.stateMissed,
                                                id: widget.id
                                            )
                                        ),


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
                                        textStyle: Styles.textStyle15White,
                                        text: 'Create',
                                      ),
                                    ),
                                    height: 48.0,
                                    width: double.infinity,
                                  ),
                                ),
                                //******
                                SizedBox(
                                  height : 15.0,
                                ),
                                // InkWell(
                                //   onTap: ()
                                //   {
                                //     // context.read<LostPersonBloc>().add(
                                //     //     UpdateLostFormEvent(
                                //     //         personId: 1,
                                //     //         updatedData:
                                //     //         {
                                //     //           'name' : nameLostController.text,
                                //     //           'gender' : genderLostController.text,
                                //     //           'description' : descriptionLostController.text,
                                //     //           'country' : countryLostController.text,
                                //     //           'state' : stateLostController.text,
                                //     //           'city' : cityLostController.text,
                                //     //           'founded_at' : foundedLostAtController.text,
                                //     //           'image' : imageLostController.text ,
                                //     //
                                //     //         })
                                //     //
                                //     //    );
                                //   },
                                //   child: Container(
                                //     decoration: BoxDecoration(
                                //       gradient: LinearGradient(
                                //         begin: Alignment.bottomRight,
                                //         end: Alignment.bottomLeft,
                                //         colors: [
                                //           Color.fromRGBO(88, 45, 92, 1.0),
                                //           Color.fromRGBO(177, 104, 79, 1.0),
                                //         ],
                                //       ),
                                //       color: Colors.white,
                                //       borderRadius: BorderRadius.circular(6.0),
                                //     ),
                                //     child: Center(
                                //       child: TextWidget(
                                //         textStyle: Styles.textStyle15White,
                                //         text: 'Update',
                                //       ),
                                //     ),
                                //     height: 48.0,
                                //     width: double.infinity,
                                //   ),
                                // ),
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
      },
    );
  }
}
