import 'package:demo_application/screen/base/base_bloc.dart';
import 'package:demo_application/screen/home/bloc/home_bloc.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/home_event.dart';
import 'bloc/home_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final HomeBloc _homeBloc;

  @override
  void initState() {
    super.initState();
    _homeBloc = HomeBloc(context);
  }

  @override
  void dispose() {
    _homeBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _homeBloc..add(const GetAllPerson(0)),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (ctx, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Persons'),
              scrolledUnderElevation: 0,
              forceMaterialTransparency: true,
            ),
            body: NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                if (notification is ScrollEndNotification && notification.metrics.extentAfter == 0) {
                  ctx.read<HomeBloc>().add(GetAllPerson(state.pageNo));
                }
                return false;
              },
              child: switch (state.progressState) {
                (ProgressState.loading) => const Center(child: CircularProgressIndicator()),
                (ProgressState.error) => const Center(child: Text('Error')),
                (ProgressState.success) => ListView.builder(
                    itemCount: state.persons.length,
                    itemBuilder: (ctx, i) {
                      var person = state.persons[i];
                      return ListTile(
                        title: Text('${person.firstname} ${person.lastname}'),
                        subtitle: Text(person.email),
                        leading: Hero(
                          tag: person.id.toString(),
                          child: CircularImage(
                            imageUrl: person.profile,
                            height: 80,
                            width: 60,
                          ),
                        ),
                        onTap: () {
                          ctx.read<HomeBloc>().add(GetPerson(person.id));
                        },
                      );
                    },
                  )
              },
            ),
          );
        },
      ),
    );
  }
}

class CircularImage extends StatelessWidget {
  const CircularImage({super.key, required this.imageUrl, this.width, this.height});

  final double? width;
  final double? height;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.network(
        imageUrl,
        width: width,
        height: height,
        fit: BoxFit.fill,
      ),
    );
  }
}
