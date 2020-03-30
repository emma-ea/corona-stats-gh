import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

import '../model/data_model.dart';

class DataModel extends Model {
  String _api = "https://covid19.soficoop.com/country/gh";

  bool _isLoading = false;
  List<CasesModel> _cases = [];

  bool get isLoading => _isLoading;

  List<CasesModel> get getAllCases {
    return List.from(_cases);
  }

  CasesModel get currentCase {
    return _cases[_cases.length-1];
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
      _isLoading = false;
      notifyListeners();
      return;
    }).catchError((onError) {
      print(onError);
      _isLoading = false;
      notifyListeners();
      return;
    });
  }
}
