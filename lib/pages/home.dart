import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

import '../scoped_model/model.dart';
import '../model/data_model.dart';
import '../scrapper/scrape_page.dart' as ScrapePage2;
import '../scoped_model/main.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String img1 =
      'https://www.who.int/images/default-source/health-topics/coronavirus/safe-greetings.png';
  String img2 =
      'https://www.who.int/images/default-source/health-topics/coronavirus/handshaking.png';
  String img3 =
      'https://www.who.int/images/default-source/health-topics/coronavirus/wearing-gloves.png';

  ScrapePage2.ScrapePage scrapeP = ScrapePage2.ScrapePage();

  Widget _buildTotalCases(CasesModel caseData) {
    String cases = NumberFormat().format(caseData.totalCases).toString();
    String timeDate =
        caseData.timeStamp.replaceFirst(new RegExp(r'T'), ' Time: ');
    return Container(
      height: 170.0,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0), color: Color(0xFFC0392B)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SizedBox(
            height: 4.0,
          ),
          Text(
            'Total Confirm Cases',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFFFFFFFF),
              fontSize: 18.0,
            ),
          ),
          Text(
            '$cases',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFFFFFFFF),
              fontSize: 52.0,
            ),
          ),
          Text(
            'Updated on Date: $timeDate',
            style: TextStyle(
              color: Color(0xFFFFFFFF),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOtherStats(CasesModel caseData) {
    return Container(
      height: 170.0,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0), color: Color(0xFF2C3E50)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                width: 100,
                child: Column(
                  children: <Widget>[
                    Text(
                      'Cases Today',
                      style: TextStyle(
                        color: Color(0xff2ecc71),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${caseData.casesToday}',
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 100,
                child: Column(
                  children: <Widget>[
                    Text(
                      'Deaths Today',
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                    Text(
                      '${caseData.deathsToday}',
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 100,
                child: Column(
                  children: <Widget>[
                    Text(
                      'Recovered',
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                    Text(
                      '${caseData.recovered}',
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                width: 100,
                child: Column(
                  children: <Widget>[
                    Text(
                      'Active',
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                    Text(
                      '${caseData.active}',
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 100,
                child: Column(
                  children: <Widget>[
                    Text(
                      'Critical',
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                    Text(
                      '${caseData.critical}',
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 100,
                child: Column(
                  children: <Widget>[
                    Text(
                      'Deaths',
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                    Text(
                      '${caseData.totalDeaths}',
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _imagerLoader(
      BuildContext context, Widget child, ImageChunkEvent loadingProgress) {
    if (loadingProgress == null) return child;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: CircularProgressIndicator(
          value: loadingProgress.expectedTotalBytes != null
              ? loadingProgress.cumulativeBytesLoaded /
                  loadingProgress.expectedTotalBytes
              : null,
        ),
      ),
    );
  }

  void _makeEmergencyCall(String number, BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListTile(
          leading: Icon(
            Icons.call,
            color: Colors.white,
          ),
          title: Text(
            'make call',
            style: TextStyle(color: Colors.white),
          ),
          onTap: () => UrlLauncher.launch(number),
        );
      },
      backgroundColor: Color(0xff2c3e50),
    );
  }

  Widget _buildRodsStats(double ratio, Color color) {
    return Container(
      height: 15,
      width: MediaQuery.of(context).size.width * ratio,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        color: color,
      ),
    );
  }

  Widget _buildCaseRodStats(Color color) {
    return Container(
      height: 18.0,
      width: 18.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        color: color,
      ),
    );
  }

  Widget _buildWorldStatistics(
      {int confirmedCases, int recoveredCases, int deathsCount}) {
    String confirmed = NumberFormat().format(confirmedCases);
    String recovered = NumberFormat().format(recoveredCases);
    String deaths = NumberFormat().format(deathsCount);
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(
            'Global Statistics',
            style: TextStyle(
                color: Color(0xffc0392b),
                fontWeight: FontWeight.bold,
                fontSize: 22.0),
          ),
          SizedBox(
            height: 10.0,
          ),
          FittedBox(
            child: Row(
              children: <Widget>[
                _buildRodsStats(
                  0.6,
                  Color(0xfff1c40f),
                ),
                SizedBox(
                  width: 5.0,
                ),
                _buildRodsStats(
                  0.3,
                  Color(0xff27ae60),
                ),
                SizedBox(
                  width: 5.0,
                ),
                _buildRodsStats(
                  0.1,
                  Color(0xffc0392b),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Confirmed',
                style: TextStyle(
                  fontSize: 23.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 40,
              ),
              Text(
                '$confirmed',
                style: TextStyle(fontSize: 23.0),
              ),
              //Container(width: 30.0, height: 30.0, color: Color(0xfff1c40f),),
              //_buildRodsStats(0.2, Color(0xfff1c40f), height:30.0, width:30.0),
              _buildCaseRodStats(Color(0xfff1c40f)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Recovered',
                style: TextStyle(
                  fontSize: 23.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 40,
              ),
              Text(
                '$recovered',
                style: TextStyle(fontSize: 23.0),
              ),
              //Container(width: 30.0, height: 30.0, color: Color(0xfff1c40f),),
              //_buildRodsStats(0.2, Color(0xfff1c40f), height:30.0, width:30.0),
              _buildCaseRodStats(Color(0xff27ae60)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Deaths',
                style: TextStyle(
                  fontSize: 23.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 40,
              ),
              Text(
                '$deaths',
                style: TextStyle(fontSize: 23.0),
              ),
              //Container(width: 30.0, height: 30.0, color: Color(0xfff1c40f),),
              //_buildRodsStats(0.2, Color(0xfff1c40f), height:30.0, width:30.0),
              _buildCaseRodStats(Color(0xffc0392b)),
            ],
          ),
          //Text('*Updated daily'),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {
      Widget page = Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Failed to get data..."),
            FlatButton(
                child: Text('Tap to Reload'),
                onPressed: () {
                  model.fetchData();
                }),
          ],
        ),
      );
      if (model.isLoading) {
        return Center(
            child: CircularProgressIndicator(
          backgroundColor: Color(0xffc0392b),
        ));
      } else if (!model.isLoading && model.getAllCases.length > 0) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 6.0,
              ),
              _buildTotalCases(model.currentCase),
              SizedBox(
                height: 10.0,
              ),
              _buildOtherStats(model.currentCase),
              SizedBox(
                height: 20.0,
              ),
              _buildWorldStatistics(
                  confirmedCases: model.allCases ?? 0,
                  recoveredCases: model.allRecovered ?? 0,
                  deathsCount: model.allDeaths ?? 0), 
              /*_buildWorldStatistics(
                confirmedCases: scrapeP.allCases ?? 0,
                recoveredCases: scrapeP.allRecovered ?? 0,
                deathsCount: scrapeP.allDeaths ?? 0
              ), */
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                child: Text(
                  'Emergency Lines:',
                  style: TextStyle(
                      color: Color(0xffc0392b),
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ListTile(
                      leading: Icon(
                        Icons.call,
                      ),
                      title: Text('112'),
                      onTap: () => _makeEmergencyCall('tel://112', context),
                      selected: true,
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.call,
                      ),
                      title: Text('+233 55 843 9868'),
                      selected: true,
                      onTap: () =>
                          _makeEmergencyCall('tel://+233558439868', context),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.call,
                      ),
                      title: Text('+233 50 949 7700'),
                      selected: true,
                      onTap: () =>
                          _makeEmergencyCall('tel://+23350949770', context),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                child: Text(
                  'WHO Tips',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Image.network(
                      img1,
                      loadingBuilder: _imagerLoader,
                    ),
                    Image.network(
                      img2,
                      loadingBuilder: _imagerLoader,
                    ),
                    Image.network(
                      img3,
                      loadingBuilder: _imagerLoader,
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      } else {
        return page;
      }
    });
  }
}
