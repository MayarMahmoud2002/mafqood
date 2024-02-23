import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mafqood/core/shared_widgets/container_widget.dart';

import '../../../../../classes/post_model.dart';
import '../../../../../core/utilis/colors.dart';
import '../../../../../persons_bloc/persons_bloc.dart';

class SearchWidget extends StatefulWidget {
  GetFoundedPersonsEvent event;
  SearchWidget({required this.event});
  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {

  @override
  Widget build(BuildContext context) {

    return
      InkWell(
      onTap: () {
        showDialog(context: context, builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (context, setMenuState) {
              return AlertDialog(
              backgroundColor: ScreensColors.primaryColor,
              title: Text("Filter and Search", style: TextStyle(color: Colors.white,fontSize: 21),),
              content: Container(
                width: MediaQuery.of(context).size.width*0.9,
                padding: EdgeInsets.all(5),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20,),
                      TextFormField(
                        initialValue: widget.event.searchText??'',
                        onChanged: (value) {
                          setMenuState(() {
                            widget.event.searchText=value;
                          });
                        },
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: "Search Text",
                          labelStyle: TextStyle(color: Colors.white, fontSize: 15),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10.0),
                          ),

                        ),
                      ),
                      SizedBox(height: 20,),
                      Text("Search in", style: TextStyle(color: Colors.white,fontSize: 15),),
                      RadioListTile(title: Text("All Posts",
                        style: TextStyle(color: Colors.white,fontSize: 12),),value:false , groupValue: widget.event.searchFromCustomDate, onChanged: (value) {
                        setMenuState(() {
                          widget.event.searchFromCustomDate=false;
                        });
                      },activeColor: Colors.white,),
                      RadioListTile(title:  Text("From Custom Date", style: TextStyle(color: Colors.white,fontSize: 12),),
                        value: true, groupValue: widget.event.searchFromCustomDate, onChanged: (value) async {
                          DateTime? date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2023),
                            lastDate: DateTime.now(),
                          );
                          setMenuState(() {
                            if (date!=null)
                              widget.event.searchFromCustomDate=true;
                            widget.event.searchByFoundedOrMissingPersonDateFrom=date;
                          });

                        },activeColor: Colors.white,),

                        if (widget.event.searchFromCustomDate && widget.event.searchByFoundedOrMissingPersonDateFrom!=null)
                          Opacity(
                            opacity: 0.7,
                            child: Text("From ${widget.event.searchByFoundedOrMissingPersonDateFrom!.year}-${widget.event.searchByFoundedOrMissingPersonDateFrom!.month}-${widget.event.searchByFoundedOrMissingPersonDateFrom!.day}"
                              , style: TextStyle(color: Colors.white,fontSize: 15),),
                          ),

                      SizedBox(height: 20,),
                      Text("Sort by", style: TextStyle(color: Colors.white,fontSize: 15),),
                      RadioListTile(title: Text("First added first",
                        style: TextStyle(color: Colors.white,fontSize: 12),),value:false , groupValue: widget.event.sortByLastAdded, onChanged: (value) {
                        setMenuState(() {
                          widget.event.sortByLastAdded=false;

                        });
                      },activeColor: Colors.white,),
                      RadioListTile(title:  Text("Last added first", style: TextStyle(color: Colors.white,fontSize: 12),),
                        value: true, groupValue:widget.event.sortByLastAdded, onChanged: (value) {
                          setMenuState(() {
                            widget.event. sortByLastAdded=true;
                          });
                        },activeColor: Colors.white,),
                      SizedBox(height: 20,),

                      Text("Gender", style: TextStyle(color: Colors.white,fontSize: 15),),
                      RadioListTile(title: Text("All", style: TextStyle(color: Colors.white,fontSize: 12),),
                        value: Gender.all, groupValue: widget.event.searchByFoundedGender, onChanged: (value) {
                        setMenuState(() {
                          widget.event.searchByFoundedGender=Gender.all;
                          print (widget.event.searchByFoundedGender);

                        });
                      },activeColor: Colors.white,),
                      RadioListTile(title:Text("Male", style: TextStyle(color: Colors.white,fontSize: 12),),
                        value: Gender.male, groupValue: widget.event.searchByFoundedGender, onChanged: (value) {
                        setMenuState(() {
                          widget.event.searchByFoundedGender=Gender.male;
                          print (widget.event.searchByFoundedGender);
                        });
                      },activeColor: Colors.white,),
                      RadioListTile(title:Text("Female", style: TextStyle(color: Colors.white,fontSize: 12),),
                        value: Gender.female, groupValue: widget.event.searchByFoundedGender, onChanged: (value) {
                        setMenuState(() {
                          widget.event.searchByFoundedGender=Gender.female;
                          print (widget.event.searchByFoundedGender);

                        });
                      },activeColor: Colors.white,),
                      SizedBox(height: 20,),
                      Text("Person Type", style: TextStyle(color: Colors.white,fontSize: 15),),
                      RadioListTile(title: Text("All", style: TextStyle(color: Colors.white,fontSize: 12),),value: PersonType.all, groupValue: widget.event.personType, onChanged: (value) {
                        setMenuState(() {
                          widget.event.personType=PersonType.all;

                        });
                      },activeColor: Colors.white,),
                      RadioListTile(title:  Text("Missing", style: TextStyle(color: Colors.white,fontSize: 12),),
                        value: PersonType.missingPerson, groupValue: widget.event.personType, onChanged: (value) {
                        setMenuState(() {
                          widget.event.personType=PersonType.missingPerson;
                        });
                      },activeColor: Colors.white,),
                      RadioListTile(title:  Text("Founded", style: TextStyle(color: Colors.white,fontSize: 12),),
                        value: PersonType.foundedPerson, groupValue: widget.event.personType, onChanged: (value) {
                        setMenuState(() {
                          widget.event.personType=PersonType.foundedPerson;
                        });
                      },activeColor: Colors.white,),
                    ],
                  ),
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: Text('Cancel', style: TextStyle(color: Colors.white,fontSize: 15),),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: Text('Search', style: TextStyle(color: Colors.white,fontSize: 15),),
                  onPressed: () {
                    Navigator.of(context).pop();
                    BlocProvider.of<PersonsBloc>(context).add(GetFoundedPersonsEvent(
                      personType: widget.event.personType,
                      searchByFoundedGender: widget.event.searchByFoundedGender,
                      searchByFoundedOrMissingPersonDateFrom: widget.event.searchByFoundedOrMissingPersonDateFrom,
                      searchFromCustomDate: widget.event.searchFromCustomDate,
                      searchText: widget.event.searchText,
                      sortByLastAdded: widget.event.sortByLastAdded,
                    ));
                  },
                ),
              ],
            );}
          );
        });
      },
      child: Container(
        child: Icon(
          Icons.search,
          color: Colors.white,
        ),
        height: 35,
        width: 35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(55.0),
          border: Border.all(color: Colors.white30),
        ),
      ),
    );

  }
}
