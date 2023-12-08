import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/components/custom_scaffold.dart';
import '../bloc/materi/materi_bloc.dart';
import '../widgets/materi_card.dart';

class MateriPage extends StatefulWidget {
  final bool showBackButton;
  const MateriPage({super.key, this.showBackButton = true});

  @override
  State<MateriPage> createState() => _MateriPageState();
}

class _MateriPageState extends State<MateriPage> {
  @override
  void initState() {
    context.read<MateriBloc>().add(const MateriEvent.getAllMateri());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      showBackButton: widget.showBackButton,
      appBarTitle: const Text('Materi TPA'),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 24.0),
        children: [
          BlocBuilder<MateriBloc, MateriState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () {
                  return const Center(child: Text('Error'));
                },
                loading: () {
                  return const Center(child: CircularProgressIndicator());
                },
                success: (datas) {
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: datas.data.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 16.0),
                    itemBuilder: (context, index) => MateriCard(
                      data: datas.data[index],
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
