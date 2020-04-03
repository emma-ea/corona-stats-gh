import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart' as dom;
import 'package:scoped_model/scoped_model.dart';

class ScrapePage {

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


  final String _url = "https://www.worldometers.info/coronavirus/";

  Future<Null> getData() async {
    String c, d, r;
    _isLoading = true;
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
      print("cases: $c deaths: $d recovered: $r");
      _casesd = int.parse(c.replaceAll(',', ''));
      _deaths = int.parse(d.replaceAll(',', ''));
      _recovered = int.parse(r.replaceAll(',', ''));
      _isLoading = false;
      }
    
  }

}
