class Pontuation {
  int _pontuation;

  Pontuation(int pontuation) : _pontuation = pontuation;

  int get pontuation => _pontuation;

  void increase(int value) => _pontuation += value;
  void decrease(int value) => _pontuation -= value;
  void setToZero() => _pontuation = 0;

  @override
  String toString() => _pontuation.toString();
}
