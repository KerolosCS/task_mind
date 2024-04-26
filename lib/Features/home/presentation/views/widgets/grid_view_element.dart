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
      width: 165,
      child: Column(
        children: [
          CachedNetworkImage(
            imageUrl: path,
            imageBuilder: (context, imageProvider) => Container(
              height: 165,
              width: 165,
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
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 60,
                    child: Text(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 60,
                    child: Text(
                      description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 10,
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        newPrice,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.amber,
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      const Text(
                        'درهم اماراتي',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.amber,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        oldPrice,
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      const Text(
                        'درهم اماراتي',
                        style: TextStyle(
                          fontSize: 8,
                          color: Colors.black,
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
