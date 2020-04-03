import 'package:corona_tracker_gh/scoped_model/model.dart';
import 'package:flutter/material.dart';

import 'home.dart';
import 'regional_stats.dart';
import 'about_covid19.dart';
import 'search_globally.dart';

import '../scoped_model/main.dart';
import '../about_text_corona.dart';

class MainPage extends StatefulWidget {
  final DataModel _model;
  MainPage(this._model);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  AnimationController _animationController, _controllerAlertDialog;
  Animation _animation, _animDrawer;
  int _currentPageIndex = 0;
  PageController _controller = PageController();
  AboutInfo _aboutInfo = AboutInfo();


  @override
  void initState() {
    super.initState();
    widget._model.fetchData();
    
    //widget._model.getData();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );
    _controllerAlertDialog = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _animation = Tween(
      begin: 0.0,
      end: 1.0
    ).animate(_controllerAlertDialog);
    _animDrawer = CurvedAnimation(parent: _animationController, curve: Curves.ease);
  }

 @override
 void dispose() {
   _animationController.dispose();
   _controllerAlertDialog.dispose();
   super.dispose();
 }

   void releaseDrawerAnimController() {
    _animationController.reverse();
  }

  _showDialogBuilder(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
        //_controllerAlertDialog.forward();
          return FadeTransition(
          
           opacity: _animation,
            
                      child: AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    title: Text('${_aboutInfo.aboutData}'),
                    content: SingleChildScrollView(
                      child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '${_aboutInfo.aboutTitle1}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                '${_aboutInfo.aboutBody1}',
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 12.0),
              Text(
                '${_aboutInfo.aboutTitle2}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                '${_aboutInfo.aboutBody2}',
                textAlign: TextAlign.justify,
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
                  ),
          );
        });
  }

  void _toggle() => _animationController.isDismissed ? _animationController.forward() : _animationController.reverse();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,

          builder: (context, _) { 
            double maxSlide = MediaQuery.of(context).size.width * 0.55;
            double slide = _animationController.value * maxSlide;
            double scale = 1 - (_animationController.value * 0.2);
            return Transform(
            transform: Matrix4.identity()
            ..translate(slide),
            //..scale(scale),
            alignment: Alignment.bottomLeft,
                      child: Scaffold(
        backgroundColor: Color(0xFFFFFFFF),
        appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Color(0xFFFFFFFF),
            centerTitle: true,
            leading: IconButton(
              icon: Image.asset(
                'assets/images/menu2.png',
                width: 34.0,
                height: 34.0,
              ),
              onPressed: () {
                print('menu toggled: ${widget._model.isToggleState}');
                _toggle();
              },
            ),
            title: RichText(
              text: TextSpan(
                children: [
                TextSpan(
                  text: 'Corona',
                  style: TextStyle(
                    color: Color(0xFF0000000),
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: 'Tracker',
                  style: TextStyle(
                    color: Color(0xffc0392b),
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: '.Gh',
                  style: TextStyle(
                    color: Color(0xff27ae60),
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ]),
            ),
            actions: <Widget>[
              IconButton(
                icon: Image.asset(
                  'assets/images/help.png',
                  width: 30.0,
                  height: 30.0,
                ),
                onPressed: () =>
              
                  _showDialogBuilder(context),
                
                  
              ),
            ],
        ),
        body: PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                _currentPageIndex = index;
              });
            },
            children: <Widget>[
              Home(),
              RegionalStats(),
              AboutCovid19(),
              SearchGlobally(),
            ],
        ),
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Color(0xffffffff),
            elevation: 0.0,
            unselectedItemColor: Color(0xffbdc3c7),
            selectedItemColor: Color(0xFF2C3E50),
            showUnselectedLabels: false,
            currentIndex: _currentPageIndex,
            type: BottomNavigationBarType.shifting,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.insert_chart), title: Text('Regional Stats')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.info), title: Text('About COVID-19')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), title: Text('Search Globally')),
            ],
            onTap: (index) {
              setState(() {
                _currentPageIndex = index;
                _controller.animateToPage(index,
                    duration: Duration(milliseconds: 500), curve: Curves.ease);
              });
            },
        ),
      ),
          ); },
    );
  }
}
