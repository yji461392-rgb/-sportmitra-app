import 'package:flutter/material.dart';

class CasinoPage extends StatelessWidget {
  const CasinoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final games = [
      ('Live Roulette', Icons.casino),
      ('Blackjack Live', Icons.style),
      ('Baccarat Live', Icons.grid_view),
      ('Teen Patti', Icons.people),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF070B16),
      appBar: AppBar(
        backgroundColor: const Color(0xFF070B16),
        title: const Text(
          'Live Casino',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF302066),
                  Color(0xFF111A3A),
                ],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.circle,
                      color: Colors.red,
                      size: 10,
                    ),
                    SizedBox(width: 7),
                    Text(
                      'LIVE NOW',
                      style: TextStyle(
                        color: Colors.redAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  'Live Casino',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Virtual points demo tables',
                  style: TextStyle(
                    color: Colors.white60,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 22),

          const Text(
            'Tables',
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          ...games.map(
            (game) => Container(
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(.04),
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: Colors.white10,
                ),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(12),
                leading: Container(
                  width: 55,
                  height: 55,
                  decoration: BoxDecoration(
                    color: const Color(0xFF8C75FF)
                        .withOpacity(.15),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Icon(
                    game.$2,
                    color: const Color(0xFF9C88FF),
                    size: 30,
                  ),
                ),
                title: Text(
                  game.$1,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: const Text(
                  'Realtime-style demo',
                  style: TextStyle(
                    color: Colors.white54,
                  ),
                ),
                trailing: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(.15),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    'LIVE',
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
