part of flutter_mentions;

class OptionList extends StatelessWidget {
  OptionList({
    required this.data,
    required this.onTap,
    required this.suggestionListHeight,
    this.suggestionBuilder,
    this.separatorBuilder,
    this.suggestionListMargin = EdgeInsets.zero,
    this.suggestionListDecoration,
  });

  final Widget Function(Map<String, dynamic>)? suggestionBuilder;

  final List<Map<String, dynamic>> data;

  final Function(Map<String, dynamic>) onTap;

  final double suggestionListHeight;

  final BoxDecoration? suggestionListDecoration;

  final EdgeInsets suggestionListMargin;

  final IndexedWidgetBuilder? separatorBuilder;

  @override
  Widget build(BuildContext context) {
    return data.isNotEmpty
        ? Container(
            decoration:
                suggestionListDecoration ?? BoxDecoration(color: Colors.white),
            constraints: BoxConstraints(
              maxHeight: suggestionListHeight,
              minHeight: 0,
            ),
            margin: suggestionListMargin,
            child: ListView.separated(
              itemCount: data.length,
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              separatorBuilder: separatorBuilder ??
                  (context, index) => const SizedBox.shrink(),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () => onTap(data[index]),
                child: suggestionBuilder != null
                    ? suggestionBuilder!(data[index])
                    : Container(
                        color: Colors.blue,
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          data[index]['display'],
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
              ),
            ),
          )
        : Container();
  }
}
