import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_mind/Features/home/presentation/manager/cubit/cubit/more_cubit.dart';
import 'package:task_mind/Features/home/presentation/manager/cubit/home_cubit.dart';

import 'grid_view_element.dart';

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is GetDataSuccesfully) {
          return GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 16,
            childAspectRatio: 1 / 1.5, // width/height
            children: List.generate(
              state.model.data.products.length,
              (index) => GridVeiwElement(
                path: state.model.data.products[index].mainImage,
                description: state.model.data.products[index].shortDesc,
                discount: state.model.data.products[index].discount,
                name: state.model.data.products[index].name,
                newPrice: state.model.data.products[index].listPrice,
                oldPrice: state.model.data.products[index].salePrice,
              ),
              // ProductsCubit.get(context).products.length,
              // (index) => ProductItem(
              //   product: ProductsCubit.get(context).products[index],
              // ),
            ),
          );
        } else if (state is GetDataLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return const Text('Check your internet connection');
        }
      },
    );
  }
}

class GridViewWidgetForAllProducts extends StatelessWidget {
  const GridViewWidgetForAllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoreCubit, MoreState>(
      builder: (context, state) {
        if (state is GetMoreDataSuccesfully) {
          return GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 16,
            childAspectRatio: 1 / 1.5, // width/height
            children: List.generate(
              state.model.data.length,
              (index) => GridVeiwElement(
                path: state.model.data[index].mainImage,
                description: state.model.data[index].shortDesc,
                discount: state.model.data[index].discount,
                name: state.model.data[index].name,
                newPrice: state.model.data[index].listPrice,
                oldPrice: state.model.data[index].salePrice,
              ),
              // ProductsCubit.get(context).products.length,
              // (index) => ProductItem(
              //   product: ProductsCubit.get(context).products[index],
              // ),
            ),
          );
        } else if (state is GetMoreDataLoading) {
          return Center(
              child: Column(
            children: [
              SizedBox(height: MediaQuery.sizeOf(context).height * .5 - 40),
              const CircularProgressIndicator(),
            ],
          ));
        } else if (state is GetMoreDataError) {
          return Text(state.error);
        } else {
          return const Text('Check your internet connection');
        }
      },
    );
  }
}
