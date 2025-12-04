abstract class MainCubitStates {}

class InitialMainState extends MainCubitStates {}

class ChangeScreenStates extends MainCubitStates {}

class LoadingStates extends MainCubitStates {}

class SuccessGetDataState extends MainCubitStates {}

class ErrorGetDataState extends MainCubitStates {
  final String errMessage;

  ErrorGetDataState({required this.errMessage});
}

class CartItemAddedState extends MainCubitStates {}

class CartUpdatedState extends MainCubitStates {}

class CartItemRemovedState extends MainCubitStates {}

class SettingDarkModeChangeState extends MainCubitStates {}

class SettingLanguageChangeState extends MainCubitStates {}
