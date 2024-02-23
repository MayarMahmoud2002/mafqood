import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
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
                  child:postModel.founderOrReporterProfileImage!=null? Image.network(
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

                    height:(postModel.founderOrReporterPhone!=DeskStorage.mobile)?MediaQuery.of(context).size.height*0.10: MediaQuery.of(context).size.height*0.15,
                    color: ScreensColors.primaryColor,
                    child: Column(
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
                      Text("Edit", style: TextStyle(color: Colors.white,
                       fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),),
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
