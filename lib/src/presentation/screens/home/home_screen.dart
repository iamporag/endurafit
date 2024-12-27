import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../../utils/utils.dart';
import '../../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context);
    final screenWidth = screen.size.width;
    final screenHeight = screen.size.height;
    final theme = Theme.of(context);
    final now = DateTime.now();
    String formatter = DateFormat('MMM d, y').format(now);

    return Scaffold(
      body: SizedBox(
        height: screenHeight,
        child: SingleChildScrollView(
          child: Column(
            children: [
              //Top Area or Header Area
              TopArea(
                screenWidth: screenWidth,
                formatter: formatter,
                theme: theme,
              ),
              // Fitness Metrics Area
              FitnessMetricsArea(),
              // Workouts Area
              WorkoutsArea(
                theme: theme,
              ),
              // Diet & Nutrition Area
              DietNutritionArea(
                theme: theme,
              ),
              //for some height
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DietNutritionArea extends StatelessWidget {
  final ThemeData theme;
  const DietNutritionArea({
    super.key,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomListTile(
          title: AppConfig.dietNutrition,
          actionTitle: AppConfig.seeAll,
          isRichText: false,
          isTrailingIcon: false,
        ),
        SingleChildScrollView(
          padding: EdgeInsets.only(left: 16.0, right: 16.0),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              5,
              (index) => Container(
                margin: EdgeInsets.only(right: 10.0),
                width: MediaQuery.of(context).size.width * 0.85,
                height: MediaQuery.of(context).size.height * 0.30,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(45.0),
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://images.pexels.com/photos/2092903/pexels-photo-2092903.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(45.0),
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            Colors.grey.shade200,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.19,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Center(
                                    child: Column(
                                      children: [
                                        Text(
                                          '25g',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelLarge
                                              ?.copyWith(
                                                color:
                                                    theme.colorScheme.onSurface,
                                              ),
                                        ),
                                        Text(
                                          'Protin',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelSmall
                                              ?.copyWith(
                                                color:
                                                    theme.colorScheme.onSurface,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.19,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Center(
                                    child: Column(
                                      children: [
                                        Text(
                                          '17g',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelLarge
                                              ?.copyWith(
                                                color:
                                                    theme.colorScheme.onSurface,
                                              ),
                                        ),
                                        Text(
                                          'Fat',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelSmall
                                              ?.copyWith(
                                                color:
                                                    theme.colorScheme.onSurface,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'Salad & Egg',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.copyWith(
                                          color: theme.colorScheme.onSurface,
                                        ),
                                  ),
                                  Row(
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.schedule,
                                            color: theme.colorScheme.surface,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            '25 Min',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium
                                                ?.copyWith(
                                                  color:
                                                      theme.colorScheme.surface,
                                                ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        width: 8,
                                        height: 8,
                                        decoration: BoxDecoration(
                                            color: theme.colorScheme.surface,
                                            shape: BoxShape.circle),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.thumb_up,
                                            color: theme.colorScheme.surface,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            '412 Kcal',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium
                                                ?.copyWith(
                                                  color:
                                                      theme.colorScheme.surface,
                                                ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.arrow_circle_right,
                                color: theme.colorScheme.onPrimaryContainer,
                                size: 80,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class WorkoutsArea extends StatelessWidget {
  final ThemeData theme;
  const WorkoutsArea({super.key, required this.theme});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomListTile(
          firstRichTextTitle: 'Workouts',
          secondRichTextTitle: ' (26)',
          actionTitle: AppConfig.seeAll,
          isRichText: true,
          isTrailingIcon: true,
          trailingIcon: Icons.more_vert,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.30,
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(45),
              image: DecorationImage(
                image: NetworkImage(
                    'https://images.pexels.com/photos/1229356/pexels-photo-1229356.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.schedule,
                            color: theme.colorScheme.surface,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '25 Min',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                  color: theme.colorScheme.surface,
                                ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.thumb_up,
                            color: theme.colorScheme.surface,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '412 Kcal',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                  color: theme.colorScheme.surface,
                                ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Upper Strength 2',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  color: theme.colorScheme.surface,
                                ),
                          ),
                          Row(
                            children: [
                              Text(
                                '8 Series Workout',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.copyWith(
                                      color: theme.colorScheme.surface,
                                    ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: theme.colorScheme.onPrimaryContainer,
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                      child: Text(
                                    'Intense',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium
                                        ?.copyWith(
                                          color: theme.colorScheme.surface,
                                        ),
                                  )),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      Icon(
                        Icons.play_circle,
                        color: theme.colorScheme.surface,
                        size: 80,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class FitnessMetricsArea extends StatelessWidget {
  const FitnessMetricsArea({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomListTile(
          title: AppConfig.fitnessMetrics,
          actionTitle: AppConfig.seeAll,
          isRichText: false,
          isTrailingIcon: false,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.only(left: 16, right: 16),
          child: Row(
            children: List.generate(
              5,
              (index) => Container(
                margin: EdgeInsets.only(right: 20),
                width: 180,
                height: 220,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFF97316),
                      Color(0xFFF97316).withValues(alpha: 0.8),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(45),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Score',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          SvgPicture.asset(
                            AssetsManager.healthPlusFillIcon,
                            colorFilter: ColorFilter.mode(
                              Colors.white,
                              BlendMode.srcIn,
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: SvgPicture.asset(
                          AssetsManager.barGraphImage,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '88%',
                          style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class TopArea extends StatelessWidget {
  const TopArea({
    super.key,
    required this.screenWidth,
    required this.formatter,
    required this.theme,
  });

  final double screenWidth;
  final String formatter;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 200,
          width: screenWidth,
          decoration: BoxDecoration(
            color: Colors.black,
            gradient: LinearGradient(
              colors: [
                Colors.black,
                Colors.black45,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(35),
              bottomRight: Radius.circular(35),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        AssetsManager.calendarIcon,
                        colorFilter: ColorFilter.mode(
                          Colors.white,
                          BlendMode.srcIn,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        formatter,
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: theme.colorScheme.surface,
                        ),
                      ),
                    ],
                  ),
                  SvgPicture.asset(
                    AssetsManager.notificationIcon,
                    colorFilter: ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: NetworkImage(
                                'https://images.pexels.com/photos/1431282/pexels-photo-1431282.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hello, Username!',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(
                                  color: theme.colorScheme.surface,
                                ),
                          ),
                          Row(
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    AssetsManager.healthPlusFillIcon,
                                    colorFilter: ColorFilter.mode(
                                      Colors.amber,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                  Text(
                                    '88% Healthy',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall
                                        ?.copyWith(
                                          color: theme.colorScheme.surface,
                                        ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    AssetsManager.starFillIcon,
                                    colorFilter: ColorFilter.mode(
                                      Colors.blue,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                  Text(
                                    'Pro',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall
                                        ?.copyWith(
                                          color: theme.colorScheme.surface,
                                        ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SvgPicture.asset(
                    AssetsManager.appArrowRightIcon,
                    width: 35,
                    colorFilter: ColorFilter.mode(
                      Colors.white, // Replace with your desired color
                      BlendMode.srcIn, // Ensures the color is applied properly
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
