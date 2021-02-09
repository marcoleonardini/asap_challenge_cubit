import 'package:asap_challenge_cubit/src/core/const/app_colors.dart';
import 'package:asap_challenge_cubit/src/core/providers/order_provider.dart';
import 'package:flutter/material.dart';
import 'package:asap_challenge_cubit/src/ui/screens/home_screen/result_listwiew_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:asap_challenge_cubit/src/ui/widgets/drawers/main_menu_drawer.dart';
import 'package:asap_challenge_cubit/src/ui/widgets/no_result_list_view.dart';

ValueNotifier typeOrders = ValueNotifier('active');

class HomeScreen extends StatelessWidget {
  static const String route = 'home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.secondaryColor,
        elevation: 0.0,
      ),
      drawerScrimColor: Colors.white30,
      drawer: MainMenuDrawer(),
      body: Container(
        constraints: BoxConstraints.expand(),
        child: RefreshIndicator(
          onRefresh: () async {
            if (typeOrders.value == 'active') {
              await context.read<OrderProvider>().refreshActiveOrders();
            }
            if (typeOrders.value == 'past') {
              await context.read<OrderProvider>().refreshPastOrders();
            }

            return Future.value(true);
          },
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(24.0),
                padding: EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 24.0,
                ),
                decoration: BoxDecoration(
                  color: AppColors.secondaryColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(28),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ValueListenableBuilder(
                      valueListenable: typeOrders,
                      builder: (context, value, _) {
                        return AnimatedTab(
                          onTap: () {
                            typeOrders.value = 'active';
                            context.read<OrderProvider>().getActiveOrders();
                          },
                          value1: value,
                          value2: 'active',
                          text: 'Active Orders',
                        );
                      },
                    ),
                    ValueListenableBuilder(
                      valueListenable: typeOrders,
                      builder: (context, value, _) {
                        return AnimatedTab(
                          onTap: () {
                            typeOrders.value = 'past';
                            context.read<OrderProvider>().getPastOrders();
                          },
                          value1: value,
                          value2: 'past',
                          text: 'Past Orders',
                        );
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: BlocBuilder<OrderProvider, OrderState>(
                  builder: (context, state) {
                    var widgetReturn;
                    if (state is OrderInitial) {
                      widgetReturn = Center(child: CircularProgressIndicator());
                    } else if (state is OrderLoading) {
                      widgetReturn = Center(child: CircularProgressIndicator());
                    } else if (state is OrderLoaded) {
                      final list = typeOrders.value == 'active'
                          ? state.order
                          : state.order;

                      widgetReturn = list.isEmpty
                          ? NoResultsListView()
                          : ResultsListViewWidget(
                              key: UniqueKey(),
                              listOrders: list,
                            );
                    }
                    return AnimatedSwitcher(
                      duration: const Duration(milliseconds: 450),
                      child: widgetReturn,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AnimatedTab extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final String value1;
  final String value2;
  const AnimatedTab({
    Key key,
    @required this.text,
    @required this.onTap,
    @required this.value1,
    @required this.value2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        curve: Curves.decelerate,
        decoration: value1 == value2
            ? BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: Color(0xff160046),
              )
            : BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: Colors.transparent,
              ),
        padding: EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 20.0,
        ),
        child: Text('Active Orders'),
      ),
    );
  }
}
