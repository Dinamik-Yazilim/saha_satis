part of '../home_view.dart';

class _HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _HomeAppBar({required this.title});
  final Widget? title;

  @override
  Widget build(BuildContext context) {
    return AppBar(title: title, centerTitle: true, actions: [_Loading()]);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _Loading extends StatelessWidget {
  const _Loading();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeViewModel, HomeState>(
      builder: (context, state) {
        if (!state.isLoading) return const SizedBox.shrink();
        return CircularProgressIndicator();
      },
    );
  }
}
