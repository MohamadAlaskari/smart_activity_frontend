import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_activity_frontend/features/location/application/location_provider.dart';

class LocationInputField extends ConsumerWidget {
  const LocationInputField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locationState = ref.watch(locationViewModelProvider);
    final controller = TextEditingController(text: locationState.city);

    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            onChanged:
                (value) => ref
                    .read(locationViewModelProvider.notifier)
                    .updateCity(value),
            decoration: InputDecoration(
              hintText: 'Stadt eingeben',
              prefixIcon: IconButton(
                icon: const Icon(Icons.my_location),
                onPressed: () {
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
      ],
    );
  }
}
