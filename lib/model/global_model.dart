class GlobalModel {
  String _country;
  String _totalCases;
  String _newCases;
  String _totalDeaths;
  String _newDeaths;
  String _totalRecovered;
  String _activeCases;
  String _critical;

  GlobalModel(
      this._country,
      this._totalCases,
      this._newCases,
      this._totalDeaths,
      this._newDeaths,
      this._totalRecovered,
      this._activeCases,
      this._critical);

  String get country => _country;
  String get totalCases => _totalCases;
  String get newCases => _newCases;
  String get totalDeaths => _totalDeaths;
  String get newDeaths => _newDeaths;
  String get totalRecovered => _totalRecovered;
  String get activeCases => _activeCases;
  String get critical => _critical;
}
