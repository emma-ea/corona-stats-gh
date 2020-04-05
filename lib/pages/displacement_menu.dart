import 'package:corona_tracker_gh/pages/menu_links.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

import '../pages/about_app.dart';
import '../pages/main_page.dart';

class DisplacementMenu extends StatefulWidget {
  @override
  _DisplacementMenuState createState() => _DisplacementMenuState();
}

class _DisplacementMenuState extends State<DisplacementMenu> {

  final _pressReleases = "https://ghanahealthservice.org/covid-19/press-releases.php";
  final _otherReleases = "https://ghanahealthservice.org/covid-19/other-releases.php";
  final _faqs = "https://ghanahealthservice.org/covid-19/faqs.php";

  MainPage mainPage = MainPage(null);


 _showDialogBuilder(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
                    shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
                    ),
                    title: Text('${Infotext.aboutTitle}'),
                    content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'CoronaTracker.Gh',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0,),
              Text(
                '${Infotext.aboutDetail}',
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: 12.0,
              ),
              Text(
                '${Infotext.aboutDev}',
                style: TextStyle(fontWeight: FontWeight.bold),

              ),
              SizedBox(height: 8.0),
              Text(
                'Project is available on github[Interested? checkout source]',
              ),
              GestureDetector(
                onTap: () {
                  UrlLauncher.launch("https://${Infotext.reachDev1}/corona-tracker-gh");
                },
                              child: Text(
                  '${Infotext.reachDev1}/corona-tracker-gh',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text('You can mail me with bug issues'),
              GestureDetector(
                onTap: () {
                  UrlLauncher.launch("mailto://${Infotext.reachDev2}");
                },
                              child: Text(
                  '${Infotext.reachDev2}',
                  textAlign: TextAlign.justify,
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
                    ),
                    elevation: 3.0,
                    actions: <Widget>[
          FlatButton(
            child: Text('close'),
            onPressed: () {
              Navigator.pop(context);
            },
          )
                    ],
                  );
        });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffc0392b),
      
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xffc0392b),
        title: Padding(
          padding: const EdgeInsets.all(18.0),
        ),
      ),
      body: SingleChildScrollView(
              child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text('Menu', style: TextStyle(color: Colors.white, fontSize: 54.0, fontWeight: FontWeight.bold,),),
              SizedBox(height: 30.0,),
              ListTile(leading: Icon(Icons.healing, color: Colors.white,), title: Text('Stay safe tips', style: TextStyle(color: Colors.white),),onTap: () {
              //mainPage.releaseDrawerAnimController();
                // stay safe tips
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return MenuLinks(url: _faqs,);
                  }
                ));
              },),
              ListTile(leading: Icon(Icons.question_answer, color: Colors.white,), title: Text('Frequently Asked \nQuestions', style: TextStyle(color: Colors.white),),onTap: () {
                // faqs /
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return MenuLinks(url: _faqs,);
                  }
                ));
              },),
              ListTile(leading: Icon(Icons.new_releases, color: Colors.white,), title: Text('Press Releases', style: TextStyle(color: Colors.white),), onTap: () {
                // press releases/
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return MenuLinks(url: _pressReleases,);
                  }
                ));
              },),
              ListTile(leading: Icon(Icons.new_releases, color: Colors.white,), title: Text('Other Releases', style: TextStyle(color: Colors.white),), onTap: () {
                // other releases/
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return MenuLinks(url: _otherReleases,);
                  }
                ));
              },),
              ListTile(leading: Icon(Icons.info, color: Colors.white,), title: Text('About App', style: TextStyle(color: Colors.white),), onTap: () {
                _showDialogBuilder(context);
              },),
              //ListTile(leading: Icon(Icons.done), title: Text('Credits'),),
            ],
          ),
        ),
      ),
    );
  }
}