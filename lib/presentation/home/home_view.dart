import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vibe_day/assets/colors.gen.dart';
import 'package:vibe_day/presentation/detail/activity_detail_provider.dart';
import 'package:vibe_day/presentation/home/ui/activity_card.dart';
import 'package:vibe_day/presentation/home/ui/weather_row.dart';
import 'package:vibe_day/presentation/settings/settings_view.dart';
import 'package:vibe_day/presentation/vibe_selection/vibe_selection_provider.dart';

import 'home_cubit.dart';
import 'home_state.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: _buildLocationAndWeatherHeader(context, state),
                    ),

                    state.screenStatus.when(
                      pure:
                          () => const SliverToBoxAdapter(
                            child: SizedBox.shrink(),
                          ),
                      loading:
                          () => const SliverToBoxAdapter(
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(50.0),
                                child: CircularProgressIndicator(
                                  color: ColorName.colorPrimary,
                                ),
                              ),
                            ),
                          ),
                      success:
                          () => SliverList(
                            delegate: SliverChildBuilderDelegate((
                              context,
                              index,
                            ) {
                              if (index < state.activities.length) {
                                return ActivityCard(
                                  activity: state.activities[index],
                                  onTap: () {
                                    context.pushNamed(
                                      ActivityDetailProvider.routeName,
                                      extra: state.activities[index],
                                    );
                                  },
                                );
                              }
                              return null;
                            }, childCount: state.activities.length),
                          ),
                      error:
                          (messageKey) => SliverToBoxAdapter(
                            child: Column(
                              children: [
                                if (state.activities.isNotEmpty)
                                  ...state.activities.map(
                                    (activity) => ActivityCard(
                                      activity: activity,
                                      onTap: () {
                                        // TODO: Navigate to activity detail page
                                        print(
                                          'Activity tapped: ${activity.title}',
                                        );
                                      },
                                    ),
                                  ),
                              ],
                            ),
                          ),
                    ),

                    const SliverToBoxAdapter(child: SizedBox(height: 20)),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildLocationAndWeatherHeader(BuildContext context, HomeState state) {
    return Container(
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
                    Transform.translate(
                      offset: const Offset(-12, 0),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_drop_down_outlined, size: 30),
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints(),
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
                    SettingsModal.show(context);
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
