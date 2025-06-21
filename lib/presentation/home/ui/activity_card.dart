import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:vibe_day/domain/model/activity.dart';

class ActivityCard extends StatelessWidget {
  final Activity activity;
  final VoidCallback? onTap;

  const ActivityCard({super.key, required this.activity, this.onTap});

  Color _getCategoryColor(String category) {
    switch (category.toLowerCase()) {
      case 'nature':
        return Colors.green;
      case 'music':
        return Colors.orange;
      case 'culture':
        return Colors.blue;
      case 'food':
        return Colors.red;
      case 'sport':
      case 'movement':
        return Colors.purple;
      default:
        return Colors.grey;
    }
  }

  IconData _getCategoryIcon(String category) {
    switch (category.toLowerCase()) {
      case 'nature':
      case 'outdoors':
        return Icons.nature;
      case 'music':
        return Icons.music_note;
      case 'culture':
        return Icons.theater_comedy;
      case 'food':
        return Icons.restaurant;
      case 'sport':
      case 'movement':
        return Icons.directions_run;
      case 'chill':
        return Icons.coffee;
      case 'night out':
        return Icons.nightlife;
      default:
        return Icons.local_activity;
    }
  }

  Widget _buildImageWidget() {
    if (activity.images.isEmpty) {
      return Container(
        color: _getCategoryColor(activity.category).withOpacity(0.1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              _getCategoryIcon(activity.category),
              size: 40,
              color: _getCategoryColor(activity.category),
            ),
            const SizedBox(height: 8),
            Text(
              activity.category.toUpperCase(),
              style: TextStyle(
                color: _getCategoryColor(activity.category),
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ],
        ),
      );
    }

    return Image.network(
      activity.images.first,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return Container(
          color: Colors.grey[200],
          child: const Center(child: CircularProgressIndicator()),
        );
      },
      errorBuilder: (context, error, stackTrace) {
        return Container(
          color: Colors.grey[300],
          child: const Center(child: Icon(Icons.broken_image)),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final startTimeStr = DateFormat.Hm().format(activity.startTime);
    final endTimeStr = DateFormat.Hm().format(activity.endTime);
    final dateStr = DateFormat.yMd().format(activity.startTime);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _getCategoryColor(activity.category),
            width: 3,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            height: 200,
            color: Colors.white,
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: SizedBox(
                    width: double.infinity,
                    child: Stack(
                      children: [
                        Positioned.fill(child: _buildImageWidget()),
                        Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Colors.transparent, Colors.black12],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '$dateStr | $startTimeStr - $endTimeStr',
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(height: 2),
                        Flexible(
                          child: Text(
                            activity.title,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                '${'HOME.ACTIVITY.COSTS'.tr()}: ${activity.price}',
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ),
                            Flexible(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    size: 12,
                                    color: Colors.grey[600],
                                  ),
                                  const SizedBox(width: 2),
                                  Flexible(
                                    child: Text(
                                      activity.location.name,
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: Colors.grey[600],
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
