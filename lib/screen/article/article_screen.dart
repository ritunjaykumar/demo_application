import 'package:demo_application/assets/image_asset.dart';
import 'package:demo_application/screen/article/article_provider.dart';
import 'package:demo_application/screen/setting/setting_screen.dart';
import 'package:demo_application/widget/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../home/weather_model.dart';

class ArticleScreen extends StatefulWidget {
  const ArticleScreen({super.key, required this.temperature, required this.unit});

  final double temperature;
  final String unit;

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ArticleProvider>(
      create: (ctx) => ArticleProvider(
        context,
        temperature: widget.temperature,
        unit: widget.unit,
      )..init(),
      child: const _ArticleScreenMain(),
    );
  }
}

///
class _ArticleScreenMain extends StatefulWidget {
  const _ArticleScreenMain();

  @override
  State<_ArticleScreenMain> createState() => _ArticleScreenMainState();
}

class _ArticleScreenMainState extends State<_ArticleScreenMain> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ArticleProvider>().initWidget();
    });
  }


  String get title{
  var category =  context.read<ArticleProvider>().settingDetail.category;
  return category == null ? '': ' (${capitalize(category)})';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Articles$title'),
        elevation: 0,
        forceMaterialTransparency: true,
      ),
      body: Consumer<ArticleProvider>(
        builder: (_, articleData, child) {
          return ProcessWidget(
            processStatus: articleData.progressState,
            failure: articleData.failure,
            child: NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification notification) {
                if (notification is ScrollEndNotification &&
                    notification.metrics.extentAfter == 0) {
                  context.read<ArticleProvider>().getNewsPagination();
                }
                return context.read<ArticleProvider>().cancelPagination;
              },
              child: ListView.builder(
                itemCount: articleData.headlines.length,
                itemBuilder: (_, i) {
                  final item = articleData.headlines[i];
                  return _ArticleTile(headline: item);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class _ArticleTile extends StatelessWidget {
  const _ArticleTile({required this.headline});

  final NewsHeadline headline;

  @override
  Widget build(BuildContext context) {
    final Widget placeholder = Image.asset(
      ImageAsset.news,
      height: 200,
      width: double.infinity,
      fit: BoxFit.cover,
    );
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Card(
      child: InkWell(
        onTap: (){
          launchUrl(Uri.parse(headline.url));
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  headline.image ?? '',
                  errorBuilder: (_, __, ___) {
                    return placeholder;
                  },
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                headline.title,
                style: textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              if (headline.description != null)
                Text(
                  headline.description!,
                  style: textTheme.bodyLarge,
                ),
              if (headline.content != null)
                Text(
                  headline.content!,
                  style: textTheme.bodyLarge,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  runAlignment: WrapAlignment.spaceEvenly,
                  children: [
                    DateTimeWidget(
                      dateTime: headline.publishDate,
                      dateTimeFormat: DateTimeFormat.indDateFormat,
                      style: textTheme.titleMedium,
                    ),
                    if (headline.author.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(left: 2.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.person_4_sharp, size: 18),
                            Text(headline.author, style: textTheme.titleMedium),
                          ],
                        ),
                      )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
