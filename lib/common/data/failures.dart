//ignore_for_file: no_runtimeType_toString
class Failure {
  final String? message;
  final dynamic error;

  Failure(this.error, [this.message]);

  @override
  String toString() {
    return message ?? 'Failure of $runtimeType: $error';
  }
}

class GeneralFailure extends Failure {
  GeneralFailure(error) : super(error, 'GeneralFailure');
}

class LocalizationFailure extends Failure {
  LocalizationFailure(error) : super(error, 'LocalizationFailure');
}
