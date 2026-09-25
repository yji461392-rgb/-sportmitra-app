import 'dart:async';
import 'dart:math';
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
        navigationBarTheme: const NavigationBarThemeData(
          backgroundColor: Color(0xFF0D1222),
          indicatorColor: Color(0xFF33276B),
        ),
      ),
      home: const MainScreen(),
    );
  }
}

// ============================================================
// MAIN SCREEN
// ============================================================

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  final List<Widget> pages = const [
    HomePage(),
    GamesPage(),
    PointsPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: pages[currentIndex],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.casino_outlined),
            selectedIcon: Icon(Icons.casino),
            label: 'Games',
          ),
          NavigationDestination(
            icon: Icon(Icons.stars_outlined),
            selectedIcon: Icon(Icons.stars),
            label: 'Points',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

// ============================================================
// HOME
// ============================================================

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Row(
          children: [
            const Expanded(
              child: Text(
                'SportMitra',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            LiveBadge(),
          ],
        ),

        const SizedBox(height: 5),

        const Text(
          'Play • Predict • Win Points',
          style: TextStyle(
            color: Colors.white60,
          ),
        ),

        const SizedBox(height: 20),

        const PointsCard(),

        const SizedBox(height: 25),

        const SectionTitle(title: 'Live Games'),

        const SizedBox(height: 12),

        Row(
          children: [
            Expanded(
              child: GameCard(
                title: 'LIVE CASINO',
                icon: Icons.casino,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const CasinoPage(),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: GameCard(
                title: 'AVIATOR',
                icon: Icons.flight_takeoff,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const AviatorPage(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),

        const SizedBox(height: 12),

        Row(
          children: [
            Expanded(
              child: GameCard(
                title: 'MINING',
                icon: Icons.hardware,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const MiningPage(),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: GameCard(
                title: 'LEADERBOARD',
                icon: Icons.emoji_events,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const LeaderboardPage(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),

        const SizedBox(height: 28),

        const SectionTitle(title: 'Live Sports'),

        const SizedBox(height: 12),

        const MatchCard(
          team1: 'IND',
          score1: '148/3',
          team2: 'AUS',
          score2: '177/8',
          time: '16.2 OV',
        ),

        const MatchCard(
          team1: 'FCB',
          score1: '2',
          team2: 'RMA',
          score2: '1',
          time: '78:12',
        ),
      ],
    );
  }
}

// ============================================================
// GAMES
// ============================================================

class GamesPage extends StatelessWidget {
  const GamesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          'Games',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w900,
          ),
        ),

        const SizedBox(height: 8),

        const Text(
          'Virtual points demo games',
          style: TextStyle(color: Colors.white60),
        ),

        const SizedBox(height: 20),

        GameListTile(
          title: 'Live Casino',
          subtitle: 'Realtime-style demo tables',
          icon: Icons.casino,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const CasinoPage(),
              ),
            );
          },
        ),

        GameListTile(
          title: 'Aviator-style',
          subtitle: 'Virtual points crash demo',
          icon: Icons.flight_takeoff,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const AviatorPage(),
              ),
            );
          },
        ),

        GameListTile(
          title: 'Mining Game',
          subtitle: 'Mine virtual points',
          icon: Icons.hardware,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const MiningPage(),
              ),
            );
          },
        ),

        GameListTile(
          title: 'Leaderboard',
          subtitle: 'Top virtual-points players',
          icon: Icons.emoji_events,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const LeaderboardPage(),
              ),
            );
          },
        ),
      ],
    );
  }
}

// ============================================================
// CASINO
// ============================================================

