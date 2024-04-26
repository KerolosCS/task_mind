import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_mind/Features/home/presentation/manager/cubit/home_cubit.dart';

class CustomSlider extends StatelessWidget {
  const CustomSlider({super.key, required this.height});
  final double height;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is GetDataSuccesfully) {
          return CarouselSlider(
            options: CarouselOptions(
              // onPageChanged: (index, reason) => null,
              viewportFraction: 1,
              height: height,
              enableInfiniteScroll: true,
              autoPlay: true,
              autoPlayCurve: Curves.fastOutSlowIn,
              autoPlayInterval: const Duration(seconds: 3),
            ),
            items: context.read<HomeCubit>().model!.data.slider.map(
              (i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      height: 500,
                      width: MediaQuery.sizeOf(context).width - 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        // color: Colors.amber,
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: CachedNetworkImageProvider(
                            i.image,
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ).toList(),
          );
        } else if (state is GetDataError) {
          return const Center(child: Text('Check your internet connection'));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
