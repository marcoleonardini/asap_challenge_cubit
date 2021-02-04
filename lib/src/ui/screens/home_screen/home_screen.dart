import 'package:flutter/material.dart';
import 'package:asap_challenge_cubit/src/ui/screens/home_screen/result_listwiew_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:asap_challenge_cubit/src/ui/widgets/drawers/main_menu_drawer.dart';
import 'package:asap_challenge_cubit/src/ui/widgets/no_result_list_view.dart';

import 'package:asap_challenge_cubit/src/core/providers/cubit.dart';

ValueNotifier typeOrders = ValueNotifier('active');

class HomeScreen extends StatelessWidget {
  static const String route = 'home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff15018E),
      appBar: AppBar(
        backgroundColor: Color(0xff391B91),
        elevation: 0.0,
      ),
      drawerScrimColor: Colors.white30,
      drawer: MainMenuDrawer(),
      body: Container(
        constraints: BoxConstraints.expand(),
        child: RefreshIndicator(
          onRefresh: () async {
            await Future.delayed(const Duration(milliseconds: 1500));
            context.read<CounterCubit>().increment();
            print('refreshing');

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
                  color: Color(0xff391B91),
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
                        return GestureDetector(
                          onTap: () {
                            typeOrders.value = 'active';
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 250),
                            curve: Curves.decelerate,
                            decoration: value == 'active'
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
                      },
                    ),
                    ValueListenableBuilder(
                      valueListenable: typeOrders,
                      builder: (context, value, _) {
                        return GestureDetector(
                          onTap: () {
                            typeOrders.value = 'past';
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 250),
                            curve: Curves.decelerate,
                            decoration: value == 'past'
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
                            child: Text('Past Orders'),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: BlocBuilder<CounterCubit, int>(
                  // cubit: CounterCubit(),
                  builder: (context, state) {
                    print(state);
                    return AnimatedSwitcher(
                      duration: const Duration(milliseconds: 450),
                      child: state < 3
                          ? NoResultsListView()
                          : ResultsListViewWidget(
                              key: UniqueKey(),
                              state: state,
                            ),
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
