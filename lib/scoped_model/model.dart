import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart' as dom;

import 'dart:convert';

import '../model/data_model.dart';

class ParentModel extends Model {

}

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
    return _cases[_cases.length-1];
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
         map['timestamp'].toString()
       );
       casesModelData.add(casesModel);
     });
      _cases = casesModelData;
      print(_cases[_cases.length-1].casesToday);
      _timedOutText = '';
      _isLoading = false;
      notifyListeners();
      return;
    }).catchError((onError) {
      print('error occured.');
      print(onError);
      _timedOutText = 'An error occured while trying to access endpoint.';
      _isLoading = false;
      notifyListeners();
      return;
    }).timeout(Duration(seconds: 60), onTimeout: () {
      _timedOutText = 'Connection Timeout. Please Check internet';
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

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  final String _url = "https://www.worldometers.info/coronavirus/";

  Future<List<String>> getData() async {
    String c,d,r;
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
      c = cases.text.toString();
      d = deaths.text.toString();
      r = recovered.text.toString();
      print("cases: $c");
      print("deaths: $d");
      print("recovered: $r");
      _casesd = int.parse(c.replaceAll(',', ''));
      _deaths = int.parse(d.replaceAll(',', ''));
      _recovered = int.parse(r.replaceAll(',', ''));
      _isLoading = false;
      notifyListeners();
    }
    return [];
  }
}
