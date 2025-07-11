part of '../synchronization_view.dart';

class _SynchronizationListWidget extends StatelessWidget {
  const _SynchronizationListWidget({required this.synchronizationViewModel});

  final SynchronizationViewModel synchronizationViewModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SynchronizationViewModel, SynchronizationState>(
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(title: const Text('Senkronizasyon')),
          body: Padding(
            padding: ProjectPadding.allMedium(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // General progress title and rod
                ValueListenableBuilder<int>(
                  valueListenable: state.currentGlobalStepNotifier,
                  builder: (context, currentStep, _) {
                    return ValueListenableBuilder<int>(
                      valueListenable: state.totalGlobalStepsNotifier,
                      builder: (context, totalSteps, __) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Genel İlerleme: Adım $currentStep / $totalSteps',
                              style: context.general.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 4),
                            LinearProgressIndicator(
                              value: totalSteps > 0 ? currentStep / totalSteps : 0,
                              backgroundColor: context.general.colorScheme.primary.withValues(alpha: 0.2),
                              color: context.general.colorScheme.primary,
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
                // General Situation Message
                ValueListenableBuilder<String>(
                  valueListenable: state.overallSyncMessageNotifier,
                  builder: (context, message, child) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 2),
                      child: Text('Son Durum: $message', style: context.general.textTheme.bodyMedium),
                    );
                  },
                ),
                //List of synchronization items
                Expanded(
                  child: ValueListenableBuilder<List<SyncItem>>(
                    valueListenable: state.syncItemsNotifier,
                    builder: (context, syncItems, child) {
                      return ListView.builder(
                        itemCount: syncItems.length,
                        itemBuilder: (context, index) {
                          final item = syncItems[index];
                          return Card(
                            margin: EdgeInsets.symmetric(vertical: 5),
                            elevation: 2,
                            shape: RoundedRectangleBorder(borderRadius: ProjectBorderRadius.small()),
                            child: Padding(
                              padding: ProjectPadding.allSmall(),
                              child: Row(
                                children: [
                                  ValueListenableBuilder<SyncStatusEnum>(
                                    valueListenable: item.statusNotifier,
                                    builder: (context, status, _) {
                                      return Icon(item.statusIcon, color: item.statusIconColor, size: 28);
                                    },
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item.name,
                                          style: context.general.textTheme.titleMedium?.copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        ValueListenableBuilder<String>(
                                          valueListenable: item.messageNotifier,
                                          builder: (context, message, _) {
                                            return Text(message, style: context.general.textTheme.bodySmall);
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(height: 12),

                // Buttons
                CustomLoadingButton(
                  title: 'Güncel Verileri Senkronize Et',
                  hasBorder: false,
                  onPressed: () async {
                    synchronizationViewModel.startGeneralSync(clearExisting: false);
                  },
                ),
                const SizedBox(height: 8),
                CustomLoadingButton(
                  title: 'Tüm Verileri Yeniden Senkronize Et',
                  hasBorder: true,
                  onPressed: () async {
                    customShowDialogGeneric(
                      context,
                      alertEnum: AlertEnum.info,
                      subTitle:
                          'Bu işlem kayıtlı senkronizasyon verilerinizi sıfırlar ve tekrardan senkronizasyon yapmanızı sağlar devam etmek istiyor musunuz ? ',
                      okButtonTitle: 'Evet',
                      cancelButtonTitle: 'Hayır',
                      okButtonFunction: () async {
                        synchronizationViewModel.startGeneralSync(clearExisting: true);
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
