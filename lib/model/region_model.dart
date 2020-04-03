class RegionModel {
  
  String _title;
  String _confirmed;
  String _recovered;
  String _discharged;
  String _well;
  String _critical;
  String _deaths;

  RegionModel(
    this._title, 
    this._confirmed, 
    this._recovered, 
    this._discharged, 
    this._well, 
    this._critical, 
    this._deaths
  );

  String get getTitle => _title;
  String get getConfirmed => _confirmed;
  String get getRecovered => _recovered;
  String get getDischarged => _discharged;
  String get getWell => _well;
  String get getCritical => _critical;
  String get getDeaths => _deaths;

}