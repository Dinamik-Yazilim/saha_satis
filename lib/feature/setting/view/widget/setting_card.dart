part of '../setting_view.dart';

class _SettingCard extends StatelessWidget {
  const _SettingCard({required this.children});
  final List<Widget> children;

  List<Widget> _withDividers(List<Widget> widgets, BuildContext context) {
    final separated = <Widget>[];
    for (int i = 0; i < widgets.length; i++) {
      separated.add(widgets[i]);
      if (i < widgets.length - 1) {
        separated.add(Divider(color: context.general.appTheme.dividerColor, thickness: 3, indent: 15, endIndent: 15));
      }
    }
    return separated;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: CustomResponsiveHelper.isMobileOrTablet(context) ? ProjectPadding.allSmall() : ProjectPadding.allLarge(),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: context.general.colorScheme.primary.withValues(alpha: 0.1),
          borderRadius: ProjectBorderRadius.medium(),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: _withDividers(children, context),
        ),
      ),
    );
  }
}
