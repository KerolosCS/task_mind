import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_mind/Features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:task_mind/Features/home/presentation/views/all_products_view.dart';
import 'package:task_mind/Features/home/presentation/views/widgets/category_list.dart';
import 'package:task_mind/Features/home/presentation/views/widgets/custom_search.dart';
import 'package:task_mind/Features/home/presentation/views/widgets/custom_slider.dart';
import 'package:task_mind/Features/home/presentation/views/widgets/home_grid_view.dart';
import 'package:task_mind/Features/home/presentation/views/widgets/product_list_view.dart';
import 'package:task_mind/core/utils/my_functions.dart';

import 'info_widget.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * .02,
                  ),
                  const CustomSearch(),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomSlider(height: MediaQuery.sizeOf(context).height * .22),
                  const SizedBox(height: 16),
                  // const CategoryItem(),
                  const CategoryList(),
                  const SizedBox(height: 16),
                  Info(
                    txt: 'المنتجات',
                    onPressed: () => MyFunctions.navigation(
                        context, const AllProductsView()),
                  ),
                  // const GridVeiwElement()
                  const SizedBox(height: 16),
                  const GridViewWidget(),
                  const SizedBox(height: 32),
                  const Info(txt: 'منتجات مختارة لك'),
                  const SizedBox(height: 16),
                  // const ListViewProductWidget()
                  const ProductListViewForYou(),
                  const SizedBox(height: 16),
                  const Info(txt: 'منتجات جديدة'),
                  const ProductListViewNew(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
