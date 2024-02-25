import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mafqood/core/shared_widgets/container_widget.dart';
import 'package:mafqood/core/utilis/styles.dart';
import 'package:mafqood/home_screen/presentation/views/screen/main_screen.dart';
import 'package:mafqood/splash_screen/presentation/views/screens/splash_screen.dart';
import '../../../../classes/get_profile_data.dart';
import '../../../../core/shared_widgets/back_button_widget.dart';
import '../../../../core/shared_widgets/flush_bar.dart';
import '../../../../core/shared_widgets/text_form_field_widget.dart';
import '../../../../core/shared_widgets/text_widget.dart';
import '../../../../core/utilis/colors.dart';
import '../../../../profile_bloc/profile_bloc.dart';

class ProfileScreen1 extends StatefulWidget {
  @override
  State<ProfileScreen1> createState() => _ProfileScreen1State();
}

class _ProfileScreen1State extends State<ProfileScreen1> {
  late BuildContext storedContext;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  String? selectedValue;
  final List<String> items = [
    'Male',
    'Female',
  ];
  String? imgPath;

  @override
  Widget build(BuildContext context) {
    storedContext = context;
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state is GetProfileDataLoading) {
          EasyLoading.show(status: 'loading...');
        } else if (state is GetProfileDataFailure) {
          EasyLoading.dismiss();
          return Scaffold(
            backgroundColor: ScreensColors.primaryColor,
            body: Center(
              child: Text('error'),
            ),
          );
        } else if (state is GetProfileDataSuccess) {
          EasyLoading.dismiss();
          return buildProfileContent(state.user);
        }else if (state is DeleteProfileLoading) {
          EasyLoading.show(status: 'loading...');
        } else if (state is DeleteProfileFailure) {
          showFlushBar(state.error);
          EasyLoading.dismiss();
        } else if (state is DeleteProfileSuccess) {
          EasyLoading.dismiss();
          Future.delayed(Duration(milliseconds: 500),(){
            showFlushBar('logged out successfully');
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => SplashScreen()), (route) => false);
          });
        }else if (state is UpdateProfileLoading){
          EasyLoading.show(status: 'loading...');
        } else if (state is UpdateProfileFailure) {
          EasyLoading.dismiss();
          showFlushBar(state.error);
        } else if (state is UpdateProfileSuccess) {
          Future.delayed(Duration(milliseconds: 500),(){
            showFlushBar('Profile updated successfully',isError: false);
            BlocProvider.of<ProfileBloc>(storedContext).add(GetProfileDataEvent());
          });

        }
        return Scaffold(
          backgroundColor: ScreensColors.primaryColor,

        );
      });

  }

  Widget buildProfileContent(User user) {
    nameController.text = user.name??"";
    phoneController.text=user.phone??"";
    cityController.text=user.city??"";
    stateController.text=user.state??"";
    countryController.text=user.country??"";


    return SafeArea(
      child: Scaffold(
        backgroundColor: ScreensColors.primaryColor,
        body: Padding(
          padding: const EdgeInsets.only(top: 25.0, left: 15 , right: 15.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15.0,
                ),
                Center(
                  child: Stack(
                    children: [
                      (user.profileimage!=null&&user.profileimage!.isNotEmpty)? CircleAvatar(
                        radius: 75,
                        backgroundImage: NetworkImage(user.profileimage!),
                      ):CircleAvatar(
                        backgroundColor: ScreensColors.orangeColor,
                        radius:75 ,
                        child: Icon(Icons.person,size: 75,),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: InkWell(
                          onTap: (){
                            showModalBottomSheet(context: context, builder:
                            (context){
                              return Container(
                                height: MediaQuery .of(context).size.height*0.15,
                                child: Column(
                                  children: [
                                    ListTile(
                                      title: Text('Camera'),
                                      onTap: () async {
                                        Navigator.pop(context);
                                        final picker = ImagePicker();
                                        final pickedFile = await picker.pickImage(source: ImageSource.camera);
                                          if (pickedFile != null) {
                                            BlocProvider.of<ProfileBloc>(storedContext).add(UpdateProfileEvent(
                                                imgPath:pickedFile.path
                                            ));
                                          } else {
                                            print('No image selected.');
                                          }
                                      },
                                    ),
                                    ListTile(
                                      title: Text('Gallery'),
                                      onTap: () async {
                                        Navigator.pop(context);
                                        final picker = ImagePicker();
                                        final pickedFile = await picker.pickImage(source: ImageSource.gallery);
                                          if (pickedFile != null) {
                                            BlocProvider.of<ProfileBloc>(storedContext).add(UpdateProfileEvent(
                                                imgPath:pickedFile.path
                                            ));
                                          } else {
                                            print('No image selected.');
                                          }
                                      },
                                    ),
                                  ],
                                ),
                              );
                            });
                          },
                          child: CircleAvatar(
                            radius: 18,
                            backgroundColor: ScreensColors.greyColor,
                            child: Icon(Icons.edit,color: Colors.white, size: 20,),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Center(
                  child: MaterialButton(
                    onPressed: (){
                      BlocProvider.of<ProfileBloc>(storedContext).add(DeleteProfileEvent());
                    }, child: Text('Log out',style: TextStyle(color: Colors.white),),
                    color: Colors.red,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextWidget(
                    text: 'Name',
                    textStyle: Styles.textStyle15White),
                SizedBox(
                  height: 10.0,
                ),
                TextFormFieldWidget(
                  controller: nameController,
                  text: 'Enter the name',
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.text,
                  hidePassword: false,
                  color: Colors.white,
                  heightOfTextFormField: 50.0,
                ),
                SizedBox(
                  height: 15.0,
                ),
                TextWidget(
                    text: 'Phone',
                    textStyle: Styles.textStyle15White),
                SizedBox(
                  height: 10.0,
                ),
                TextFormFieldWidget(
                  enabled: false,
                  controller: phoneController,
                  text: '',
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.text,
                  hidePassword: false,
                  color: Colors.white,
                  heightOfTextFormField: 50.0,
                ), SizedBox(
                  height: 15.0,
                ),
                TextWidget(
                    text: 'Country',
                    textStyle: Styles.textStyle15White),
                SizedBox(
                  height: 10.0,
                ),
                TextFormFieldWidget(
                  controller: countryController,
                  text: 'Enter the Country',
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.text,
                  hidePassword: false,
                  color: Colors.white,
                  heightOfTextFormField: 50.0,
                ), SizedBox(
                  height: 15.0,
                ),
                TextWidget(
                    text: 'City',
                    textStyle: Styles.textStyle15White),
                SizedBox(
                  height: 10.0,
                ),
                TextFormFieldWidget(
                  controller: cityController,
                  text: 'Enter the city',
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.text,
                  hidePassword: false,
                  color: Colors.white,
                  heightOfTextFormField: 50.0,
                ), SizedBox(
                  height: 15.0,
                ),
                TextWidget(
                    text: 'State',
                    textStyle: Styles.textStyle15White),
                SizedBox(
                  height: 10.0,
                ),
                TextFormFieldWidget(
                  controller: stateController,
                  text: 'Enter the State',
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.text,
                  hidePassword: false,
                  color: Colors.white,
                  heightOfTextFormField: 50.0,
                ),

                SizedBox(
                  height: 35.0,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  decoration: BoxDecoration(
                    color: ScreensColors.orangeColor,

                    borderRadius: BorderRadius.circular(20),
                  ),
                  width: double.infinity,
                  child: MaterialButton(onPressed: (){
                    if (nameController.text==user.name && cityController.text==user.city && stateController.text==user.state && countryController.text==user.country){
                      return;
                    }
                    BlocProvider.of<ProfileBloc>(storedContext).add(UpdateProfileEvent(
                      name: nameController.text!=user.name?nameController.text:null,
                      city: cityController.text!=user.city?cityController.text:null,
                      state: stateController.text != user.state?stateController.text:null,
                      country: countryController.text!=user.country?countryController.text:null,
                      imgPath: null
                    ));
                  },
                  child: Text('Update',style: TextStyle(color: Colors.white),),
                  ),
                ),
                SizedBox(
                  height: 40,
                )


              ],
            ),
          ),
        ),
      ),
    );
  }
}
