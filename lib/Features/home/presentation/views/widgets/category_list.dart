import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_mind/Features/home/presentation/manager/cubit/home_cubit.dart';

import 'category_item.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is GetDataSuccesfully) {
            return ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => CategoryItem(
                  path: state.model.data.categories[index].icon,
                  txt: state.model.data.categories[index].catName),
              separatorBuilder: (context, index) => const SizedBox(width: 16),
              itemCount: state.model.data.categories.length,
            );
          } else if (state is LoginLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is LoginError) {
            return Text(state.error);
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
