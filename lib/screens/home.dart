import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/main_menu_bg.png',
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      _buildProfileSection(context),
                      const Spacer(),
                      _buildStatItem(
                        context,
                        iconPath: 'assets/dash_coins.png',
                        value: '4730',
                        accentColor: const Color(0xFFFFA726),
                      ),
                      const SizedBox(width: 8),
                      _buildStatItem(
                        context,
                        iconPath: 'assets/nouns_pencil.png',
                        value: '8',
                        accentColor: Colors.blue,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                Hero(
                  tag: 'nouns_hunt_logo',
                  child: Image.asset(
                    'assets/nouns_green.png',
                    width: 200,
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        children: [
                          _buildIconButton(
                            context,
                            label: 'RANKING',
                            iconPath: 'assets/IconGroup_MenuIcon02_Ranking.png',
                          ),
                          const SizedBox(height: 36),
                          _buildIconButton(
                            context,
                            label: 'STORE',
                            iconPath: 'assets/itemicon_home_shop_0.png',
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildButton(
                            context,
                            text: 'PLAY',
                            backgroundPath: 'assets/green_scaled.png',
                          ),
                          const SizedBox(height: 16),
                          _buildButton(
                            context,
                            text: 'SPEED RUN',
                            backgroundPath: 'assets/purple_scaled.png',
                          ),
                          const SizedBox(height: 16),
                          _buildButton(
                            context,
                            text: 'NOUNS HUNT',
                            backgroundPath: 'assets/gray_scaled.png',
                          ),
                          const SizedBox(height: 32),
                          _buildIconButton(
                            context,
                            label: 'CHARACTERS',
                            iconPath: 'assets/Icon_ColorIcon_Emoji.Png',
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          _buildIconButton(
                            context,
                            label: 'RULES',
                            iconPath: 'assets/Icon_ColorIcon_Scroll_l.png',
                          ),
                          const SizedBox(height: 36),
                          _buildIconButton(
                            context,
                            label: 'ACHIEVEMENTS',
                            iconPath: 'assets/Icon_ColorIcon_Trophy01.png',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileSection(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: 20),
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 48),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    border: Border.all(color: Colors.white, width: 2),
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(4),
                      bottomRight: Radius.circular(16),
                    ),
                  ),
                  child: Text(
                    '0 / 5000',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 8,
                        ),
                  ),
                ),
                const SizedBox(height: 2),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 1),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(4),
                      bottomRight: Radius.circular(16),
                    ),
                  ),
                  child: Text(
                    'gndirangu',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 8,
                        ),
                  ),
                ),
              ],
            ),
          ],
        ),
        Stack(
          children: [
            const CircleAvatar(
              radius: 29,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/6.png'),
                radius: 28,
              ),
            ),
            Positioned(
              right: 2,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                child: const Text(
                  '1',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 8,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStatItem(
    BuildContext context, {
    required String iconPath,
    required String value,
    required Color accentColor,
  }) {
    return Stack(
      children: [
        Column(
          children: [
            const SizedBox(height: 2),
            Container(
              width: 86,
              padding: const EdgeInsets.symmetric(vertical: 2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Spacer(),
                  Text(
                    value,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: accentColor,
                        ),
                  ),
                  const SizedBox(width: 4),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: accentColor.withOpacity(0.4),
                    ),
                    child: Icon(Icons.add, size: 18, color: accentColor),
                  ),
                ],
              ),
            ),
          ],
        ),
        Image.asset(iconPath, width: 22, height: 22),
      ],
    );
  }

  Widget _buildButton(
    BuildContext context, {
    required String text,
    required String backgroundPath,
  }) {
    return Container(
      width: 150,
      height: 58,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(backgroundPath),
          fit: BoxFit.fill,
        ),
      ),
      child: TextButton(
        onPressed: () {},
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }

  Widget _buildIconButton(
    BuildContext context, {
    required String label,
    required String iconPath,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Image.asset(iconPath, width: 48, height: 48),
          const SizedBox(height: 8),
          Text(
            label,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(fontSize: 6, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
