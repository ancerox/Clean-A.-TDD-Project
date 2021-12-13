import 'package:clean_architechture/features/domain/enitties/number_trivia.dart';
import 'package:clean_architechture/features/domain/repositories/number_trivia_repository.dart';
import 'package:clean_architechture/features/domain/usecases/get_concrete_number_trivia.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_concrete_number_trivia_test.mocks.dart';

@GenerateMocks(
  [NumberTriviaRepository],
)
void main() {
  late GetConcreteNumberTrivia usecase;
  late NumberTriviaRepository numberTriviaRepository;

  setUp(() {
    numberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetConcreteNumberTrivia(numberTriviaRepository);
  });

  final tNumber = 1;
  final tNumberTrivia = NumberTrivia(number: 1, text: 'test');

  test('Should get trivia for the number from the repositories', () async {
    //arrange

    when(numberTriviaRepository.getConcreteNumberTrivia(1))
        .thenAnswer((_) async => Right(tNumberTrivia));

    final result = await usecase(number: tNumber);

    expect(result, Right(tNumberTrivia));

    verify(numberTriviaRepository.getConcreteNumberTrivia(tNumber));

    verifyNoMoreInteractions(numberTriviaRepository);
  });
}
