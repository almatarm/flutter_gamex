import 'package:gamex/repository/models/genre.dart';
import 'package:gamex/repository/service/game_service.dart';

class GameRepository {
  final GameService service;

  const GameRepository({required this.service});

  Future<List<Genre>> getGenres() async => service.getGenres();
}
