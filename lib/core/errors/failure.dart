abstract class Failure {
  late final String message;

  Failure(this.message);
}

class NetworkFailure extends Failure {
  NetworkFailure(String message) : super(message);
}

class ServerFailure extends Failure {
  ServerFailure(String message) : super(message);
}

class CacheFailure extends Failure {
  CacheFailure(String message) : super(message);
}

class AuthenticationFailure extends Failure {
  AuthenticationFailure(String message) : super(message);
}
