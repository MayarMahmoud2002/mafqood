import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mafqood/core/utilis/colors.dart';
import 'package:mafqood/home_screen/presentation/views/widgets/home_screen_widgets/search_widget.dart';
import '../../../../core/shared_widgets/flush_bar.dart';
import '../../../../core/shared_widgets/text_widget.dart';
import '../../../../core/utilis/styles.dart';
import '../../../../persons_bloc/persons_bloc.dart';
import '../widgets/home_screen_widgets/notification_widget.dart';
import '../widgets/home_screen_widgets/post_item.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  initState() {
    super.initState();
    var personsBloc = BlocProvider.of<PersonsBloc>(context);
    personsBloc.add(GetFoundedPersonsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PersonsBloc, PersonsState>(
      builder: (context, state) {
        if (state is GetFoundedPersonsFailure ) {
          EasyLoading.dismiss();
        }else if (state is DeleteFoundedPersonFailure) {
          EasyLoading.dismiss();
        }else if (state is DeleteFoundedPersonSuccess){
          Future.delayed(Duration(seconds: 1),(){
            BlocProvider.of<PersonsBloc>(context).add(GetFoundedPersonsEvent());
          });
        }
        else if (state is GetFoundedPersonsSuccess) {
          EasyLoading.dismiss();
          return Scaffold(
            backgroundColor: ScreensColors.primaryColor,
            body: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 40.0),
              child: ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SearchWidget(event: state.event,),
                          Spacer(),
                          NotificationWidget(),
                        ],
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      TextWidget(
                        text: 'Browse',
                        textStyle: Styles.textStyle15White,
                      ),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: state.posts.length,
                        itemBuilder: (context, index) {
                          return PostItem(postModel: state.posts[index],);
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: 20.0,
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                ],
              ),
            ),
          );

        }
        else if (state is GetFoundedPersonsLoading || state is DeleteFoundedOrMissingPersonLoading) {
          EasyLoading.show(status: 'loading...');
        }
        return Scaffold(
          backgroundColor: ScreensColors.primaryColor,

        );
      },
    );
  }
}

