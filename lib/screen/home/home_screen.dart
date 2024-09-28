import 'package:demo_application/assets/svg_asset.dart';
import 'package:demo_application/screen/base/base_provider.dart';
import 'package:demo_application/screen/home/home_provider.dart';
import 'package:demo_application/screen/home/weather_model.dart';
import 'package:demo_application/screen/setting/setting_model.dart';
import 'package:demo_application/service/error/error_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../widget/common_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeProvider>(
      create: (ctx) => HomeProvider(context)..init(),
      child: const _HomeScreenMain(),
    );
  }
}

///
class _HomeScreenMain extends StatefulWidget {
  const _HomeScreenMain();

  @override
  State<_HomeScreenMain> createState() => _HomeScreenMainState();
}

class _HomeScreenMainState extends State<_HomeScreenMain> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeProvider>().getCurrentWeatherInfo();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
        elevation: 0,
        forceMaterialTransparency: true,
        systemOverlayStyle: SystemUiOverlayStyle(
          systemNavigationBarColor: colorScheme.surface,
        ),
        actions: [
          IconButton(
            onPressed: context.read<HomeProvider>().onSettingClick,
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: Selector<HomeProvider, (WeatherDetail?, ProgressStatus, Failure)>(
        builder: (ctx, (WeatherDetail?, ProgressStatus, Failure) data, child) {
          return ProcessWidget(
            processStatus: data.$2,
            failure: data.$3,
            child: _WeatherWidget(
              weatherDetail: data.$1,
            ),
            retry: () => context.read<HomeProvider>().getCurrentWeatherInfo(),
          );
        },
        selector: (_, HomeProvider homeProvider) {
          return (
            homeProvider.weatherDetail,
            homeProvider.progressState,
            homeProvider.failure,
          );
        },
        shouldRebuild: (old, newData) => old != newData,
      ),
    );
  }
}

class _WeatherWidget extends StatelessWidget {
  const _WeatherWidget({this.weatherDetail});

  final WeatherDetail? weatherDetail;

  @override
  Widget build(BuildContext context) {
    final WeatherDetail weather = weatherDetail!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _LocationWidget(systemInfo: weather.systemInfo, area: weather.areaName),
          const VerticalSpace(height: 12),
          const TemperatureWidget(),
          const VerticalSpace(height: 8),
          _MinMaxTemperatureWidget(weatherInfo: weather.weatherInfo),
          const _ForecastWidget(),
        ],
      ),
    );
  }
}

class _LocationWidget extends StatelessWidget {
  const _LocationWidget({required this.systemInfo, required this.area});

  final SystemInfo systemInfo;
  final String area;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(area, style: textTheme.titleLarge),
              Text(
                ', ${systemInfo.country}',
                style: textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          DateWidget(dateTime: DateTime.now(), style: textTheme.titleMedium),
        ],
      ),
    );
  }
}

class _MinMaxTemperatureWidget extends StatelessWidget {
  const _MinMaxTemperatureWidget({required this.weatherInfo});

  final WeatherInfo weatherInfo;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _getTile(
                  textTheme,
                  'Min Temp',
                  '${weatherInfo.temperatureMin} ${context.read<HomeProvider>().settingDetail.symbol}',
                  SvgAsset.minTemp,
                  colorScheme.onSurface),
              const VerticalSpace(height: 16),
              _getTile(
                  textTheme,
                  'Max Temp',
                  '${weatherInfo.temperatureMax} ${context.read<HomeProvider>().settingDetail.symbol}',
                  SvgAsset.maxTemp,
                  colorScheme.onSurface),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _getTile(textTheme, 'Air Pressure', '${weatherInfo.pressure}', SvgAsset.pressure,
                  colorScheme.onSurface, 30),
              const VerticalSpace(height: 16),
              _getTile(textTheme, 'Humidity ', '${weatherInfo.humidity}', SvgAsset.humidity,
                  colorScheme.onSurface),
            ],
          ),
        ],
      ),
    );
  }

  Widget _getTile(TextTheme textTheme, String title, String value, String path, Color color,
      [double iconSize = 40]) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgImage(
          path: path,
          size: iconSize,
          color: color,
        ),
        const HorizontalSpace(width: 8),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(value, style: textTheme.titleLarge),
            Text(title, style: textTheme.bodyMedium),
          ],
        )
      ],
    );
  }
}

class _ForecastWidget extends StatelessWidget {
  const _ForecastWidget();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Forecast', style: textTheme.titleLarge),
              TextButton(
                onPressed: context.read<HomeProvider>().onArticleClick,
                style: ButtonStyle(
                  textStyle: WidgetStatePropertyAll(
                    textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                child: const Text('Articles'),
              )
            ],
          ),
          const SizedBox(height: 6),
          Selector<HomeProvider, (List<ForecastDetail>, SettingDetail)>(
            builder: (ctx, (List<ForecastDetail>, SettingDetail) bodies, child) {
              return bodies.$1.isEmpty
                  ? const SizedBox()
                  : Flexible(
                      child: Scrollbar(
                        child: ListView.builder(
                          itemCount: bodies.$1.length,
                          itemBuilder: (ctx, i) {
                            var body = bodies.$1[i];
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    flex: 3,
                                    child: DateWidget(
                                      dateTime: body.dateTime,
                                      style: textTheme.titleMedium,
                                    ),
                                  ),
                                  Flexible(
                                    flex: 4,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: Colors.transparent,
                                          child: WeatherIcon(
                                            icon: body.weathers[0].icon,
                                          ),
                                        ),
                                        Text(
                                          '${body.weatherInfo.temperatureMin} / ${body.weatherInfo.temperatureMax} ${bodies.$2.symbol}',
                                          style: textTheme.titleSmall,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    );
            },
            selector: (_, HomeProvider provider) =>
                (provider.forecastDetails, provider.settingDetail),
          ),
        ],
      ),
    );
  }
}

class TemperatureWidget extends StatelessWidget {
  const TemperatureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Selector<HomeProvider, WeatherDetail>(
      builder: (_, widgetDetail, child) {
        final weather = widgetDetail.weathers[0];
        final weatherInfo = widgetDetail.weatherInfo;
        return Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                color: colorScheme.primaryFixedDim,
                child: WeatherIcon(
                  icon: weather.icon,
                  size: 120,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${weatherInfo.temperature}',
                    style: textTheme.displayMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.0),
                    child: Icon(
                      Icons.circle,
                      size: 14,
                    ),
                  ),
                  Text(
                    context.read<HomeProvider>().settingDetail.symbol,
                    style: textTheme.displayMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const VerticalSpace(height: 2),
              Text(
                '${weather.main} - ${weather.description}',
                style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w500),
              ),
            ],
          ),
        );
      },
      selector: (_, homeProvider) => homeProvider.weatherDetail!,
    );
  }
}
