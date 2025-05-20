import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kabar_news/common/bloc/assets.dart';
import 'package:kabar_news/features/homepage/cubit/fetch_news_cubit.dart';
import 'package:kabar_news/features/homepage/repository/news_repository.dart';
import 'package:kabar_news/features/homepage/ui/widgets/custom/home_content.dart';

class HomepageWidget extends StatefulWidget {
  const HomepageWidget({super.key});

  @override
  State<HomepageWidget> createState() => _HomepageWidgetState();
}

class _HomepageWidgetState extends State<HomepageWidget>
    with TickerProviderStateMixin {
  late TabController _tabController;
  int currentTab = 0;
  @override
  void initState() {
    super.initState();

    _tabController = TabController(
      length: 6,
      vsync: this,
      initialIndex: 0,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          centerTitle: false,
          title: Image.asset(
            Assets.logo,
            height: 30,
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.notifications))
          ],
          bottom: TabBar(
            isScrollable: true,
            controller: _tabController,
            onTap: (v) {},
            labelColor: Colors.grey,
            unselectedLabelColor: Colors.grey,
            tabAlignment: TabAlignment.start,
            indicatorColor: Theme.of(context).primaryColor,
            tabs: [
              Tab(
                text: "Latest",
              ),
              Tab(
                text: "Bangladesh",
              ),
              Tab(
                text: "Nepal",
              ),
              Tab(
                text: "Bhutan",
              ),
              Tab(
                text: "Uk",
              ),
              Tab(
                text: "Usa",
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            BlocProvider(
              create: (context) =>
                  FetchNewsCubit(newsRepository: context.read<NewsRepository>())
                    ..fetchNews("India"),
              child: HomeContent(
                query: "India",
              ),
            ),
            BlocProvider(
              create: (context) =>
                  FetchNewsCubit(newsRepository: context.read<NewsRepository>())
                    ..fetchNews("Bangladesh"),
              child: HomeContent(
                query: "Bangladesh",
              ),
            ),
            BlocProvider(
              create: (context) =>
                  FetchNewsCubit(newsRepository: context.read<NewsRepository>())
                    ..fetchNews("Nepal"),
              child: HomeContent(query: "Nepal"),
            ),
            BlocProvider(
              create: (context) =>
                  FetchNewsCubit(newsRepository: context.read<NewsRepository>())
                    ..fetchNews("Bhutan"),
              child: HomeContent(
                query: "Bhutan",
              ),
            ),
            BlocProvider(
              create: (context) =>
                  FetchNewsCubit(newsRepository: context.read<NewsRepository>())
                    ..fetchNews("Uk"),
              child: HomeContent(
                query: "Uk",
              ),
            ),
            BlocProvider(
              create: (context) =>
                  FetchNewsCubit(newsRepository: context.read<NewsRepository>())
                    ..fetchNews("Usa"),
              child: HomeContent(
                query: "Usa",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
