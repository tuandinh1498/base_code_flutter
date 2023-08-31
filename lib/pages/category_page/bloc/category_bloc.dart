import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(const CategoryState()) {
    on<CheckBoxEvent>(_onCheckBox);
  }
  void _onCheckBox(
      CheckBoxEvent event,
      Emitter<CategoryState> emit,
      ){
    emit(CategoryState().copyWith(isChecked: !state.isChecked));
    print(state.isChecked);
  }
}
