enum SequenceType { increase, decrease, none }

class Sequence {
  Sequence();

  late SequenceType _sequenceType = SequenceType.none;
  int _sequenceCount = 1;

  set newSequenceType(SequenceType sequenceType) => _sequenceType = sequenceType;

  SequenceType get type => _sequenceType;
  int get count => _sequenceCount;

  void increase() => _sequenceCount++;
  void reset() => _sequenceCount = 1;
}
