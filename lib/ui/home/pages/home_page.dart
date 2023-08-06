import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gamex/repository/game_repository.dart';
import 'package:gamex/repository/service/game_service.dart';
import 'package:gamex/ui/home/pages/home_layout.dart';
import 'package:gamex/ui/home/widgets/category_widget/bloc/category_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrangeAccent,
      appBar: AppBar(
        title: const Text('Info Games'),
      ),
      body: RepositoryProvider(
        create: (context) => GameRepository(service: GameService()),
        child: MultiBlocProvider(
          providers: [
            // BlocProvider<AllGamesBloc>(
            //   create: (context) => AllGamesBloc(
            //     gameRepository: context.read<GameRepository>(),
            //   )..add(GetGames()),
            // ),
            BlocProvider<CategoryBloc>(
              create: (context) => CategoryBloc(
                gameRepository: context.read<GameRepository>(),
              )..add(GetCategories()),
            ),
            // BlocProvider<GamesByCategoryBloc>(
            //   create: (context) => GamesByCategoryBloc(
            //     gameRepository: context.read<GameRepository>(),
            //   ),
            // ),
          ],
          child: const HomeLayout(),
        ),
      ),
    );
  }
}
