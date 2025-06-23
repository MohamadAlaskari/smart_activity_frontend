import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vibe_day/assets/colors.gen.dart';
import 'package:vibe_day/presentation/detail/activity_detail_provider.dart';
import 'package:vibe_day/presentation/home/ui/activity_card.dart';
import 'package:vibe_day/presentation/home/ui/weather_row.dart';
import 'package:vibe_day/presentation/profile/profile_view.dart';
import 'package:vibe_day/presentation/vibe_selection/vibe_selection_provider.dart';
import 'home_cubit.dart';
import 'home_state.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.white,
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Column(
            children: [
              LocationAndWeatherHeader(state: state),
              Expanded(child: HomeContentSection(state: state)),
            ],
          );
        },
      ),
    );
  }
}

class LocationAndWeatherHeader extends StatelessWidget {
  final HomeState state;

  const LocationAndWeatherHeader({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(20, 60, 0, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.location_on, size: 24),
              const SizedBox(width: 8),
              Expanded(
                child: Row(
                  children: [
                    Flexible(
                      child: Text(
                        state.location,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  context.pushNamed(VibeSelectionProvider.routeName);
                },
                icon: const Icon(Icons.mood, size: 30),
              ),
              Transform.translate(
                offset: const Offset(-8, 0),
                child: IconButton(
                  onPressed: () {
                    ProfileView.show(context);
                  },
                  icon: const Icon(Icons.person, size: 30),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          WeatherRow(
            weatherData: state.weatherData,
            selectedDayIndex: state.selectedDayIndex,
            onDayTap: (dayIndex, weatherInfo) {
              context.read<HomeCubit>().loadActivitiesForDay(
                dayIndex,
                weatherInfo,
              );
            },
          ),
        ],
      ),
    );
  }
}

class HomeContentSection extends StatelessWidget {
  final HomeState state;

  const HomeContentSection({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return state.screenStatus.when(
      pure: () => const PureState(),
      loading: () => const LoadingState(),
      success:
          () => SuccessState(
            activities: state.activities,
            hasUserPreferences: state.hasUserPreferences,
          ),
      error: (messageKey) => ErrorState(activities: state.activities),
    );
  }
}

class PureState extends StatelessWidget {
  const PureState({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}

class LoadingState extends StatelessWidget {
  const LoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(50.0),
        child: CircularProgressIndicator(color: ColorName.colorPrimary),
      ),
    );
  }
}

class SuccessState extends StatelessWidget {
  final List activities;
  final bool hasUserPreferences;

  const SuccessState({
    super.key,
    required this.activities,
    required this.hasUserPreferences,
  });

  @override
  Widget build(BuildContext context) {
    if (!hasUserPreferences) {
      return const NoPreferencesMessage();
    }

    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            if (index < activities.length) {
              return ActivityCard(
                activity: activities[index],
                onTap: () {
                  context.pushNamed(
                    ActivityDetailProvider.routeName,
                    extra: activities[index],
                  );
                },
              );
            }
            return null;
          }, childCount: activities.length),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 20)),
      ],
    );
  }
}

class NoPreferencesMessage extends StatelessWidget {
  const NoPreferencesMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: [
            const Icon(Icons.mood, size: 60, color: ColorName.colorPrimary),
            const SizedBox(height: 20),
            Text(
              'HOME.WELCOME'.tr(),
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              'HOME.CHOOSE_PREFERENCE'.tr(),
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.pushNamed(VibeSelectionProvider.routeName);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorName.colorPrimary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: Text(
                'HOME.CHOOSE_PREFERENCE_BUTTON'.tr(),
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ErrorState extends StatelessWidget {
  final List activities;

  const ErrorState({super.key, required this.activities});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              if (activities.isNotEmpty)
                ...activities.map(
                  (activity) => ActivityCard(activity: activity),
                ),
            ],
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 20)),
      ],
    );
  }
}
