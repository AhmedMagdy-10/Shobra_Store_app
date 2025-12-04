import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shobra_store_app/core/helper/show_toasts_state.dart';
import 'package:shobra_store_app/core/repo/home_repo.dart';
import 'package:shobra_store_app/feature/data/cart_item_model.dart';
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
    CartScreen(),
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
    selectedCategory = null;
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

  Future<void> getCategoryProduct(String category) async {
    selectedCategory = category;
    emit(LoadingStates());

    var result = await homeRepo.getProductType(productType: category);

    result.fold(
      (failure) {
        emit(ErrorGetDataState(errMessage: failure.errMessage));
      },
      (productsList) {
        products = productsList;
        emit(SuccessGetDataState());
      },
    );
  }

  List<CartItemModel> cartItems = [];

  // Add to cart
  void addToCart(ProductModel product) {
    // Check if product already exists
    final existingIndex = cartItems.indexWhere(
      (item) => item.productId == product.id,
    );

    if (existingIndex != -1) {
      // Increase quantity
      cartItems[existingIndex].quantity++;
    } else {
      // Add new item
      cartItems.add(
        CartItemModel(
          productId: product.id,
          title: product.title,
          price: product.price,
          image: product.image,
          category: product.category,
          quantity: 0,
        ),
      );
    }

    emit(CartItemAddedState());
    showToast(
      text: 'تم اضافة  المنتج الي السلة بنجاح',
      state: ToastStates.success,
    );
    emit(CartUpdatedState());
  }

  // Remove from cart
  void removeFromCart(int productId) {
    cartItems.removeWhere((item) => item.productId == productId);
    emit(CartItemRemovedState());
    emit(CartUpdatedState());
  }

  // Increase quantity
  void increaseQuantity(int productId) {
    final item = cartItems.firstWhere((item) => item.productId == productId);
    item.quantity++;
    emit(CartUpdatedState());
  }

  // Decrease quantity
  void decreaseQuantity(int productId) {
    final item = cartItems.firstWhere((item) => item.productId == productId);
    if (item.quantity > 1) {
      item.quantity--;
      emit(CartUpdatedState());
    }
  }

  // Total items count
  int get totalItems => cartItems.fold(0, (sum, item) => sum + item.quantity);

  // Total price
  double get totalPrice =>
      cartItems.fold(0, (sum, item) => sum + item.totalPrice);

  // Clear cart
  void clearCart() {
    cartItems.clear();
    emit(CartUpdatedState());
  }

  bool isDarkMode = false;
  void toggleMode() {
    isDarkMode = !isDarkMode;
    emit(SettingDarkModeChangeState());
  }

  String selectedLangauge = 'العربية';
  void changeLangauge(String langauge) {
    selectedLangauge = langauge;
    emit(SettingLanguageChangeState());
  }
}
