import 'package:cats_api/data/models/cats_data_models.dart';
import 'package:cats_api/data/repositories/get_cats_data_repositories.dart';
import 'package:flutter/material.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cats API'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder(
              future: GetCatsDataRepositories().getCatsData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const SizedBox(
                    width: double.infinity,
                    height: 500,
                    child: Center(
                      child: CircularProgressIndicator.adaptive(),
                    ),
                  );
                } else if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.data is CatsDataModel) {
                    return Image.network(
                      snapshot.data.url,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.error_outline_rounded);
                      },
                    );
                  } else {
                    Text(snapshot.data);
                  }
                }
                return SizedBox(
                  height: snapshot.data.height,
                  width: snapshot.data.width,
                );
              },
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.amber)),
                onPressed: () {
                  setState(() {});
                },
                child: const Icon(Icons.refresh),
              ),
            )
          ],
        ),
      ),
    );
  }
}
