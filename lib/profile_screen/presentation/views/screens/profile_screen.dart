import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mafqood/core/utilis/styles.dart';
import '../../../../authentication_bloc/authentication_bloc.dart';
import '../../../../core/shared_widgets/back_button_widget.dart';
import '../../../../core/shared_widgets/text_widget.dart';
import '../../../../core/utilis/colors.dart';

class ProfileScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoading) {
          return CircularProgressIndicator();
        } else if (state is ProfileLoaded) {
          return buildProfileContent(state.profileData);
        } else if (state is ProfileError) {
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
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25.0, left: 23),
              child: BackButtonWidget(),
            ),
            TextWidget(
              text: 'Name: ${profileData['name']}',
              textStyle: Styles.textStyle18White,
            ),
            TextWidget(
              text: 'Profile Image: ${profileData['profile_image']}',
              textStyle: Styles.textStyle18White,
            ),
            TextWidget(
              text: 'NationalIdFrontImage: ${profileData['national_id_front_image']}',
              textStyle: Styles.textStyle18White,
            ),
            TextWidget(
              text: 'NationalIdBackImage: ${profileData['national_id_front_image']}',
              textStyle: Styles.textStyle18White,
            ),
            TextWidget(
              text: 'Country: ${profileData['country']}',
              textStyle: Styles.textStyle18White,
            ),
            TextWidget(
              text: 'State: ${profileData['state']}',
              textStyle: Styles.textStyle18White,
            ),
            TextWidget(
              text: 'City: ${profileData['city']}',
              textStyle: Styles.textStyle18White,
            ),
            TextWidget(
              text: 'Gender: ${profileData['gender']}',
              textStyle: Styles.textStyle18White,
            ),




          ],
        ),
      ),
    );
  }
}
