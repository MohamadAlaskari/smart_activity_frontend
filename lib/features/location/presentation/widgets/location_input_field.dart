import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_activity_frontend/features/location/application/location_provider.dart';
import 'package:smart_activity_frontend/features/location/domain/location_state.dart';

class LocationInputField extends ConsumerStatefulWidget {
  const LocationInputField({super.key});

  @override
  ConsumerState<LocationInputField> createState() => _LocationInputFieldState();
}

class _LocationInputFieldState extends ConsumerState<LocationInputField> {
  late final TextEditingController _controller;
  late final ProviderSubscription<LocationState> _locationListener;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();

    // أول مرة فقط: جلب الموقع الحالي
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(locationViewModelProvider.notifier).useCurrentLocation();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // ضيف listener يدوي
    _locationListener = ref.listenManual<LocationState>(
      locationViewModelProvider,
      (previous, next) {
        if (_controller.text != next.city) {
          _controller.text = next.city;
        }
        if (next.error != null && next.error!.isNotEmpty) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(next.error!)));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final locationState = ref.watch(locationViewModelProvider);

    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _controller,
            onChanged:
                (value) => ref
                    .read(locationViewModelProvider.notifier)
                    .updateCity(value),
            decoration: InputDecoration(
              hintText: 'Stadt eingeben',
              prefixIcon: IconButton(
                icon: const Icon(Icons.my_location),
                onPressed:
                    locationState.isLoading
                        ? null
                        : () {
                          ref
                              .read(locationViewModelProvider.notifier)
                              .useCurrentLocation();
                        },
              ),
              suffixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 12),
            ),
          ),
        ),
        if (locationState.isLoading) const SizedBox(width: 10),
        if (locationState.isLoading) const CircularProgressIndicator(),
      ],
    );
  }

  @override
  void dispose() {
    _locationListener.close();
    _controller.dispose();
    super.dispose();
  }
}
