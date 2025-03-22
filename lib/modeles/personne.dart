class Personne{
int _id;
String _nom;
String _metier;
int _telephone;
String _imageProfil;

Personne(
  this._id, this._nom, this._metier, this._telephone,this._imageProfil);

int get id => _id;
set id(int value) {
  _id = value;
}

String get nom => _nom;
set nom(String value) {
  nom = value;
}
String get metier =>_metier;
set metier(String value) {
 metier = value;
}

int get telephone => _telephone;
set telephone (int value) {
  telephone = value;
}

String get imageProfil => _imageProfil;
set imageProfil(String value) {
  _imageProfil = value;
}
}