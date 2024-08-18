import 'package:demo_application/assets/image_asset.dart';
import 'package:demo_application/assets/svg_asset.dart';
import 'package:demo_application/screen/base/base_provider.dart';
import 'package:demo_application/screen/home/home_provider.dart';
import 'package:demo_application/screen/home/weather_model.dart';
import 'package:demo_application/screen/setting/setting_model.dart';
import 'package:demo_application/service/error/error_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

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
        centerTitle: true,
        elevation: 0,
        forceMaterialTransparency: true,
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
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _LocationWidget(systemInfo: weather.systemInfo, area: weather.areaName),
            const VerticalSpace(height: 12),
            _TemperatureWidget(weather: weather.weathers[0], weatherInfo: weather.weatherInfo),
            const VerticalSpace(height: 12),
            _MinMaxTemperatureWidget(weatherInfo: weather.weatherInfo),
            const VerticalSpace(height: 12),
            const _ForecastWidget(),
            const VerticalSpace(height: 12),
            const _NewsWidget(),
          ],
        ),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.location_on),
                  const HorizontalSpace(width: 2),
                  Text(area, style: textTheme.titleLarge),
                  Text(
                    ', ${systemInfo.country}',
                    style: textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              DateWidget(dateTime: DateTime.now(), style: textTheme.titleMedium)
            ],
          ),
        ],
      ),
    );
  }
}

class _TemperatureWidget extends StatelessWidget {
  const _TemperatureWidget({required this.weather, required this.weatherInfo});

  final Weather weather;
  final WeatherInfo weatherInfo;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Card(
      color: colorScheme.primaryFixedDim,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${weatherInfo.temperature} ${context.read<HomeProvider>().settingDetail.symbol}',
                  style: textTheme.displayLarge?.copyWith(
                    fontSize: 45,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const VerticalSpace(height: 2),
                Text(weather.main, style: textTheme.titleLarge),
                const VerticalSpace(height: 2),
                Text(weather.description, style: textTheme.titleMedium),
              ],
            ),
            Flexible(
              child: WeatherIcon(
                icon: weather.icon,
              ),
            ),
          ],
        ),
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
    return Card(
      color: colorScheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _getTile(
                    textTheme,
                    'Min Temp',
                    '${weatherInfo.temperatureMin} ${context.read<HomeProvider>().settingDetail.symbol}',
                    SvgAsset.minTemp),
                const VerticalSpace(height: 8),
                _getTile(
                    textTheme,
                    'Max Temp',
                    '${weatherInfo.temperatureMax} ${context.read<HomeProvider>().settingDetail.symbol}',
                    SvgAsset.maxTemp),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _getTile(
                    textTheme, 'Air Pressure', '${weatherInfo.pressure}', SvgAsset.pressure, 30),
                const VerticalSpace(height: 8),
                _getTile(
                  textTheme,
                  'Humidity',
                  '${weatherInfo.humidity}',
                  SvgAsset.humidity,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _getTile(TextTheme textTheme, String title, String value, String path,
      [double iconSize = 40]) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgImage(
          path: path,
          size: iconSize,
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
    return Card(
      color: colorScheme.secondaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Selector<HomeProvider, (List<ForecastDetail>, SettingDetail)>(
          builder: (ctx, (List<ForecastDetail>, SettingDetail) bodies, child) {
            return bodies.$1.isEmpty
                ? const SizedBox()
                : SizedBox(
                    height: 300,
                    child: ListView.builder(
                      itemCount: bodies.$1.length,
                      itemBuilder: (ctx, i) {
                        var body = bodies.$1[i];
                        return ListTile(
                          title: DateWidget(
                            dateTime: body.dateTime,
                            style: textTheme.titleMedium,
                          ),
                          leading: CircleAvatar(
                            child: WeatherIcon(
                              icon: body.weathers[0].icon,
                            ),
                          ),
                          subtitle: DateTimeWidget(
                            dateTime: body.dateTime,
                          ),
                          trailing: Text(
                            '${body.weatherInfo.temperatureMin} / ${body.weatherInfo.temperatureMax} ${bodies.$2.symbol}',
                            style: textTheme.titleSmall,
                          ),
                        );
                      },
                    ),
                  );
          },
          selector: (_, HomeProvider provider) =>
              (provider.forecastDetails, provider.settingDetail),
        ),
      ),
    );
  }
}

class _NewsWidget extends StatelessWidget {
  const _NewsWidget();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Selector<HomeProvider, List<NewsHeadline>>(
      builder: (ctx, headlines, child) {
        return headlines.isEmpty
            ? const SizedBox()
            : SizedBox(
                height: headlines.length > 7 ? 400 : 250,
                child: Column(
                  children: [
                    Text('Headlines', style: textTheme.titleLarge),
                    Expanded(
                      child: ListView.builder(
                        itemCount: headlines.length,
                        itemBuilder: (_, i) {
                          var headline = headlines[i];
                          return ListTile(
                            title: Text(
                              headline.title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            onTap: () {
                              launchUrl(Uri.parse(headline.url));
                            },
                            subtitle: DateWidget(
                              dateTime: headline.publishDate,
                              indDateFormat: true,
                            ),
                            leading: headline.image == null
                                ? Image.asset(
                                    ImageAsset.news,
                                    height: 60,
                                  )
                                : Image.network(
                                    headline.image!,
                                    height: 60,
                                    errorBuilder: (_, obj, stack) {
                                      return Image.asset(
                                        ImageAsset.news,
                                        height: 60,
                                      );
                                    },
                                  ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
      },
      selector: (ctx, provider) => provider.headlines,
    );
  }
}
