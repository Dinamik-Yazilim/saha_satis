part of '../layout_view.dart';

class _LayoutListWidget extends StatelessWidget {
  final MenuItem menuItem;
  final ValueChanged<MenuItem> onTapCallback;

  const _LayoutListWidget({required this.menuItem, required this.onTapCallback});

  @override
  Widget build(BuildContext context) {
    if (menuItem.isExpandable && menuItem.children != null && menuItem.children!.isNotEmpty) {
      return Card(
        margin: context.padding.verticalLow,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: ProjectBorderRadius.medium()),
        child: ExpansionTile(
          leading: Icon(menuItem.icon, color: context.general.colorScheme.primary),
          title: Text(menuItem.title, style: context.general.textTheme.titleMedium).tr(),
          iconColor: context.general.colorScheme.primary,
          collapsedIconColor: context.general.colorScheme.onSurface,
          children:
              menuItem.children!.map((subItem) {
                return Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: ListTile(
                    leading: subItem.icon != null ? Icon(subItem.icon) : null,
                    title: Text(subItem.title, style: context.general.textTheme.titleSmall).tr(),
                    onTap: () => onTapCallback(subItem),
                  ),
                );
              }).toList(),
        ),
      );
    } else {
      return Card(
        margin: context.padding.verticalLow,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: ProjectBorderRadius.medium()),
        child: ListTile(
          leading: Icon(menuItem.icon, color: context.general.colorScheme.primary),
          title: Text(menuItem.title, style: context.general.textTheme.titleMedium).tr(),
          onTap: () => onTapCallback(menuItem),
        ),
      );
    }
  }
}
