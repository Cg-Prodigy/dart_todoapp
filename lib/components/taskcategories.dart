import 'package:flutter/material.dart';
import 'package:todoapp/pages/finance.dart';
import 'package:todoapp/pages/health.dart';
import 'package:todoapp/pages/other.dart';
import 'package:todoapp/pages/personal.dart';
import 'package:todoapp/pages/study.dart';
import 'package:todoapp/pages/work.dart';
import 'package:todoapp/themes/utils.dart';

enum TaskCategory {
  work("Work", Icons.work_outline),
  study('Study', Icons.school_outlined),
  personal('Personal', Icons.person_outline),
  health('Health', Icons.favorite_border),
  finance('Finance', Icons.account_balance_wallet_outlined),
  other('Other', Icons.label_outline);

  const TaskCategory(this.label, this.icon);

  final String label;
  final IconData icon;

  Color color(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final status = Theme.of(context).extension<StatusColors>()!;
    return switch (this) {
      work => scheme.primary,
      study => scheme.tertiary,
      personal => status.info,
      health => status.success,
      finance => status.warning,
      other => scheme.outline,
    };
  }

  Color onColor(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final status = Theme.of(context).extension<StatusColors>()!;
    return switch (this) {
      work => scheme.onPrimary,
      study => scheme.onTertiary,
      personal => status.onInfo,
      health => status.onSuccess,
      finance => status.onWarning,
      other => scheme.surface,
    };
  }

  void openCategoryScreen(BuildContext context) {
    final screen = switch (this) {
      TaskCategory.work => const Work(),
      TaskCategory.study => Study(taskcategory: TaskCategory.study),
      TaskCategory.personal => const Personal(),
      TaskCategory.health => const Health(),
      TaskCategory.finance => const Finance(),
      TaskCategory.other => const Other(),
    };

    Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
  }
}

class CategoryCard extends StatefulWidget {
  final TaskCategory category;
  final bool isSelected;
  const CategoryCard({
    super.key,
    required this.category,
    this.isSelected = false,
  });

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    final color = widget.category.color(context);
    final oncolor = widget.category.onColor(context);
    final scheme = Theme.of(context).colorScheme;

    return Card(
      color: widget.isSelected ? color : scheme.surfaceContainer,
      clipBehavior: .antiAlias,
      margin: .zero,
      child: InkWell(
        onTap: () => widget.category.openCategoryScreen(context),
        child: SizedBox(
          width: 100,
          height: 100,
          child: Column(
            mainAxisAlignment: .center,
            children: [
              Icon(
                widget.category.icon,
                color: widget.isSelected ? oncolor : color,
              ),
              const SizedBox(height: 8),
              Text(
                widget.category.label,
                style: TextStyle(
                  color: widget.isSelected ? oncolor : scheme.onSurface,
                  fontWeight: .w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Taskcategories extends StatelessWidget {
  const Taskcategories({super.key});

  @override
  Widget build(BuildContext context) {
    const categories = TaskCategory.values;
    return SizedBox(
      height: 100,
      child: ListView.separated(
        itemBuilder: (context, index) {
          return CategoryCard(category: categories[index]);
        },
        separatorBuilder: (_, _) => const SizedBox(width: 10),
        itemCount: categories.length,
        scrollDirection: .horizontal,
      ),
    );
  }
}
