import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gamex/repository/game_repository.dart';
import 'package:gamex/repository/models/genre.dart';
import 'package:meta/meta.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc({required this.gameRepository}) : super(const CategoryState()) {
    on<GetCategories>(_mapGetGategoriesToState);
    on<SelectCategory>(_mapSelectCategoryToState);
  }
  final GameRepository gameRepository;

  _mapGetGategoriesToState(
      GetCategories event, Emitter<CategoryState> emit) async {
    emit(state.copyWith(status: CategoryStatus.loading));
    try {
      final genres = await gameRepository.getGenres();
      emit(
        state.copyWith(
          status: CategoryStatus.success,
          categories: genres,
        ),
      );
    } catch (error) {
      emit(state.copyWith(status: CategoryStatus.error));
    }
  }

  _mapSelectCategoryToState(SelectCategory event, Emitter<CategoryState> emit) {
    emit(
      state.copyWith(
        status: CategoryStatus.selected,
        idSelected: event.idSelected,
      ),
    );
  }
}
