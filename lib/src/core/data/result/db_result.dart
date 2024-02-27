class DataResponse {}

class Ok<T> extends DataResponse {}

class Failure<T> extends DataResponse {
  final T error;
  Failure(this.error);
}
