import 'package:flutter/material.dart';

void main() {
  runApp(const SportMitraApp());
}

class SportMitraApp extends StatelessWidget {
  const SportMitraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SportMitra',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF070B16),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF7657FF),
          brightness: Brightness.dark,
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // HEADER
            Row(
              children: [
                const Expanded(
                  child: Text(
                    'SportMitra',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.circle,
                        color: Colors.red,
                        size: 9,
                      ),
                      SizedBox(width: 5),
                      Text(
                        'LIVE',
                        style: TextStyle(
                          color: Colors.redAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 5),

            const Text(
              'Play • Predict • Win Points',
              style: TextStyle(
                color: Colors.white60,
                fontSize: 14,
              ),
            ),

            const SizedBox(height: 20),

            // POINTS CARD
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF29205F),
                    Color(0xFF101A3B),
                  ],
                ),
                border: Border.all(
                  color: Colors.white12,
                ),
              ),
              child: Row(
                children: [
                  Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      color: const Color(0xFF8C75FF)
                          .withOpacity(0.15),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.stars,
                      color: Color(0xFFAD9EFF),
                      size: 30,
                    ),
                  ),

                  const SizedBox(width: 14),

                  const Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Text(
                          'My Points',
                          style: TextStyle(
                            color: Colors.white60,
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          '12,500',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                  ),

                  OutlinedButton(
                    onPressed: () {},
                    child: const Text('History'),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              'Live Games',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            // GAME ROW 1
            Row(
              children: [
                Expanded(
                  child: GameCard(
                    title: 'LIVE CASINO',
                    icon: Icons.casino,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: GameCard(
                    title: 'AVIATOR',
                    icon: Icons.flight_takeoff,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // GAME ROW 2
            Row(
              children: [
                Expanded(
                  child: GameCard(
                    title: 'MINING',
                    icon: Icons.hardware,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: GameCard(
                    title: 'GAMES',
                    icon: Icons.sports_esports,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 28),

            const Text(
              'Live Sports',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            MatchCard(
              team1: 'IND',
              score1: '148/3',
              team2: 'AUS',
              score2: '177/8',
              time: '16.2 OV',
            ),

            MatchCard(
              team1: 'FCB',
              score1: '2',
              team2: 'RMA',
              score2: '1',
              time: '78:12',
            ),
          ],
        ),
      ),

      // BOTTOM NAVIGATION
      bottomNavigationBar: NavigationBar(
        selectedIndex: 0,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.casino_outlined),
            label: 'Games',
          ),
          NavigationDestination(
            icon: Icon(Icons.stars_outlined),
            label: 'Points',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

// GAME CARD
class GameCard extends StatelessWidget {
  final String title;
  final IconData icon;

  const GameCard({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [
            Color(0xFF191D35),
            Color(0xFF0D1222),
          ],
        ),
        border: Border.all(
          color: Colors.white10,
        ),
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 35,
            color: const Color(0xFF9A85FF),
          ),

          const Spacer(),

          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 6,
                  vertical: 3,
                ),
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.15),
                  borderRadius:
                      BorderRadius.circular(10),
                ),
                child: const Text(
                  'LIVE',
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontSize: 9,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// MATCH CARD
class MatchCard extends StatelessWidget {
  final String team1;
  final String score1;
  final String team2;
  final String score2;
  final String time;

  const MatchCard({
    super.key,
    required this.team1,
    required this.score1,
    required this.team2,
    required this.score2,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.04),
        borderRadius: BorderRadius.circular(17),
        border: Border.all(
          color: Colors.white10,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              '$team1  $score1',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Text(
            time,
            style: const TextStyle(
              color: Colors.white54,
              fontSize: 12,
            ),
          ),

          Expanded(
            child: Text(
              '$team2  $score2',
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
