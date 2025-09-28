import 'package:bookly_clean_arch_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_clean_arch_app/Features/home/domain/repos/home_repo.dart';
import 'package:bookly_clean_arch_app/core/errors/failure.dart';
import 'package:bookly_clean_arch_app/core/use_case/use_case.dart';
import 'package:dartz/dartz.dart';

class FetchSimllerBookUseCase extends UseCase {
  final HomeRepo homeRepo;

  FetchSimllerBookUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call([void params]) async {
    return await homeRepo.fetchSimllerBooks();
  }
}