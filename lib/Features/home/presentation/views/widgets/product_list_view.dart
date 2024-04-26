import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_mind/Features/home/presentation/manager/cubit/home_cubit.dart';

import 'listview_product_widget.dart';

class ProductListViewForYou extends StatelessWidget {
  const ProductListViewForYou({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is GetDataSuccesfully) {


            
            return ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => ListViewProductWidget(
                name: state.model.data.selectedProducts[index].name,
                description: state.model.data.selectedProducts[index].shortDesc,
                discount: state.model.data.selectedProducts[index].discount,
                newPrice: state.model.data.selectedProducts[index].salePrice,
                oldPrice: state.model.data.selectedProducts[index].listPrice,
                path: state.model.data.selectedProducts[index].mainImage,
              ),
              separatorBuilder: (context, index) => const SizedBox(
                width: 16,
              ),
              itemCount: state.model.data.selectedProducts.length,
            );
          } else if (state is GetDataLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GetDataError) {
            return Text(state.error);
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}

class ProductListViewNew extends StatelessWidget {
  const ProductListViewNew({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is GetDataSuccesfully) {
            return ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => ListViewProductWidget(
                name: state.model.data.newProducts[index].name,
                description: state.model.data.newProducts[index].shortDesc,
                discount: state.model.data.newProducts[index].discount,
                newPrice: state.model.data.newProducts[index].salePrice,
                oldPrice: state.model.data.newProducts[index].listPrice,
                path: state.model.data.newProducts[index].mainImage,
              ),
              separatorBuilder: (context, index) => const SizedBox(
                width: 16,
              ),
              itemCount: state.model.data.newProducts.length,
            );
          } else if (state is GetDataLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GetDataError) {
            return Text(state.error);
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
