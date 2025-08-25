abstract class Faluire {
  final String message;
  Faluire(this.message);
}

class ServerFailure extends Faluire {
  ServerFailure(super.message);
}
