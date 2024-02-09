import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mafqood/core/shared_widgets/container_widget.dart';
import 'package:mafqood/core/utilis/styles.dart';
import '../../../../core/shared_widgets/back_button_widget.dart';
import '../../../../core/shared_widgets/text_widget.dart';
import '../../../../core/utilis/colors.dart';
import '../../../../profile_bloc/profile_bloc.dart';

class ProfileScreen1 extends StatelessWidget {
  late BuildContext storedContext;
  @override
  Widget build(BuildContext context) {
    storedContext = context;
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoadingState) {
          return Center(child: CircularProgressIndicator(
            color: Colors.white,
          ));
        } else if (state is ProfileLoadedState) {
          return buildProfileContent(state.profileData);
        } else if (state is ProfileErrorState) {
          return Center(
            child: Text('Error: ${state.error}'),
          );
        } else {
          return Container();
        }
      },
    );
  }

  Widget buildProfileContent(Map<String, dynamic> profileData) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ScreensColors.primaryColor,
        body: Padding(
          padding: const EdgeInsets.only(top: 25.0, left: 15 , right: 15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                BackButtonWidget(),
                SizedBox(
                  height: 15.0,
                ),
                TextWidget(
                  text: 'Name: ${profileData['name']}',
                  textStyle: Styles.textStyle18White,
                ),
                SizedBox(
                  height: 15.0,
                ),
                TextWidget(
                  text: 'Profile Image: ${profileData['profile_image']}',
                  textStyle: Styles.textStyle18White,
                ),
                SizedBox(
                  height: 15.0,
                ),
                TextWidget(
                  text: 'NationalIdFrontImage: ${profileData['national_id_front_image']}',
                  textStyle: Styles.textStyle18White,
                ),
                SizedBox(
                  height: 15.0,
                ),
                TextWidget(
                  text: 'NationalIdBackImage: ${profileData['national_id_front_image']}',
                  textStyle: Styles.textStyle18White,
                ),
                SizedBox(
                  height: 15.0,
                ),
                TextWidget(
                  text: 'Country: ${profileData['country']}',
                  textStyle: Styles.textStyle18White,
                ),
                SizedBox(
                  height: 15.0,
                ),
                TextWidget(
                  text: 'State: ${profileData['state']}',
                  textStyle: Styles.textStyle18White,
                ),
                SizedBox(
                  height: 15.0,
                ),
                TextWidget(
                  text: 'City: ${profileData['city']}',
                  textStyle: Styles.textStyle18White,
                ),
                SizedBox(
                  height: 15.0,
                ),
                TextWidget(
                  text: 'Gender: ${profileData['gender']}',
                  textStyle: Styles.textStyle18White,
                ),
                SizedBox(
                  height: 15.0,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: ()
                      {
                        Map <String , dynamic> profileData =
                        {
                          'name' : 'updated name',
                          'profile_image' : 'updated profile image',
                          'national_id_front_image' : 'updated national id front image',
                          'national_id_front_image' : 'updated national id back image',
                          'country' : 'updated country',
                          'state' : 'updated state',
                          'city' : 'updated city',
                          'gender' : 'updated gender',
                        };
                        BlocProvider.of<ProfileBloc>(storedContext).add(UpdateProfileEvent(profileData));

                      },
                      child: ContainerWidget(
                        text: 'update',
                          textStyle: Styles.textStyle15White,
                          color: Colors.amber,
                          radius: 10.0, height: 60.0, width: double.infinity),
                    ),
                    InkWell(
                      onTap: ()
                      {
                        BlocProvider.of<ProfileBloc>(storedContext).add(DeleteProfileEvent());
                      },
                      child: ContainerWidget(
                          text: 'delete',
                          textStyle: Styles.textStyle15White,
                          color: Colors.red,
                          radius: 10.0, height: 60.0, width: double.infinity),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
