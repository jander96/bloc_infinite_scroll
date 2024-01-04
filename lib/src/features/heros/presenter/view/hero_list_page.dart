
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pagination_example/src/features/heros/presenter/bloc/hero_list_bloc.dart';
import 'package:flutter_pagination_example/src/features/heros/presenter/bloc/hero_list_event.dart';
import 'package:network/network.dart';
import 'package:bloc_scroll_paging/bloc_scroll_paging.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HeroPage extends StatelessWidget {
  const HeroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) =>
            getIt.get<HeroBloc>(),
        child: _HeroView());
  }
}

class _HeroView extends StatefulWidget {
  @override
  State<_HeroView> createState() => _HeroViewState();
}

class _HeroViewState extends State<_HeroView> {
  @override
  void initState() {
    context.read<HeroBloc>().add(HeroFetched());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final viewState = context.watch<HeroBloc>().state;
    return Center(
      child: viewState.asyncValue.when(
          initial: (initial) => SizedBox(),
          data: (data) => HeroList(disneyList: data),
          error: (error, stackTrace) => ErrorWidget(error: error as NetworkError,),
          loading: (previous) => const Center(child: CircularProgressIndicator()),)
    );
  }
}

class HeroList extends StatelessWidget {
  const HeroList({super.key, required this.disneyList});

  final List<DisneyData> disneyList;

  @override
  Widget build(BuildContext context) {
    final viewState = context.watch<HeroBloc>().state;
    return BlocInfiniteList<DisneyData>(
      initialPage: 2,
      pagingCompleted: viewState.pagingStatus.isPaginationCompleted,
        itemList: disneyList,
        loadingBuilder: () => const BottomLoader(),
        triggerEvent: (page) {
          context.read<HeroBloc>().add(HeroFetched(page: page, pageSize: 20));
        },
        child: (hero) => GridItem(disney: hero)

            // ListTile(
            //   leading: Image.network(
            //       "${hero.thumbnail!.path}.${hero.thumbnail!.extension}"),
            //   title: Text(hero.name!),
            //   subtitle: Text(hero.description!),
            // ),
        ,
        scrollableWidgetBuilder: (controller, itemCount, itemBuilder) {
          return GridView.builder(
            controller: controller,
            itemBuilder: itemBuilder,
            itemCount: itemCount,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          );
        },
        hasReachedMax: viewState.pagingStatus.hasReachedMax,

    bottomBuilder: ()=>const Text("El fin "),);
  }
}

class ErrorWidget extends StatelessWidget {
  const ErrorWidget({super.key, required this.error});

  final NetworkError error;

  @override
  Widget build(BuildContext context) {
    return switch (error) {
      ConnectionError() => const Text('Error de conexion'),
      UnAuthorized() => const Text('Acceso no autorizado'),
      BadRequest() => const Text('Error de cliente'),
      Forbidden() => const Text('No disponible'),
      NotFound() => const Text('No se encuentra '),
      UnKnow() => const Text('Error de desconocido'),
      LimitExceeded() => const Text('Limite sobrepasado '),
    };
  }
}

class BottomLoader extends StatelessWidget {
  const BottomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: 24,
        width: 24,
        child: CircularProgressIndicator(strokeWidth: 1.5),
      ),
    );
  }
}

class GridItem extends StatelessWidget {
  const GridItem({super.key, required this.disney});
  final DisneyData disney;

  @override
  Widget build(BuildContext context) {
    return  Card(margin: const EdgeInsets.all(8),
      child: Column(
        children: [
          Image(image: CachedNetworkImageProvider("${disney.imageUrl}", maxHeight: 80,scale: 1.5)),
          Text('${disney.name}')
        ],
      ),
    );
  }
}
