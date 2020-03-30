// model for cases from api:: https://covid19.soficoop.com/country/gh

class CasesModel {

  int _totalCases;
  int _casesToday;
  int _deathsToday;
  int _critical;
  int _active;
  int _recovered;
  int _totalDeaths;
  String _timeStamp;

  CasesModel(this._totalCases, this._casesToday, this._deathsToday, this._critical, this._active, this._recovered, this._totalDeaths, this._timeStamp);
  
  int get totalCases => _totalCases;

  int get casesToday => _casesToday;

  int get deathsToday => _deathsToday;

  int get critical => _critical;

  int get active => _active;

  int get recovered => _recovered;

  int get totalDeaths => _totalDeaths;

  String get timeStamp => _timeStamp;


}