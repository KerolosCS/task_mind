import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_mind/Features/home/presentation/manager/cubit/cubit/more_cubit.dart';
import 'package:task_mind/Features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:task_mind/Features/home/presentation/views/widgets/home_grid_view.dart';
import 'package:task_mind/Features/home/presentation/views/widgets/home_view_body.dart';


class AllProductsView extends StatefulWidget {
  const AllProductsView({super.key});

  @override
  State<AllProductsView> createState() => _AllProductsViewState();
}

class _AllProductsViewState extends State<AllProductsView> {
  @override
  void initState() {
    context.read<MoreCubit>().getMoreData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: const [
          Directionality(
            textDirection: TextDirection.ltr,
            child: CustomArrowBack(),
          )
        ],
        title: const Text('المنتجات'),
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(
                height: 16,
              ),
              // GridViewWidget(),
              GridViewWidgetForAllProducts(),
            ],
          ),
        ),
      ),
    );
  }
}
class CustomArrowBack extends StatelessWidget {
  const CustomArrowBack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Container(
        height: 35,
        width: 35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.amber,
        ),
        child: Center(
          child: IconButton(
            padding: const EdgeInsets.all(0),
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
      ),
    );
  }
}
