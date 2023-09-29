class CardDetailModel {
  int _id;
  String _title;
  String _url;
  String _text;

  CardDetailModel(this._id, this._title, this._url, this._text);

  int getId() {
    return _id;
  }

  String getTitle() {
    return _title;
  }

  String getUrl() {
    return _url;
  }

  String getText() {
    return _text;
  }
}
