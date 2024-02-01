import 'package:flutter/material.dart';
import 'package:mafqood/core/shared_widgets/container_widget.dart';

class SearchWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return
      InkWell(
      onTap: () {},
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
