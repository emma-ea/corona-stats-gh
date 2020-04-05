import 'package:corona_tracker_gh/model/global_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart' as dom;

import 'dart:convert';

import '../model/data_model.dart';
import '../model/region_model.dart';

class ParentModel extends Model {}

class DataModel extends ParentModel {
  String _api = "https://covid19.soficoop.com/country/gh";

  bool _isLoading = false;
  List<CasesModel> _cases = [];

  String _timedOutText = '';

  bool _isToggle = false;

  void toggleSetter() {
    _isToggle = !_isToggle;
  }

  bool get isToggleState => _isToggle;

  bool get isLoading => _isLoading;

  String get timeOutText => _timedOutText;

  List<CasesModel> get getAllCases {
    return List.from(_cases);
  }

  CasesModel get currentCase {
    return _cases[_cases.length - 1];
  }

  Future<Null> getLastest() {
    print('latest');
    _isLoading = true;
    notifyListeners();
    return null;
  }

  Future<Null> fetchData() {
    print('fetch');
    _isLoading = true;
    notifyListeners();
    return http.get(_api).then<Null>((http.Response response) {
      // test by getting current case.
      // print(json.decode(response.body)['snapshots'][(json.decode(response.body)['snapshots'].length)-1]);
      final List<dynamic> fetchedList = json.decode(response.body)['snapshots'];
      final List<CasesModel> casesModelData = [];
      if (fetchedList == null) {
        _isLoading = false;
        notifyListeners();
        return;
      }
      fetchedList.forEach((dynamic map) {
        final CasesModel casesModel = CasesModel(
            map['cases'],
            map['todayCases'],
            map['todayDeaths'],
            map['critical'],
            map['active'],
            map['recovered'],
            map['deaths'],
            map['timestamp'].toString());
        casesModelData.add(casesModel);
      });
      _cases = casesModelData;
      print(_cases[_cases.length - 1].casesToday);
        _isLoading = false;
        notifyListeners();
   
      
      return;
    }).catchError((onError) {
      print('error occured.');
      print(onError);
      
      _isLoading = false;
      notifyListeners();
      return;
    }).timeout(Duration(seconds: 60), onTimeout: () {
      
      _isLoading = false;
      notifyListeners();
      return;
    });
  }
}

class ScrapePage extends ParentModel {

  int _casesd;
  int _deaths;
  int _recovered;

  int get allCases => _casesd;
  int get allDeaths => _deaths;
  int get allRecovered => _recovered;

  static bool _isLoading = false;

  bool get isLoading => _isLoading;

  List<String> regionCasesTitles = [];
  List<String> regionsConfirmedList = [];
  List<String> regionsRecoveredList = [];
  List<String> regionsDischargedList = [];
  List<String> regionsWell = [];
  List<String> regionsCritical = [];
  List<String> regionsDeaths = [];

  List<GlobalModel> _globalModel = [];

  List<GlobalModel> get globalModelData => List.of(_globalModel);

  List<RegionModel> regionModelData = [];

  final String _url = "https://www.worldometers.info/coronavirus/";
  final String _urlGHS = "https://ghanahealthservice.org/covid19/";

  Future<Null> getData() async {
    String c, d, r;
    _isLoading = true;
    notifyListeners();
    http.Response response = await http.get(_url);
      if (response.statusCode == 200) {
      dom.Document document = parser.parse(response.body);
      dom.Element cases =
          document.getElementsByClassName("maincounter-number")[0];
      dom.Element deaths =
          document.getElementsByClassName("maincounter-number")[1];
      dom.Element recovered =
          document.getElementsByClassName("maincounter-number")[2];
      
      // th, tb, tr, td
      dom.Element tableStats = 
          document.getElementsByTagName("tbody")[0];

      tableStats.getElementsByTagName("tr").forEach((dom.Element td) {
        print('global cases...');
        List<String> dataString = td.text.split("\n");
        GlobalModel globalModel = GlobalModel(
          // first item [0] is empty
          dataString[1],
          dataString[2],
          dataString[3],
          dataString[4],
          dataString[5],
          dataString[6],
          dataString[7],
          dataString[8],
        );
        print('country: ' + dataString[1]);
        _globalModel.add(globalModel);
      });
      
      print('countries');
      print(_globalModel[0].country);
      print(_globalModel[0].totalCases);
      print(_globalModel[0].newCases);
      print(_globalModel[0].totalDeaths);
      print(_globalModel[0].newDeaths);
      print(_globalModel[0].totalRecovered);
      print(_globalModel[0].activeCases);
      print(_globalModel[0].critical);

      
      c = cases.text.toString();
      d = deaths.text.toString();
      r = recovered.text.toString();
      print("cases: $c deaths: $d recovered: $r");
      _casesd = int.parse(c.replaceAll(',', ''));
      _deaths = int.parse(d.replaceAll(',', ''));
      _recovered = int.parse(r.replaceAll(',', ''));
      _isLoading = false;
      notifyListeners();
      }
    
  }

  // using firebase
  Future<Null> getRegionsData() async {
      http.Response response = await http.get(_urlGHS);
      if (response.statusCode == 200) {
        dom.Document document = parser.parse(response.body);
        int len = document.getElementsByClassName("widget-box-title").length;
        List<dom.Element> dataTitle = document.getElementsByClassName("widget-box-title");
        for (var i = 0; i < len; i++) {
          if (dataTitle[i].text == "What You Should Know") {
            continue;
          } else if (dataTitle[i].text == "Ghana's Total Confirmed Cases") {
            break;
          } else {
            regionsConfirmedList.add(dataTitle[i].text);
          }
          //print(dataTitle[i].text);
        } 

        len = document.getElementsByClassName("information-line-text").length;
        List<dom.Element> dataConfirmed = document.getElementsByClassName("information-line-text");
        for (var i = 0; i < len; i++) {
          print(dataConfirmed[i].text);
          if (int.parse(dataConfirmed[i].text.replaceAll(',', '')) > 700000) {
            break;
          }
        }
        
      }
  }
}
