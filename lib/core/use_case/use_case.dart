
import 'package:bookly_clean_arch_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<Type, Para> {
  Future<Either<Failure, Type>> call(Para params);
}
