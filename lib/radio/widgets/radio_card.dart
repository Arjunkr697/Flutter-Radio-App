import 'package:flutter/material.dart';

class RadioCard extends StatelessWidget {
  const RadioCard({
    super.key,
    required this.onTab,
    required this.item,
  });

  final Map<String, dynamic> item;
  final void Function() onTab;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      color: Colors.grey.shade900,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: onTab,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Thumbnail
            Container(
              height: 110,
              decoration: BoxDecoration(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(16)),
                image: DecorationImage(
                  image: NetworkImage(item['imageURL']),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Text and button below thumbnail
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['name'],
                    style: theme.textTheme.labelLarge!.copyWith(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item['location'],
                    style: theme.textTheme.bodyMedium!.copyWith(
                      color: Colors.grey.shade400,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item['listener'],
                    style: theme.textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade500,
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Play/Pause button
                  ElevatedButton(
                    onPressed: onTab,
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          item['isPlay'] ? Colors.red : Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          item['isPlay'] ? Icons.pause : Icons.play_arrow,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          item['isPlay'] ? 'Pause' : 'Play',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
