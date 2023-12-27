import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pagination_example/src/common/data/network/network_errors/network_errors.dart';
import 'package:flutter_pagination_example/src/common/di/dependency_injection.dart';
import 'package:flutter_pagination_example/src/common/widgets/app_infinit_list_widget.dart';
import 'package:flutter_pagination_example/src/features/heros/presenter/bloc/hero_list_bloc.dart';
import 'package:flutter_pagination_example/src/features/heros/presenter/bloc/hero_list_event.dart';
import 'package:flutter_pagination_example/src/features/heros/presenter/bloc/hero_list_view_state.dart';
import 'package:flutter_pagination_example/src/common/domain/hero.dart'
    as hero_model;

class HeroPage extends StatelessWidget {
  const HeroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) =>
            getIt.get<HeroBloc>()..add(HeroFetched()),
        child: _HeroView());
  }
}

class _HeroView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewState = context.watch<HeroBloc>().state;
    return Center(
      child: switch (viewState.status) {
        HeroStatus.initial => const CircularProgressIndicator(),
        HeroStatus.success => HeroList(heroList: viewState.heros),
        HeroStatus.failure => ErrorWidget(error: ConnectionError() ?? UnKnow()),
      },
    );
  }
}

class HeroList extends StatelessWidget {
  const HeroList({super.key, required this.heroList});

  final List<hero_model.Hero> heroList;

  @override
  Widget build(BuildContext context) {
    final viewState = context.watch<HeroBloc>().state;
    return BlocInfiniteList<hero_model.Hero>(
        itemList: heroList,
        loadingBuilder: () => const BottomLoader(),
        triggerEvent: (page) {
          context.read<HeroBloc>().add(HeroFetched(page: page));
        },
        child: (hero) => GridItem(hero: hero)

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
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          );
        },
        hasReachedMax: viewState.hasReachedMax,
    bottomBuilder: ()=>Text("El fin "),);
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
      UnKnow() => const Text('Error de conexion'),
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
  const GridItem({super.key, required this.hero});
  final hero_model.Hero hero;

  @override
  Widget build(BuildContext context) {
    return  Card(
      child: Column(
        children: [
          Image.network(
              "${hero.thumbnail!.path}.${hero.thumbnail!.extension}", height: 40, width: 40,),
          Text(hero.name!)
        ],
      ),
    );
  }
}
