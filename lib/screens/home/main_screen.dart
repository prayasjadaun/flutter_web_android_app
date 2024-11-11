import 'package:flutter/material.dart';
import 'package:web_android_flutter_app/screens/home/widgets/performance_chart.dart';
import 'package:web_android_flutter_app/screens/home/widgets/project_card.dart';
import 'package:web_android_flutter_app/screens/home/widgets/top_creators.dart';
import 'package:web_android_flutter_app/screens/home/widgets/top_rating_project.dart';

class MainContent extends StatelessWidget {
  const MainContent({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 600;

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Column(
                  children: [
                    TopRatingProject(),
                    const SizedBox(height: 20),
                    isMobile
                        ? Column(
                            children: [
                              AllProjectsCard(
                                projects: [
                                  ProjectItemData(
                                    title: 'Blockchain Technology',
                                    subtitle: 'Project #1',
                                    icon: Icons.block,
                                    iconColor: Colors.red,
                                  ),
                                  ProjectItemData(
                                    title: 'Machine Learning',
                                    subtitle: 'Project #2',
                                    icon: Icons.memory,
                                    iconColor: Colors.blue,
                                  ),
                                  ProjectItemData(
                                    title: 'Flutter Development',
                                    subtitle: 'Project #3',
                                    icon: Icons.code,
                                    iconColor: Colors.green,
                                  ),
                                  ProjectItemData(
                                    title: 'Cyber Security',
                                    subtitle: 'Project #4',
                                    icon: Icons.block,
                                    iconColor: Colors.yellow,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              TopCreatorsCard(),
                            ],
                          )
                        : Row(
                            children: [
                              Expanded(
                                  child: AllProjectsCard(
                                projects: [
                                  ProjectItemData(
                                    title: 'Blockchain Technology',
                                    subtitle: 'Project #1',
                                    icon: Icons.block,
                                    iconColor: Colors.red,
                                  ),
                                  ProjectItemData(
                                    title: 'Machine Learning',
                                    subtitle: 'Project #2',
                                    icon: Icons.memory,
                                    iconColor: Colors.blue,
                                  ),
                                  ProjectItemData(
                                    title: 'Flutter Development',
                                    subtitle: 'Project #3',
                                    icon: Icons.code,
                                    iconColor: Colors.green,
                                  ),
                                  ProjectItemData(
                                    title: 'Cyber Security',
                                    subtitle: 'Project #4',
                                    icon: Icons.block,
                                    iconColor: Colors.blueAccent,
                                  ),
                                ],
                              )),
                              const SizedBox(width: 20),
                              Expanded(child: TopCreatorsCard()),
                            ],
                          ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      height: 400,
                      width: double.infinity,
                      child: PerformanceChart(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
