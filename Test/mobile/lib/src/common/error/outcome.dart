class Outcome<T> {
  final T? data;
  final String? error;

  Outcome({this.data, this.error});

  bool get hasData => data != null;
  bool get hasError => error != null;
}