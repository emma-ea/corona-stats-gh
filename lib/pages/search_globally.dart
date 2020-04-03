import 'package:flutter/material.dart';

class SearchGlobally extends StatefulWidget {
  @override
  _SearchGloballyState createState() => _SearchGloballyState();
}

class _SearchGloballyState extends State<SearchGlobally> {

  String _countryToSearch;

  String _hintText = 'Get statistics on Country';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
       Container(
         width: MediaQuery.of(context).size.width * 0.9,
         child: TextField(
           onTap: () {
            setState(() {
              _hintText = 'Enter Country name to search';
            });
           },
           
           onSubmitted: (input) {
             _countryToSearch = input;
            print('$input');
            if (input == '') {
              setState(() {
                _hintText = 'Get statistics on Country';
              });
            }
           },
           onChanged: (input) {
             // filter list in unchanged
           },
           cursorColor: Color(0xff27ae60),
           decoration: InputDecoration(
             border: InputBorder.none,
             prefixIcon: Icon(Icons.search, color: Color(0xff27ae60),),
             hintText: _hintText,
           ),
         ),
       ),
       Container(height: 1.0, color: Colors.black38, width: MediaQuery.of(context).size.width * 0.9,),
       SizedBox(height: 20.0,),
       SingleChildScrollView(
         child: Column(
           children: <Widget>[
             
           ],
         ),
       ),
      ],
    );
  }
}