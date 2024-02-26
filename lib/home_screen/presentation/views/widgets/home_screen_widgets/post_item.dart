import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:mafqood/addPost_screen/views/screens/find_post_screen.dart';
import 'package:mafqood/addPost_screen/views/screens/lost_post_screen.dart';
import 'package:mafqood/core/utilis/desk_storage.dart';

import '../../../../../classes/get_founded_persons_response.dart';
import '../../../../../classes/post_model.dart';
import '../../../../../core/shared_widgets/text_widget.dart';
import '../../../../../core/utilis/colors.dart';
import '../../../../../core/utilis/styles.dart';
import '../../../../../persons_bloc/persons_bloc.dart';

class PostItem extends StatelessWidget {
  final PostModel postModel;
  PostItem({required this.postModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Row(
            children: [
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25.0),
                  child:postModel.founderOrReporterProfileImage!=null &&postModel.founderOrReporterProfileImage!.isNotEmpty ? Image.network(
                    postModel.founderOrReporterProfileImage!,
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 30.0,
                      );
                    },


                    fit: BoxFit.cover,
                  ):Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 30.0,
                  )
                ),
                height: 40,
                width: 40.0,
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    text: postModel.founderOrReporterName??"",
                    textStyle: Styles.textStyle15White,
                  ),
                  Text(
                    postModel.foundedOrMissingPersonFoundedOrMissingAt??"",
                    style: TextStyle(color: Colors.white54),
                  ),
                ],
              ),
              Spacer(),
              IconButton(onPressed: (){
                showModalBottomSheet(context: context, builder:
                (BuildContext context) {
                  return Container(
                    width: double.infinity,
                    color: ScreensColors.primaryColor,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 15.0,),
                        if (postModel.founderOrReporterPhone!=DeskStorage.mobile)
                          TextButton(
                            onPressed: () async {
                              bool? res = await FlutterPhoneDirectCaller.callNumber(postModel.founderOrReporterPhone!);
                              print (res);
                            },
                            child: Text("Call "+ (postModel.personType==PersonType.foundedPerson?"Founder":"Searcher")
                              , style: TextStyle(color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                            ),),
                          ),
                        if (postModel.founderOrReporterPhone==DeskStorage.mobile)
                      TextButton(
                        onPressed: () async {
                          Navigator.pop(context);
                          if (postModel.personType==PersonType.foundedPerson)
                            {

                            Navigator.push(context, MaterialPageRoute(builder: (context)=>FindPostScreen(
                              cityFind: postModel.foundedOrMissingPersonCity,
                              countryFind: postModel.foundedOrMissingPersonCountry,
                              descriptionFind: postModel.foundedOrMissingPersonDescription,
                              nameFind: postModel.foundedOrMissingPersonName,
                             stateFind: postModel.foundedOrMissingPersonState,
                              policeStationFind: postModel.foundedOrMissingPersonPoliceStation,
                              selectedValueEdit: postModel.foundedOrMissingPersonGender=="male"?"Male":"Female",
                              foundedLostEdit: DateTime.parse(postModel.foundedOrMissingPersonFoundedOrMissingAt!),
                              id: postModel.foundedOrMissingPersonId,
                            )));
                            }
                          else
                            {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>LostPostScreen(
                                cityMissed: postModel.foundedOrMissingPersonCity,
                                countryMissed: postModel.foundedOrMissingPersonCountry,
                                descriptionMissed: postModel.foundedOrMissingPersonDescription,
                                nameMissed: postModel.foundedOrMissingPersonName,
                                stateMissed: postModel.foundedOrMissingPersonState,
                                selectedValueEdit: postModel.foundedOrMissingPersonGender=="male"?"Male":"Female",
                                LostEdit: DateTime.parse(postModel.foundedOrMissingPersonFoundedOrMissingAt!
                                ),
                                id: postModel.foundedOrMissingPersonId,
                              )));

                             }
                           },
                        child: Text("Edit", style: TextStyle(color: Colors.white,
                         fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),),
                      ),
                        SizedBox(
                          height: 15,
                        ),
                        if (postModel.founderOrReporterPhone==DeskStorage.mobile)
                      TextButton(
                        onPressed: () async {
                          Navigator.pop(context);
                         var personBloc = context.read<PersonsBloc>();
                          personBloc.add(DeleteFoundedOrMissingPersonEvent(foundedPersonId:postModel.foundedOrMissingPersonId,personType:postModel.personType!));
                        },
                        child: Text("Delete", style: TextStyle(color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),),
                      ),
                        SizedBox(
                          height: 15.0,),

                      ],
                    ),
                  );
                });


              }, icon: Icon(
                Icons.more_horiz,
                color: Colors.white,
              ))
              ,
            ],
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: ExpandableText(
            postModel.foundedOrMissingPersonDescription??"",
            expandText: '...see more',
            style: TextStyle(
              color: Colors.white,
            ),
            collapseText: '...see less',
          ),
        ),

        SizedBox(
          height: 10.0,
        ),
        Container(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: postModel.foundedOrMissingPersonImage!=null?Image.network(
              postModel.foundedOrMissingPersonImage!,
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  'assets/images/missedchild1.jpg',
                  fit: BoxFit.cover,
                );
              },
              fit: BoxFit.cover,
            ):Image.asset(
              'assets/images/missedchild1.jpg',
              fit: BoxFit.cover,
            )
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
          ),
          height: 180,
          width: double.infinity,
        ),

      ],
    );
  }
}
