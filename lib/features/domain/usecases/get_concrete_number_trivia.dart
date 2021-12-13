import 'package:clean_architechture/core/error/failures.dart';
import 'package:clean_architechture/features/domain/enitties/number_trivia.dart';
import 'package:clean_architechture/features/domain/repositories/number_trivia_repository.dart';
import 'package:dartz/dartz.dart';

class GetConcreteNumberTrivia {
  final NumberTriviaRepository repository;

  GetConcreteNumberTrivia(this.repository);

  Future<Either<Failure, NumberTrivia>> call({
    int number = 0,
  }) async {
    return await repository.getConcreteNumberTrivia(number);
  }
}
