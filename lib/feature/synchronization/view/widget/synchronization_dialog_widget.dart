part of '../synchronization_view.dart';

class _SynchronizationDialogWidget extends StatelessWidget {
  const _SynchronizationDialogWidget();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SynchronizationViewModel, SynchronizationState>(
      builder: (context, state) {
        return Material(
          color: Colors.black.withValues(alpha: 0.3),
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              padding: ProjectPadding.allMedium(),
              decoration: BoxDecoration(
                color: context.general.colorScheme.surface,
                borderRadius: ProjectBorderRadius.large(),
                boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Veriler Senkronize Ediliyor',
                    style: context.general.textTheme.titleLarge!.copyWith(
                      color: context.general.colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  ValueListenableBuilder<String>(
                    valueListenable: state.overallSyncMessageNotifier,
                    builder: (context, message, child) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // General Progress step (like 1/3)
                          ValueListenableBuilder<int>(
                            valueListenable: state.currentGlobalStepNotifier,
                            builder: (context, currentStep, _) {
                              return ValueListenableBuilder<int>(
                                valueListenable: state.totalGlobalStepsNotifier,
                                builder: (context, totalSteps, __) {
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Adım $currentStep / $totalSteps',
                                        style: context.general.textTheme.bodySmall?.copyWith(
                                          color: context.general.colorScheme.onSurfaceVariant,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      SizedBox(
                                        width: double.infinity,
                                        child: LinearProgressIndicator(
                                          value: totalSteps > 0 ? currentStep / totalSteps : 0,
                                          color: context.general.colorScheme.primary,
                                          backgroundColor: context.general.colorScheme.primary.withValues(alpha: 0.2),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                          const SizedBox(height: 16),
                          // Detailed message and rotation icon
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                width: 24,
                                height: 24,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: context.general.colorScheme.secondary,
                                  backgroundColor: Colors.transparent,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(child: Text(message, style: context.general.textTheme.bodyMedium)),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
