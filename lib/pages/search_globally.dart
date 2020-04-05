import 'package:corona_tracker_gh/scoped_model/main.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

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
       Flexible(
         
         child: ListView(
               children: <Widget>[
                 Padding(
             padding: const EdgeInsets.symmetric(horizontal: 8.0),
             child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[Row(children: <Widget>[Text('scroll down'), Icon(Icons.arrow_drop_down)],), Row(children: <Widget>[Text('scroll left'), Icon(Icons.arrow_right)],)], ),
           ),
           SingleChildScrollView(
             scrollDirection: Axis.horizontal,
             child: ScopedModelDescendant(
                            builder: (BuildContext context, Widget child, MainModel model){
                              return DataTable(
                   columns: <DataColumn>[
            DataColumn(label: Text('Country, Other',),),
            DataColumn(label: Text('Total Cases'),),
            DataColumn(label: Text('New Cases'),),
            DataColumn(label: Text('Total Deaths'),),
            DataColumn(label: Text('New Deaths'),),
            DataColumn(label: Text('Total Recovered'),),
            DataColumn(label: Text('Active Cases'),),
            DataColumn(label: Text('Serious, Critical'),),
                   ],
                   rows: !model.isLoading && model.globalModelData.length > 0 ? List.generate(model.globalModelData.length, (index) {
                     return DataRow(cells: [
                      DataCell(Text('${model.globalModelData[index].country}'),),
                      DataCell(Text('${model.globalModelData[index].totalCases}'),),
                      DataCell(Text('${model.globalModelData[index].newCases}'),),
                      DataCell(Text('${model.globalModelData[index].totalDeaths}'),),
                      DataCell(Text('${model.globalModelData[index].newDeaths}'),),
                      DataCell(Text('${model.globalModelData[index].totalRecovered}'),),
                      DataCell(Text('${model.globalModelData[index].activeCases}'),),
                      DataCell(Text('${model.globalModelData[index].critical}'),),
                     ]);
                   }) : null,
                 );
                            },
             ),
           ),
               ],
             
         ),
       ),
      ],
    );
  }
}