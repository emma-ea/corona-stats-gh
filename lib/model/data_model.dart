// model for cases from api:: https://covid19.soficoop.com/country/gh

class CasesModel {

  String _totalCases;
  String _casesToday;
  String _deathsToday;
  String _critical;
  String _active;
  String _recovered;
  String _totalDeaths;
  String _timeStamp;

  CasesModel(this._totalCases, this._casesToday, this._deathsToday, this._critical, this._active, this._recovered, this._totalDeaths, this._timeStamp);
  
  String get totalCases => _totalCases;

  String get casesToday => _casesToday;

  String get deathsToday => _deathsToday;

  String get critical => _critical;

  String get active => _active;

  String get recovered => _recovered;

  String get totalDeaths => _totalDeaths;

  String get timeStamp => _timeStamp;


}