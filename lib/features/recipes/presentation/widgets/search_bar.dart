import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/recipes_bloc.dart';
import '../../logic/recipes_event.dart';
import '../../../../shared/widgets/forms/custom_text_field.dart';

/// Search bar widget
/// Provides search functionality for recipes
class RecipeSearchBar extends StatefulWidget {
  final String? initialValue;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onClear;

  const RecipeSearchBar({
    super.key,
    this.initialValue,
    this.onChanged,
    this.onClear,
  });

  @override
  State<RecipeSearchBar> createState() => _RecipeSearchBarState();
}

class _RecipeSearchBarState extends State<RecipeSearchBar> {
  late TextEditingController _controller;
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue ?? '');
    _hasText = widget.initialValue?.isNotEmpty ?? false;
    
    _controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    final hasText = _controller.text.isNotEmpty;
    if (_hasText != hasText) {
      setState(() {
        _hasText = hasText;
      });
      
      if (hasText) {
        widget.onChanged?.call(_controller.text);
      } else {
        // Clear search when text is empty
        widget.onChanged?.call('');
        widget.onClear?.call();
      }
    } else {
      widget.onChanged?.call(_controller.text);
    }
  }

  void _onClear() {
    _controller.clear();
    setState(() {
      _hasText = false;
    });
    widget.onClear?.call();
    widget.onChanged?.call('');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
        ),
      ),
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          hintText: 'Search recipes...',
          prefixIcon: Icon(
            Icons.search,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
          ),
          suffixIcon: _hasText
              ? IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: _onClear,
                  iconSize: 20,
                )
              : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
          ),
        ),
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
