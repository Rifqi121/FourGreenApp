import 'package:flutter/material.dart';
import 'package:fourgreen/Fitur/Search/search.dart';
import 'package:fourgreen/components/text_field_container.dart';

class RoundedSearchField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedSearchField({
    Key key,
    this.hintText,
    this.icon = Icons.search,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SearchFieldContainer(
        child: TextField(
          onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) {return SearchPage();},),);},
          onChanged: onChanged,
          readOnly: true,
          cursorColor: Colors.greenAccent,
          decoration: InputDecoration(
            icon: Icon(
              icon,
              color: Colors.grey,
            ),
            hintText: "Fourgreen Company",
            border: InputBorder.none,
          ),
        ),
    );
  }
}
