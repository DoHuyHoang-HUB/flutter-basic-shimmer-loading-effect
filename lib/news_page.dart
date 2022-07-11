import 'package:flutter/material.dart';
import 'package:simmer_loadding_effect/constants.dart';
import 'package:simmer_loadding_effect/widgets/skelton.dart';

import 'news_card.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  late bool _isLoading;

  @override
  void initState() {
    _isLoading = true;
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "News App",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // const SizedBox(height: 32), // for better visualization
            _isLoading
                ? Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) =>
                            const NewsCardSkelton(),
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: defaultPadding),
                        itemCount: 6),
                  )
                : Expanded(
                    child: ListView.separated(
                      itemCount: 6,
                      itemBuilder: (context, index) => NewsCard(
                        image: "assets/images/Image_$index.png",
                      ),
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: defaultPadding),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

class NewsCardSkelton extends StatelessWidget {
  const NewsCardSkelton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Skelton(
          height: 120,
          width: 120,
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Skelton(
                width: 80,
              ),
              const SizedBox(height: 8),
              const Skelton(),
              const SizedBox(height: 8),
              const Skelton(),
              const SizedBox(height: 8),
              Row(
                children: const [
                  Expanded(child: Skelton()),
                  SizedBox(width: 16),
                  Expanded(child: Skelton()),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
