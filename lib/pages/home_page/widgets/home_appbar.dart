import 'package:flutter/material.dart';
import '../../../controllers/note_controller.dart';
import '../../../core/app_colors.dart';

class HomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
    required this.controller,
  });

  final NoteController controller;

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(100);
}

class _HomeAppBarState extends State<HomeAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'NoteBook',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: TextFormField(
            controller: widget.controller.searchController,
            onChanged: (value) {
              widget.controller.updateSearchQuery(value);
              setState(() {});
            },
            onTapOutside: (event) =>
                FocusManager.instance.primaryFocus!.unfocus(),
            decoration: InputDecoration(
              hintText: 'Search notes',
              prefixIcon: const Icon(Icons.search),
              suffixIcon: widget.controller.searchController.text.isNotEmpty
                  ? IconButton(
                      onPressed: () {
                        widget.controller.clearSearchQuery();
                        setState(() {});
                      },
                      icon: const Icon(Icons.clear),
                    )
                  : const SizedBox.shrink(),
              filled: true,
              fillColor: blackColor.withOpacity(0.15),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
