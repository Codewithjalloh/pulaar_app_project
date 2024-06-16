import 'package:flutter/material.dart';

class FulaniHistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blueAccent, Colors.lightBlueAccent],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          title: Text(
            'Fulani History',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          elevation: 0,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: OrientationBuilder(
          builder: (context, orientation) {
            final isPortrait = orientation == Orientation.portrait;

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Fulani History',
                    style: TextStyle(
                      fontSize: isPortrait ? 28 : 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                  SizedBox(height: 20),
                  _buildTextSection(
                    'The Fulani people, also known as Fulbe or Peul, are one of the largest ethnic groups in West Africa. They are traditionally nomadic pastoralists, known for their cattle herding skills. The Fulani have a rich cultural heritage, with a history that spans several centuries.',
                    isPortrait,
                  ),
                  SizedBox(height: 20),
                  _buildTextSection(
                    'The origins of the Fulani people are a subject of much debate among historians and scholars. Some believe that the Fulani originated in North Africa or the Middle East and migrated to West Africa, while others argue that they have always been indigenous to the Sahel region.',
                    isPortrait,
                  ),
                  SizedBox(height: 20),
                  _buildTextSection(
                    'The Fulani played a significant role in the spread of Islam in West Africa. They were instrumental in the establishment of several Islamic states in the region, including the Sokoto Caliphate in present-day Nigeria. The Fulani also participated in various jihads (holy wars) during the 18th and 19th centuries to spread Islam.',
                    isPortrait,
                  ),
                  SizedBox(height: 20),
                  _buildTextSection(
                    'Today, the Fulani people can be found in many West African countries, including Nigeria, Senegal, Guinea, Mali, Niger, Burkina Faso, and Cameroon. Despite modernization and sedentarization, many Fulani continue to uphold their traditional pastoralist lifestyle.',
                    isPortrait,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildTextSection(String text, bool isPortrait) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16.0),
      child: Text(
        text,
        style: TextStyle(
          fontSize: isPortrait ? 18 : 16,
          height: 1.5,
          color: Colors.black87,
        ),
        textAlign: TextAlign.justify,
      ),
    );
  }
}
