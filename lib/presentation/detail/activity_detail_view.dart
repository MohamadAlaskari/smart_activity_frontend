import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vibe_day/presentation/detail/activity_detail_cubit.dart';
import 'package:vibe_day/presentation/detail/activity_detail_state.dart';

class ActivityDetailView extends StatelessWidget {
  const ActivityDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ActivityDetailCubit, ActivityDetailState>(
        builder: (context, state) {
          final activity = state.activity;

          return CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 320.0,
                backgroundColor: Colors.white,
                elevation: 0,
                automaticallyImplyLeading: true,
                flexibleSpace: FlexibleSpaceBar(
                  background:
                      activity.images.isNotEmpty
                          ? ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              bottom: Radius.circular(32),
                            ),
                            child: Image.network(
                              activity.images.first,
                              fit: BoxFit.cover,
                              errorBuilder:
                                  (ctx, e, st) => Container(
                                    color: Colors.grey.shade300,
                                    child: const Center(
                                      child: Icon(Icons.image_not_supported),
                                    ),
                                  ),
                            ),
                          )
                          : Container(
                            color: Colors.grey.shade200,
                            child: const Center(child: Icon(Icons.image)),
                          ),
                ),
              ),

              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 24, 20, 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        activity.title,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        activity.description.isNotEmpty
                            ? activity.description
                            : 'Keine Beschreibung verfügbar.',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 6,
                        runSpacing: 4,
                        children:
                            activity.vibeMatch.map((vibe) {
                              final color = _getBadgeColor(vibe);
                              return Chip(
                                label: Text(
                                  vibe,
                                  style: const TextStyle(fontSize: 12),
                                ),
                                backgroundColor: color.withOpacity(0.2),
                                labelStyle: TextStyle(color: color),
                                visualDensity: VisualDensity.compact,
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                              );
                            }).toList(),
                      ),
                    ],
                  ),
                ),
              ),

              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildActionIcon(
                        icon: Icons.share,
                        label: 'Teilen',
                        onTap: () {},
                      ),
                      _buildActionIcon(
                        icon: Icons.directions,
                        label: 'Route',
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),

              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: _buildDetailSection(
                    title: 'DETAIL.INFORMATION'.tr(),
                    children: [
                      _buildDetailRow(
                        icon: Icons.category,
                        label: 'Kategorie',
                        value: activity.category,
                      ),
                      _buildDetailRow(
                        icon: Icons.schedule,
                        label: 'Zeit',
                        value:
                            '${DateFormat.Hm().format(activity.startTime)} - ${DateFormat.Hm().format(activity.endTime)}',
                      ),
                      _buildDetailRow(
                        icon: Icons.date_range,
                        label: 'Datum',
                        value: DateFormat.yMMMMd().format(activity.startTime),
                      ),
                      _buildDetailRow(
                        icon: Icons.location_on,
                        label: 'Ort',
                        value:
                            '${activity.location.name}, ${activity.location.address}',
                      ),
                      _buildDetailRow(
                        icon: Icons.euro,
                        label: 'Kosten',
                        value:
                            activity.price.isNotEmpty
                                ? activity.price
                                : 'Kostenlos',
                      ),
                      _buildDetailRow(
                        icon: Icons.directions_walk,
                        label: 'Entfernung',
                        value: '${activity.distanceKm.toStringAsFixed(1)} km',
                      ),
                    ],
                  ),
                ),
              ),

              if (activity.isTicketed)
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          launchUrl(Uri.parse(activity.url));
                        },
                        icon: const Icon(Icons.confirmation_number),
                        label: const Text('Ticket buchen'),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          backgroundColor: Colors.deepPurple,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

              const SliverToBoxAdapter(child: SizedBox(height: 40)),
            ],
          );
        },
      ),
    );
  }

  Color _getBadgeColor(String vibe) {
    switch (vibe.toLowerCase()) {
      case 'fun':
        return Colors.pink;
      case 'relax':
        return Colors.green;
      case 'adventure':
        return Colors.orange;
      case 'culture':
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }

  Widget _buildActionIcon({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, size: 24, color: Colors.grey.shade700),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailSection({
    required String title,
    required List<Widget> children,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        ...children,
      ],
    );
  }

  Widget _buildDetailRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.grey.shade600),
          const SizedBox(width: 12),
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value,
              style: const TextStyle(fontSize: 14, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}
