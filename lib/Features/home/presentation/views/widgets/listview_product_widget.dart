import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:task_mind/Features/home/presentation/views/widgets/rating_widget.dart';

class ListViewProductWidget extends StatelessWidget {
  const ListViewProductWidget({
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
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageUrl: path,
            alignment: Alignment.center,
            placeholder: (context, url) => const SizedBox(
              height: 100,
              width: 100,
              child: CircularProgressIndicator(),
            ),
            errorWidget: (context, url, error) => const SizedBox(
              height: 100,
              width: 100,
              child: Icon(Icons.error),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Rating(),
                Row(
                  children: [
                    Text(
                      newPrice,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    const Text(
                      'درهم اماراتي',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      oldPrice,
                      style: const TextStyle(
                        fontSize: 15,
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
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Container(
                  color: Colors.black,
                  child: Text(
                    discount,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