class CasinoPage extends StatelessWidget {
  const CasinoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final games = [
      ['Live Roulette', Icons.casino],
      ['Blackjack Live', Icons.style],
      ['Baccarat Live', Icons.grid_view],
      ['Teen Patti Demo', Icons.people],
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Live Casino',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const DemoNotice(),

          const SizedBox(height: 20),

          const SectionTitle(title: 'Live Tables'),

          const SizedBox(height: 12),

          ...games.map(
            (game) => Container(
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(.04),
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: Colors.white10),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(12),
                leading: Container(
                  width: 55,
                  height: 55,
                  decoration: BoxDecoration(
                    color: const Color(0xFF8C75FF).withOpacity(.15),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Icon(
                    game[1] as IconData,
                    color: const Color(0xFF9C88FF),
                    size: 30,
                  ),
                ),
                title: Text(
                  game[0] as String,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: const Text(
                  'Realtime-style demo',
                  style: TextStyle(color: Colors.white54),
                ),
                trailing: const LiveBadge(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// AVIATOR
// ============================================================

class AviatorPage extends StatefulWidget {
  const AviatorPage({super.key});

  @override
  State<AviatorPage> createState() => _AviatorPageState();
}

class _AviatorPageState extends State<AviatorPage> {
  Timer? timer;

  double multiplier = 1.00;

  bool running = false;
  bool crashed = false;

  final Random random = Random();

  void startRound() {
    timer?.cancel();

    setState(() {
      multiplier = 1.00;
      running = true;
      crashed = false;
    });

    final crashPoint = 2.5 + random.nextDouble() * 4;

    timer = Timer.periodic(
      const Duration(milliseconds: 100),
      (timer) {
        if (!mounted) {
          timer.cancel();
          return;
        }

        setState(() {
          multiplier += 0.04;

          if (multiplier >= crashPoint) {
            running = false;
            crashed = true;
            timer.cancel();
          }
        });
      },
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aviator-style'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const DemoNotice(),

            const SizedBox(height: 20),

            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF171335),
                      Color(0xFF090D1B),
                    ],
                  ),
                ),
                child: Center(
                  child: Text(
                    crashed
                        ? 'CRASHED'
                        : '${multiplier.toStringAsFixed(2)}x',
                    style: TextStyle(
                      fontSize: 58,
                      fontWeight: FontWeight.w900,
                      color: crashed
                          ? Colors.redAccent
                          : Colors.white,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: running ? null : startRound,
                child: Text(
                  running
                      ? 'LIVE ROUND...'
                      : 'START DEMO ROUND',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// MINING
// ============================================================

class MiningPage extends StatefulWidget {
  const MiningPage({super.key});

  @override
  State<MiningPage> createState() => _MiningPageState();
}

class _MiningPageState extends State<MiningPage> {
  int mined = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mining Game'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const DemoNotice(),

              const SizedBox(height: 35),

              const Icon(
                Icons.hardware,
                size: 100,
                color: Color(0xFF9A85FF),
              ),

              const SizedBox(height: 20),

              Text(
                '$mined points mined',
                style: const TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 25),

              FilledButton.icon(
                onPressed: () {
                  setState(() {
                    mined += 10;
                  });
                },
                icon: const Icon(Icons.bolt),
                label: const Text('MINE +10'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================
// POINTS
// ============================================================

class PointsPage extends StatelessWidget {
  const PointsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          'My Points',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w900,
          ),
        ),

        const SizedBox(height: 20),

        Container(
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            gradient: const LinearGradient(
              colors: [
                Color(0xFF2C2160),
                Color(0xFF101A3B),
              ],
            ),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.stars,
                color: Color(0xFFB6A5FF),
                size: 35,
              ),
              SizedBox(height: 10),
              Text(
                '12,500',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Text(
                'Virtual points',
                style: TextStyle(
                  color: Colors.white60,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 25),

        const SectionTitle(title: 'History'),

        const SizedBox(height: 10),

        const TransactionTile(
          text: '+500 Daily Bonus',
          positive: true,
        ),

        const TransactionTile(
          text: '+120 Game Reward',
          positive: true,
        ),

        const TransactionTile(
          text: '-50 Demo Entry',
          positive: false,
        ),
      ],
    );
  }
}

// ============================================================
// LEADERBOARD
// ============================================================

class LeaderboardPage extends StatelessWidget {
  const LeaderboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leaderboard'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 10,
        itemBuilder: (context, index) {
          final points = 12500 - (index * 640);

          return Container(
            margin: const EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.04),
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: const Color(0xFF2A2354),
                child: Text('${index + 1}'),
              ),
              title: Text(
                index == 0
                    ? 'You'
                    : 'Player ${index + 1}',
              ),
              trailing: Text(
                '$points pts',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// ============================================================
// PROFILE
// ============================================================

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const SizedBox(height: 25),

        const CircleAvatar(
          radius: 45,
          backgroundColor: Color(0xFF2C245B),
          child: Icon(
            Icons.person,
            size: 50,
            color: Color(0xFFAD9EFF),
          ),
        ),

        const SizedBox(height: 15),

        const Center(
          child: Text(
            'Demo Player',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        const SizedBox(height: 30),

        const ProfileTile(
          icon: Icons.verified_user,
          title: 'Account',
          subtitle: 'Points demo account',
        ),

        const ProfileTile(
          icon: Icons.notifications,
          title: 'Notifications',
          subtitle: 'Manage notifications',
        ),

        const ProfileTile(
          icon: Icons.support_agent,
          title: 'Support',
          subtitle: 'Help & support',
        ),

        const ProfileTile(
          icon: Icons.settings,
          title: 'Settings',
          subtitle: 'App settings',
        ),
      ],
    );
  }
}

// ============================================================
// COMPONENTS
// ============================================================

class PointsCard extends StatelessWidget {
  const PointsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          colors: [
            Color(0xFF29205F),
            Color(0xFF101A3B),
          ],
        ),
        border: Border.all(color: Colors.white12),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.stars,
            size: 38,
            color: Color(0xFFB5A4FF),
          ),

          const SizedBox(width: 14),

          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'My Points',
                  style: TextStyle(
                    color: Colors.white60,
                  ),
                ),
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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const PointsPage(),
                ),
              );
            },
            child: const Text('History'),
          ),
        ],
      ),
    );
  }
}

class GameCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const GameCard({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
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
                LiveBadge(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class GameListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;

  const GameListTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.04),
        borderRadius: BorderRadius.circular(18),
      ),
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.all(12),
        leading: Icon(
          icon,
          color: const Color(0xFF9A85FF),
          size: 32,
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(
            color: Colors.white54,
          ),
        ),
        trailing: const Icon(
          Icons.chevron_right,
        ),
      ),
    );
  }
}

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
        color: Colors.white.withOpacity(.04),
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

class LiveBadge extends StatelessWidget {
  const LiveBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 7,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: Colors.red.withOpacity(.15),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Text(
        'LIVE',
        style: TextStyle(
          color: Colors.redAccent,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 21,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class DemoNotice extends StatelessWidget {
  const DemoNotice({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF151A2E),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.white10,
        ),
      ),
      child: const Row(
        children: [
          Icon(
            Icons.info_outline,
            color: Color(0xFF9A87FF),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              'Demo mode — virtual points only. '
              'No real-money wagering.',
              style: TextStyle(
                color: Colors.white70,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TransactionTile extends StatelessWidget {
  final String text;
  final bool positive;

  const TransactionTile({
    super.key,
    required this.text,
    required this.positive,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        positive
            ? Icons.add_circle
            : Icons.remove_circle,
        color: positive
            ? Colors.greenAccent
            : Colors.redAccent,
      ),
      title: Text(text),
      trailing: Text(
        positive ? 'POINTS' : 'POINTS',
        style: const TextStyle(
          color: Colors.white54,
          fontSize: 11,
        ),
      ),
    );
  }
}

class ProfileTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const ProfileTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white.withOpacity(.04),
      child: ListTile(
        leading: Icon(
          icon,
          color: const Color(0xFF9A87FF),
        ),
        title: Text(title),
        subtitle: Text(
          subtitle,
          style: const TextStyle(
            color: Colors.white54,
          ),
        ),
        trailing: const Icon(
          Icons.chevron_right,
        ),
      ),
    );
  }
}
