import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shobra_store_app/core/repo/home_repo.dart';
import 'package:shobra_store_app/feature/data/model.dart';
import 'package:shobra_store_app/feature/presentation/cubits/main_cubit_states.dart';
import 'package:shobra_store_app/feature/presentation/screens/card_screen.dart';
import 'package:shobra_store_app/feature/presentation/screens/home_screen.dart';
import 'package:shobra_store_app/feature/presentation/screens/receipt_screen.dart';
import 'package:shobra_store_app/feature/presentation/screens/rocket_screen.dart';
import 'package:shobra_store_app/feature/presentation/screens/setting_screen.dart';

class MainCubit extends Cubit<MainCubitStates> {
  MainCubit(this.homeRepo) : super(InitialMainState());

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

  final HomeRepo homeRepo;

  List<ProductModel> products = [];
  String? selectedCategory;

  Future<void> getAllProducts() async {
    emit(LoadingStates());

    var result = await homeRepo.getAllProduct();

    result.fold(
      (failure) => emit(ErrorGetDataState(errMessage: failure.errMessage)),
      (productsList) {
        products = productsList;
        emit(SuccessGetDataState());
      },
    );
  }

  Future<void> getProductsByCategory(String category) async {
    selectedCategory = category;
    emit(LoadingStates());

    var result = await homeRepo.getProductType(productType: category);

    result.fold(
      (failure) => emit(ErrorGetDataState(errMessage: failure.errMessage)),
      (productsList) {
        products = productsList;
        emit(SuccessGetDataState());
      },
    );
  }

  Future<void> resetProducts() async {
    selectedCategory = null;
    await getAllProducts();
  }
}
