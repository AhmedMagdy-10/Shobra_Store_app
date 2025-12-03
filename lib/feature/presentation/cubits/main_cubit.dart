import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shobra_store_app/feature/presentation/cubits/main_cubit_states.dart';
import 'package:shobra_store_app/feature/presentation/screens/card_screen.dart';
import 'package:shobra_store_app/feature/presentation/screens/home_screen.dart';
import 'package:shobra_store_app/feature/presentation/screens/receipt_screen.dart';
import 'package:shobra_store_app/feature/presentation/screens/rocket_screen.dart';
import 'package:shobra_store_app/feature/presentation/screens/setting_screen.dart';

class MainCubit extends Cubit<MainCubitStates> {
  MainCubit() : super(InitialMainState());

  int currentIndexPage = 0;
  List pages = [
    HomeScreen(),
    CardScreen(),
    ReceiptScreen(),
    RocketScreen(),
    SettingScreen(),
  ];

  void togglePages(int currentIndex) {
    currentIndexPage = currentIndex;
    emit(ChangeScreenStates());
  }
}
