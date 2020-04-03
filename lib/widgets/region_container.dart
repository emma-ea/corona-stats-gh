import 'package:flutter/material.dart';
import '../model/region_model.dart';

class RegionDataContainer extends StatefulWidget {

  final RegionModel _regionModel;
  RegionDataContainer(this._regionModel);

  @override
  _RegionDataContainerState createState() => _RegionDataContainerState();
}

class _RegionDataContainerState extends State<RegionDataContainer> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('${widget._regionModel.getTitle}'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Confirmed'),
              Text('${widget._regionModel.getConfirmed}'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Recovered'),
              Text('${widget._regionModel.getRecovered}'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Well/Responding to Treatment'),
              Text('${widget._regionModel.getWell}'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Critical Condition'),
              Text('${widget._regionModel.getCritical}'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Deaths'),
              Text('${widget._regionModel.getDeaths}'),
            ],
          ),
        ],
      ),
    );
  }
}