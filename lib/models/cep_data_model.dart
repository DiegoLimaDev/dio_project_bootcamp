class CepDataModel {
  String? _street;
  String? _complement;
  String? _district;
  int? _districtId;
  String? _city;
  int? _cityId;
  int? _ibgeId;
  String? _state;
  String? _stateShortname;
  String? _zipcode;

  CepDataModel(
      {String? street,
      String? complement,
      String? district,
      int? districtId,
      String? city,
      int? cityId,
      int? ibgeId,
      String? state,
      String? stateShortname,
      String? zipcode}) {
    if (street != null) {
      this._street = street;
    }
    if (complement != null) {
      this._complement = complement;
    }
    if (district != null) {
      this._district = district;
    }
    if (districtId != null) {
      this._districtId = districtId;
    }
    if (city != null) {
      this._city = city;
    }
    if (cityId != null) {
      this._cityId = cityId;
    }
    if (ibgeId != null) {
      this._ibgeId = ibgeId;
    }
    if (state != null) {
      this._state = state;
    }
    if (stateShortname != null) {
      this._stateShortname = stateShortname;
    }
    if (zipcode != null) {
      this._zipcode = zipcode;
    }
  }

  String? get street => _street;
  set street(String? street) => _street = street;
  String? get complement => _complement;
  set complement(String? complement) => _complement = complement;
  String? get district => _district;
  set district(String? district) => _district = district;
  int? get districtId => _districtId;
  set districtId(int? districtId) => _districtId = districtId;
  String? get city => _city;
  set city(String? city) => _city = city;
  int? get cityId => _cityId;
  set cityId(int? cityId) => _cityId = cityId;
  int? get ibgeId => _ibgeId;
  set ibgeId(int? ibgeId) => _ibgeId = ibgeId;
  String? get state => _state;
  set state(String? state) => _state = state;
  String? get stateShortname => _stateShortname;
  set stateShortname(String? stateShortname) =>
      _stateShortname = stateShortname;
  String? get zipcode => _zipcode;
  set zipcode(String? zipcode) => _zipcode = zipcode;

  CepDataModel.fromJson(Map<String, dynamic> json) {
    _street = json['street'];
    _complement = json['complement'];
    _district = json['district'];
    _districtId = json['districtId'];
    _city = json['city'];
    _cityId = json['cityId'];
    _ibgeId = json['ibgeId'];
    _state = json['state'];
    _stateShortname = json['stateShortname'];
    _zipcode = json['zipcode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['street'] = this._street;
    data['complement'] = this._complement;
    data['district'] = this._district;
    data['districtId'] = this._districtId;
    data['city'] = this._city;
    data['cityId'] = this._cityId;
    data['ibgeId'] = this._ibgeId;
    data['state'] = this._state;
    data['stateShortname'] = this._stateShortname;
    data['zipcode'] = this._zipcode;
    return data;
  }
}
