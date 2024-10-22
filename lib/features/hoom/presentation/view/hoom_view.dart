import 'package:dalel/features/hoom/presentation/widget/hoom_sections/hoom_historical_characters_section.dart';
import 'package:dalel/features/hoom/presentation/widget/hoom_sections/hoom_historical_periods_section.dart';
import 'package:dalel/features/hoom/presentation/widget/hoom_sections/hoom_app_bar_section.dart';
import 'package:dalel/features/hoom/presentation/widget/hoom_sections/hoom_historical_souvenirs_section.dart';
import 'package:flutter/material.dart';


class HoomView extends StatelessWidget {
  const HoomView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(child: HoomAppBarSection()),
            SliverToBoxAdapter(child: HistoricalPeriodsSection()),
            SliverToBoxAdapter(child: HistoricalCharactersSection()),
            SliverToBoxAdapter(child: HistoricalSouvenirsSection()),
          ],
        ),
      ),
    );
  }
}
