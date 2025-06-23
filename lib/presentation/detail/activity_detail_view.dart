import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vibe_day/presentation/detail/activity_detail_cubit.dart';
import 'package:vibe_day/presentation/detail/activity_detail_state.dart';
import 'package:vibe_day/domain/model/activity.dart';
import 'package:vibe_day/presentation/ui/buttons/vibe_day_button.dart';
import 'package:vibe_day/presentation/ui/widgets/snackbars.dart';

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
              ActivityHeader(activity: activity),
              ActivityContent(activity: activity),
              ActivityActionButtons(activity: activity),
              ActivityDetailInformation(activity: activity),
              if (activity.isTicketed) ActivityTicketButton(activity: activity),
              const SliverToBoxAdapter(child: SizedBox(height: 40)),
            ],
          );
        },
      ),
    );
  }
}

class ActivityHeader extends StatelessWidget {
  final Activity activity;

  const ActivityHeader({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 320.0,
      backgroundColor: Colors.white,
      elevation: 0,
      automaticallyImplyLeading: true,
      iconTheme: const IconThemeData(color: Colors.black),
      leading: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background:
            activity.images.isNotEmpty
                ? ClipRRect(
                  child: Image.network(
                    activity.images.first,
                    fit: BoxFit.cover,
                    errorBuilder:
                        (ctx, e, st) => Container(
                          color: Colors.grey.shade300,
                          child: const Center(
                            child: Icon(Icons.image_not_supported, size: 90),
                          ),
                        ),
                  ),
                )
                : Container(
                  color: Colors.grey.shade200,
                  child: const Center(child: Icon(Icons.image, size: 90)),
                ),
      ),
    );
  }
}

class ActivityContent extends StatelessWidget {
  final Activity activity;

  const ActivityContent({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 24, 20, 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              activity.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text(
              activity.description.isNotEmpty
                  ? activity.description
                  : 'DETAIL.NO_DESCRIPTION'.tr(),
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}

class ActivityActionButtons extends StatelessWidget {
  final Activity activity;

  const ActivityActionButtons({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _ActionIcon(
              icon: Icons.share,
              label: 'DETAIL.ACTION.SHARE'.tr(),
              onTap: () => _shareActivity(),
            ),
            _ActionIcon(
              icon: Icons.directions,
              label: 'DETAIL.ACTION.ROUTE'.tr(),
              onTap: () => _openRoute(context),
            ),
          ],
        ),
      ),
    );
  }

  void _shareActivity() {
    final hasUrl = activity.url.trim().isNotEmpty;
    final shareText = '''
🎉 ${activity.title}

🗓️ ${DateFormat.yMMMMd().format(activity.startTime)}  
🕒 ${DateFormat.Hm().format(activity.startTime)} - ${DateFormat.Hm().format(activity.endTime)}

📍 ${activity.location.name}
📫 ${activity.location.address}

${hasUrl ? '\n🔗 ${activity.url}' : ''}
''';

    SharePlus.instance.share(
      ShareParams(text: shareText, subject: activity.title),
    );
  }

  Future<void> _openRoute(BuildContext context) async {
    final encodedAddress = Uri.encodeComponent(
      '${activity.location.name}, ${activity.location.address}',
    );

    final url =
        'https://www.google.com/maps/dir/?api=1&destination=$encodedAddress';

    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      if (context.mounted) {
        SnackBars.showError(context, 'DETAIL.ERROR.MAP_UNAVAILABLE'.tr());
      }
    }
  }
}

class _ActionIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ActionIcon({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
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
}

class ActivityDetailInformation extends StatelessWidget {
  final Activity activity;

  const ActivityDetailInformation({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: _DetailSection(
          title: 'DETAIL.INFORMATION'.tr(),
          children: [
            _DetailRow(
              icon: Icons.category,
              label: 'DETAIL.ACTIVITY_INFORMATION.CATEGORY'.tr(),
              value: activity.category,
            ),
            _DetailRow(
              icon: Icons.schedule,
              label: 'DETAIL.ACTIVITY_INFORMATION.TIME'.tr(),
              value:
                  '${DateFormat('h:mm a').format(activity.startTime)} - ${DateFormat('h:mm a').format(activity.endTime)}',
            ),
            _DetailRow(
              icon: Icons.date_range,
              label: 'DETAIL.ACTIVITY_INFORMATION.DATE'.tr(),
              value: DateFormat('MMMM d, yyyy').format(activity.startTime),
            ),
            _DetailRow(
              icon: Icons.location_on,
              label: 'DETAIL.ACTIVITY_INFORMATION.LOCATION'.tr(),
              value: '${activity.location.name}, ${activity.location.address}',
            ),
            _DetailRow(
              icon: Icons.euro,
              label: 'DETAIL.ACTIVITY_INFORMATION.COSTS'.tr(),
              value:
                  activity.price.isNotEmpty
                      ? activity.price
                      : 'DETAIL.ACTIVITY_INFORMATION.FREE'.tr(),
            ),
            _DetailRow(
              icon: Icons.directions_walk,
              label: 'DETAIL.ACTIVITY_INFORMATION.DISTANCE'.tr(),
              value: '${activity.distanceKm.toStringAsFixed(1)} km',
            ),
          ],
        ),
      ),
    );
  }
}

class _DetailSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _DetailSection({required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
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
}

class _DetailRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _DetailRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
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

class ActivityTicketButton extends StatelessWidget {
  final Activity activity;

  const ActivityTicketButton({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: VibeDayButton(
        text: 'DETAIL.TICKET.BOOK'.tr(),
        icon: Icons.confirmation_number,
        onPressed: () => launchUrl(Uri.parse(activity.url)),
        padding: const EdgeInsets.all(20),
      ),
    );
  }
}
