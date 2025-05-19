part of '../home_view.dart';

class _UserList extends StatelessWidget {
  const _UserList();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeViewModel, HomeState, List<UserData>>(
      selector: (state) {
        return state.users ?? [];
      },
      builder: (context, state) {
        if (state.isEmpty) {
          return Column(
            children: [
              Expanded(
                child: Assets.images.imgFlags.image(package: 'gen', width: 400, height: 400),
              ),
              Expanded(child: Assets.lottie.animZombie.lottie(package: 'gen')),
            ],
          );
        }
        return ListView.builder(
          itemCount: state.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(state[index].firstName ?? ''),
                subtitle: Text(state[index].email ?? ''),
                leading: CircleAvatar(backgroundImage: NetworkImage(state[index].avatar ?? '')),
              ),
            );
          },
        );
      },
    );
  }
}
