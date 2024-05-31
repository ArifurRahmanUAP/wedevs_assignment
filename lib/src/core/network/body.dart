import 'package:dartz/dartz.dart';

import '../error/failures.dart';

class BodyCall<Type> {
  Future<Either<Failure, Type>> call(Future<Type> Function() callable) async {
    try {
      final remoteData = await callable();
      return right(remoteData);
    } on ServerFailure catch (e) {
      return left(ServerFailure(message: e.message!));
    }
  }
}
