import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:vibe_day/domain/model/activity.dart';

class ActivityCard extends StatelessWidget {
  final Activity activity;
  final VoidCallback? onTap;

  const ActivityCard({super.key, required this.activity, this.onTap});

  Color _getCategoryColor(String category) {
    switch (category.toLowerCase()) {
      case 'outdoors':
      case 'miscellaneous':
        return Colors.green;
      case 'night out':
      case 'music party':
      case 'music concert':
      case 'comedy':
        return Colors.deepPurple;
      case 'culture':
      case 'arts & theatre':
      case 'art gallery':
      case 'art exhibition':
      case 'literature & arts':
      case 'music & arts':
      case 'theatre':
        return Colors.indigo;
      case 'chill':
        return Colors.brown;
      case 'sports':
        return Colors.orange;
      case 'food & drink':
      case 'dining':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  IconData _getCategoryIcon(String category) {
    switch (category.toLowerCase()) {
      case 'outdoors':
      case 'miscellaneous':
        return Icons.nature;
      case 'culture':
      case 'arts & theatre':
      case 'art gallery':
      case 'art exhibition':
      case 'literature & arts':
      case 'music & arts':
      case 'theatre':
        return Icons.theater_comedy;
      case 'sports':
        return Icons.directions_run;
      case 'chill':
        return Icons.coffee;
      case 'night out':
      case 'music party':
      case 'music concert':
      case 'comedy':
        return Icons.nightlife;
      case 'food & drink':
      case 'dining':
        return Icons.restaurant;
      default:
        return Icons.local_activity;
    }
  }

  Widget _buildHealthDataIcon(BuildContext context) {
    if (!activity.healthDataMatch) {
      return const SizedBox.shrink();
    }

    return Positioned(
      top: 0,
      right: 0,
      child: GestureDetector(
        onTap: () {
          _showHealthDataDialog(context);
        },
        behavior: HitTestBehavior.opaque,
        child: Container(
          width: 50,
          height: 50,
          padding: const EdgeInsets.all(8),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.9),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: const Icon(Icons.favorite, color: Colors.white, size: 16),
          ),
        ),
      ),
    );
  }

  void _showHealthDataDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.favorite,
                  color: Colors.green,
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'ACTIVITY.HEALTH_MATCH.TITLE'.tr(),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'ACTIVITY.HEALTH_MATCH.SUBTITLE'.tr(),
                style: TextStyle(fontSize: 14, height: 1.4),
              ),
              const SizedBox(height: 16),
              if (activity.healthDataMatchReason.isNotEmpty) ...[
                ...activity.healthDataMatchReason.map(
                  (reason) => Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 6),
                          width: 6,
                          height: 6,
                          decoration: const BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            reason,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black87,
                              height: 1.3,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ] else ...[
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.green.withOpacity(0.3)),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.check_circle_outline,
                        color: Colors.green,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'ACTIVITY.HEALTH_MATCH.GENERAL_MATCH'.tr(),
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.green,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'ACTIVITY.HEALTH_MATCH.CLOSE'.tr(),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildImageWidget() {
    if (activity.images.isEmpty) {
      return Container(
        color: _getCategoryColor(activity.category),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              _getCategoryIcon(activity.category),
              size: 40,
              color: Colors.white,
            ),
            const SizedBox(height: 8),
            Text(
              activity.category.toUpperCase(),
              style: const TextStyle(
                color: Colors.white,
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
    final startTimeStr = DateFormat('h:mm a').format(activity.startTime);
    final endTimeStr = DateFormat('h:mm a').format(activity.endTime);
    final dateStr = DateFormat('MMMM d, yyyy').format(activity.startTime);

    return Container(
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
        borderRadius: BorderRadius.circular(13),
        child: Container(
          height: 200,
          color: Colors.white,
          child: Stack(
            children: [
              Positioned.fill(
                child: GestureDetector(
                  onTap: onTap,
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
                                    colors: [
                                      Colors.transparent,
                                      Colors.black12,
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 80,
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '$dateStr | $startTimeStr - $endTimeStr',
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.grey[800],
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 2),
                              Expanded(
                                child: Text(
                                  activity.title,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      '${'HOME.ACTIVITY.COSTS'.tr()}: ${activity.price}',
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: Colors.grey[800],
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.centerRight,
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
                                                color: Colors.grey[800],
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                            ),
                                          ),
                                        ],
                                      ),
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
              _buildHealthDataIcon(context),
            ],
          ),
        ),
      ),
    );
  }
}
