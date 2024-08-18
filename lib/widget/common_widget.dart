import 'package:demo_application/widget/extension/date_ext.dart';
import 'package:demo_application/widget/extension/ui_ext_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../screen/base/base_provider.dart';
import '../service/error/error_model.dart';

@immutable
class ProcessWidget extends StatelessWidget {
  const ProcessWidget({
    super.key,
    required this.processStatus,
    required this.failure,
    required this.child,
    this.style,
    this.loader,
    this.retry,
  });

  final ProgressStatus processStatus;
  final Failure failure;
  final Widget child;
  final TextStyle? style;
  final Widget? loader;
  final VoidCallback? retry;

  @override
  Widget build(BuildContext context) {
    return switch (processStatus) {
      ProgressStatus.loading => _loading,
      ProgressStatus.success => child,
      ProgressStatus.error => _FailureUi(failure: failure, style: style, retry: retry),
    };
  }

  Widget get _loading {
    return loader ?? const Center(child: CircularProgressIndicator());
  }
}

@immutable
class _FailureUi extends StatelessWidget {
  const _FailureUi({required this.failure, this.retry, this.style});

  final Failure failure;
  final VoidCallback? retry;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Center(
      heightFactor: 0.8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: (16, 0).symmetric,
            child: Text(
              failure.message,
              style: style ??
                  textTheme.bodyLarge?.copyWith(
                    color: colorScheme.error,
                  ),
            ),
          ),
          if (retry != null)
            Padding(
              padding: 4.all,
              child: FilledButton(
                onPressed: retry,
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(colorScheme.error),
                  foregroundColor: WidgetStatePropertyAll(colorScheme.onError),
                ),
                child: const Text('Retry'),
              ),
            ),
        ],
      ),
    );
  }
}

@immutable
class HorizontalSpace extends StatelessWidget {
  const HorizontalSpace({super.key, this.width = 12});

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width);
  }
}

@immutable
class VerticalSpace extends StatelessWidget {
  const VerticalSpace({super.key, this.height = 12});

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }
}

class WeatherIcon extends StatelessWidget {
  const WeatherIcon({super.key, required this.icon, this.size});

  final String icon;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      'https://openweathermap.org/img/wn/$icon@2x.png',
      width: size ?? 150,
      height: size ?? 150,
      fit: BoxFit.fill,
      errorBuilder: (ctx, obj, _) => const Icon(Icons.cloud),
    );
  }
}

class SvgImage extends StatelessWidget {
  const SvgImage({super.key, required this.path, this.color, this.size});

  final String path;
  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path,
      fit: BoxFit.fill,
      width: size ?? 30,
      height: size ?? 30,
      color: color,
    );
  }
}

@immutable
class DateWidget extends StatelessWidget {
  const DateWidget({
    super.key,
    required this.dateTime,
    this.style,
    this.indDateFormat = false,
  });

  final DateTime? dateTime;
  final TextStyle? style;
  final bool indDateFormat;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Text(
      dateTime == null
          ? 'NA'
          : indDateFormat
              ? dateTime!.indDateFormat
              : dateTime!.dateDayFormat,
      style: style ?? textTheme.bodyMedium,
    );
  }
}

@immutable
class DateTimeWidget extends StatelessWidget {
  const DateTimeWidget({
    super.key,
    required this.dateTime,
    this.style,
  });

  final DateTime? dateTime;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Text(
      dateTime == null ? 'NA' : dateTime!.timeAP,
      style: style ?? textTheme.bodyMedium,
    );
  }
}
