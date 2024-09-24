import 'dart:math';
import 'package:flutter/material.dart';

class Player extends StatelessWidget {
  const Player({
    Key? key,
    required this.percentageOpen,
    required this.title,
    required this.listener,
    required this.imageURL,
    required this.icon,
    required this.onTab,
    this.metadata,
  }) : super(key: key);

  final double percentageOpen;
  final String title;
  final String listener;
  final String imageURL;
  final IconData icon;
  final Future<void> Function() onTab;
  final List<String>? metadata;

  @override
  Widget build(BuildContext context) {
    double heights = MediaQuery.of(context).size.height;
    final imageHeight = 64 + (percentageOpen * heights * 0.5);
    Uri image;
    String metaTitle;
    String metaDescription;
    if (metadata != null) {
      metaTitle = metadata![0];
      metaDescription = metadata![1];
      image = Uri.parse(metadata![2]);
    } else {
      metaTitle = 'Metadata';
      metaDescription = '';
      image = Uri.parse(imageURL);
    }

    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: heights),
      child: Stack(
        children: <Widget>[
          Container(
            color: Colors.black,
            height: heights,
          ),
          Opacity(
            opacity: max(0, 1 - (percentageOpen * 4)),
            child: SizedBox(
              height: 70,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(width: 64),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            listener,
                            style: TextStyle(color: Colors.grey[400]),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: Icon(icon),
                      onPressed: onTab,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Opacity(
            opacity:
                percentageOpen > 0.5 ? min(1, (percentageOpen - 0.5) * 2) : 0,
            child: Column(
              children: [
                SizedBox(height: imageHeight * 0.9),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.thumb_down_alt_outlined,
                        size: 20, color: Colors.white),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            listener,
                            style: TextStyle(color: Colors.grey[400]),
                          ),
                          Text(
                            metaTitle,
                            style: TextStyle(color: Colors.grey[400]),
                          ),
                          Text(
                            metaDescription,
                            style: TextStyle(color: Colors.grey[400]),
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.thumb_up_alt_outlined,
                        size: 20, color: Colors.white),
                  ],
                ),
                const SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Divider(color: Colors.grey[600]),
                ),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('0:00', style: TextStyle(color: Colors.grey[400])),
                      Text('3:27', style: TextStyle(color: Colors.grey[400])),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.shuffle, size: 32, color: Colors.white),
                      const Icon(Icons.skip_previous,
                          size: 32, color: Colors.white),
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          color: Colors.grey[800],
                          shape: BoxShape.circle,
                        ),
                        padding: const EdgeInsets.all(12),
                        child: IconButton(
                          onPressed: onTab,
                          icon: Icon(icon, size: 36, color: Colors.white),
                        ),
                      ),
                      const Icon(Icons.skip_next,
                          size: 32, color: Colors.white),
                      const Icon(Icons.repeat, size: 32, color: Colors.white),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: imageHeight,
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(image.toString(), fit: BoxFit.cover),
            ),
          ),
        ],
      ),
    );
  }
}
