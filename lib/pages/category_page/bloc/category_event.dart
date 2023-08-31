part of 'category_bloc.dart';

@immutable
abstract class CategoryEvent {
  const CategoryEvent();
}

class CheckBoxEvent extends CategoryEvent{

}

class RadioButtonEvent extends CategoryEvent{

}

class SliderEvent extends CategoryEvent{

}
