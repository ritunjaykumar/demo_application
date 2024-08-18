part of 'dialog.dart';

class _ProgressDialogWidget extends StatelessWidget {
  const _ProgressDialogWidget({this.title});

  final String? title;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              const CircularProgressIndicator(
                strokeWidth: 4,
              ),
              const SizedBox(width: 12),
              Text(
                title ?? "Please wait ...",
              )
            ],
          ),
        ),
      ),
    );
  }
}
