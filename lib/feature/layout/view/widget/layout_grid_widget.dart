part of '../layout_view.dart';

class _LayoutGridWidget extends StatelessWidget {
  final MenuItem menuItem;
  final VoidCallback? onTap;
  final Color cardBaseColor;
  final Color contentColor;
  final Function(MenuItem) onLongPressCallback;

  const _LayoutGridWidget({
    required this.menuItem,
    this.onTap,
    required this.cardBaseColor,
    required this.contentColor,
    required this.onLongPressCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 12,
      shadowColor: contentColor.withValues(alpha: 0.8),
      shape: RoundedRectangleBorder(borderRadius: ProjectBorderRadius.normal()),
      clipBehavior: Clip.antiAlias,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [cardBaseColor, cardBaseColor.withValues(alpha: 0.8)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: InkWell(
          onTap: onTap,
          onLongPress: () => onLongPressCallback(menuItem),
          borderRadius: ProjectBorderRadius.normal(),
          splashColor: contentColor.withValues(alpha: 0.15),
          highlightColor: contentColor.withValues(alpha: 0.08),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (menuItem.icon != null)
                    Icon(
                      menuItem.icon,
                      size: CustomResponsiveHelper.isMobileOrTablet(context) ? 56 : 84,
                      color: contentColor,
                    ),
                  Column(
                    children: [
                      Text(
                        menuItem.title,
                        textAlign: TextAlign.center,
                        style:
                            CustomResponsiveHelper.isMobileOrTablet(context)
                                ? context.general.textTheme.titleLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: contentColor,
                                )
                                : context.general.textTheme.headlineMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: contentColor,
                                ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ).tr(),
                      if (menuItem.microId != null)
                        Text(
                          '( ${menuItem.microId} )',
                          style: context.general.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: contentColor.withValues(alpha: 0.9),
                          ),
                        ).tr(),
                    ],
                  ),
                ],
              ),
              if (menuItem.isExpandable)
                Positioned(
                  right: 20,
                  top: 20,
                  child: Icon(
                    Icons.layers,
                    size: CustomResponsiveHelper.isMobileOrTablet(context) ? 24 : 32,
                    color: contentColor.withValues(alpha: 0.6),
                  ),
                ),
              if (menuItem.isFavorite)
                Positioned(
                  left: 20,
                  top: 20,
                  child: Icon(
                    BootstrapIcons.heart_fill,
                    size: CustomResponsiveHelper.isMobileOrTablet(context) ? 20 : 32,
                    color: context.general.colorScheme.error.withValues(alpha: 0.5),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
