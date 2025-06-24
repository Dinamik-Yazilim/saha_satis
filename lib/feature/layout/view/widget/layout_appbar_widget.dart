part of '../layout_view.dart';

class _LayoutAppBarWidget extends StatelessWidget implements PreferredSizeWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutViewModel, LayoutState>(
      builder: (context, layoutState) {
        final String titleText =
            layoutState.breadcrumb.isNotEmpty ? layoutState.breadcrumb.last.title : LocaleKeys.home_title.tr();
        final bool showLeadingButton = !layoutState.isOnMainMenu;
        final bool shouldShowExitIcon = layoutState.isOnMainMenu;

        return CustomAppBar(
          title: Text(titleText).tr(),
          leading:
              showLeadingButton
                  ? IconButton(
                    icon: Icon(Icons.arrow_back_ios_new, color: context.general.colorScheme.primary),
                    onPressed: () {
                      context.read<LayoutViewModel>().goBack();
                    },
                  )
                  : const SizedBox.shrink(),
          isExit: shouldShowExitIcon,
        );
      },
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
