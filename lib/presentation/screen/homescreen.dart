import 'package:blooc/business_logic/cubit/chracters_cubit.dart';
import 'package:blooc/const/appcolor/appcolors.dart';
import 'package:blooc/const/class/hundling.dart';
import 'package:blooc/presentation/widget/closedsearchbar.dart';
import 'package:blooc/presentation/widget/gridviewcracters.dart';
import 'package:blooc/presentation/widget/searchbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ChractersCubit(),
        child: Scaffold(
          backgroundColor: AppColor.second,
          appBar: AppBar(
            backgroundColor: AppColor.frist,
            title: BlocBuilder<ChractersCubit, ChractersState>(
              builder: (context, state) {
                ChractersCubit cubit = ChractersCubit.get(context);
                return cubit.issearch == true
                    ? Searchbar(
                        onPressed: () {
                          cubit.changeappbar();
                        },
                        onChanged: (value) {
                          cubit.search(value);
                        },
                      )
                    : CloseSearch(onPressed: () {
                        cubit.changeappbar();
                      });
              },
            ),
          ),
          body: BlocBuilder<ChractersCubit, ChractersState>(
              builder: (context, state) {
            ChractersCubit cubit = ChractersCubit.get(context);
            if (state is StateRequest) {
              return AppHundling(
                ontap: () {
                  cubit.getAllDat();
                },
                statuseRequest: state.statuseRequest,
              );
            } else if (state is SuccessData) {
              return GridviewChracters(
                itemCount: cubit.data.length,
                model: cubit.data,
              );
            } else if (state is Search) {
              return state.data.isEmpty
                  ? Lottie.asset('assets/lottile/empty.json')
                  : GridviewChracters(
                      itemCount: cubit.searchdata.length,
                      model: cubit.searchdata);
            } else if (state is ChangeAppbar) {
              return Lottie.asset('assets/lottile/search.json');
            } else {
              return const SizedBox.shrink();
            }
          }),
        ));
  }
}
