import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:task_mind/Features/home/presentation/views/widgets/rating_widget.dart';

class GridVeiwElement extends StatelessWidget {
  const GridVeiwElement({
    super.key,
    required this.path,
    required this.name,
    required this.description,
    required this.newPrice,
    required this.oldPrice,
    required this.discount,
  });

  final String path;
  final String name;
  final String description;
  final String newPrice;
  final String oldPrice;
  final String discount;
  // final String path;
  // final String path;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 12 / 10,
            child: CachedNetworkImage(
              imageUrl: path,
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  color: const Color(0xffD8D8D8),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: imageProvider,
                  ),
                ),
              ),
              placeholder: (context, url) => Container(
                height: 165,
                width: 165,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: Color(0xffD8D8D8),
                ),
                child: const Center(child: CircularProgressIndicator()),
              ),
              errorWidget: (context, url, error) => Container(
                height: 165,
                width: 165,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: Color(0xffD8D8D8),
                ),
                child: const Center(child: Icon(Icons.error)),
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width * .5,
            child: GestureDetector(
              onTap: () {
                print('width : ${MediaQuery.sizeOf(context).width * .4}');
              },
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width * .15,
                        child: AutoSizeText(
                          // text.new:,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          name,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width * .15,
                        child: AutoSizeText(
                          description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // const Spacer(),
                  const Spacer(),
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width * .1,
                            child: Text(
                              maxLines: 1,
                              newPrice,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.amber,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width * .1,
                            child: const Text(
                              'درهم اماراتي',
                              maxLines: 1,
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.amber,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width * .1,
                            child: Text(
                              oldPrice,
                              maxLines: 1,
                              style: const TextStyle(
                                fontSize: 10,
                                
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width * .1,
                            child: const Text(
                              maxLines: 1,
                              'درهم اماراتي',
                              style: TextStyle(
                                fontSize: 8,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Container(
                            color: Colors.black,
                            child: Text(
                              '$discount %',
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const Row(
            children: [
              Rating(),
            ],
          )
        ],
      ),
    );
  }
}
