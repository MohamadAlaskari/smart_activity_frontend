import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vibe_day/data/repository/vibe_day_repository.dart';
import 'package:vibe_day/presentation/home/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required VibeDayRepository vibeDayRepository})
    : _vibeDayRepository = vibeDayRepository,
      super(HomeState()) {
    _init();
  }

  final VibeDayRepository _vibeDayRepository;

  Future<void> _init() async {}
}
