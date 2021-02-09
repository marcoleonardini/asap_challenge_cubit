import 'package:asap_challenge_cubit/src/core/const/app_colors.dart';
import 'package:asap_challenge_cubit/src/core/providers/order_provider.dart';
import 'package:asap_challenge_cubit/src/ui/widgets/animated_tabbar/animated_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:asap_challenge_cubit/src/ui/screens/home_screen/result_listwiew_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:asap_challenge_cubit/src/ui/widgets/drawers/main_menu_drawer.dart';
import 'package:asap_challenge_cubit/src/ui/widgets/no_result_list_view.dart';

const ACTIVE_ORDERS = 'active';
const PAST_ORDERS = 'past';

ValueNotifier<String> typeOrders = ValueNotifier(ACTIVE_ORDERS);

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
            if (typeOrders.value == ACTIVE_ORDERS) {
              await context.read<OrderProvider>().refreshActiveOrders();
            }
            if (typeOrders.value == PAST_ORDERS) {
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
                        return AnimatedTabbar(
                          onTap: () {
                            typeOrders.value = ACTIVE_ORDERS;
                            context.read<OrderProvider>().getActiveOrders();
                          },
                          value1: value,
                          value2: ACTIVE_ORDERS,
                          text: 'Active Orders',
                        );
                      },
                    ),
                    ValueListenableBuilder(
                      valueListenable: typeOrders,
                      builder: (context, value, _) {
                        return AnimatedTabbar(
                          onTap: () {
                            typeOrders.value = PAST_ORDERS;
                            context.read<OrderProvider>().getPastOrders();
                          },
                          value1: value,
                          value2: PAST_ORDERS,
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
                      final list = state.order;

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
