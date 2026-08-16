import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/core/constants/app_colors.dart';

class FileItemCard extends StatelessWidget {
  final String title;
  final VoidCallback onDownload;
  final VoidCallback onDelete;

  const FileItemCard({
    super.key,
    required this.title,
    required this.onDownload,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border, width: 1.2),
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: AppColors.cardBorder, width: 1.2),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.description_outlined,
                  color: AppColors.surfaceDark,
                  size: 22,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: AppColors.cardTitleGrey,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                InkWell(
                  onTap: onDownload,
                  customBorder: const CircleBorder(),
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.fromBorderSide(
                        BorderSide(color: AppColors.downloadBlue, width: 1.4),
                      ),
                    ),
                    child: const Icon(
                      Icons.arrow_downward,
                      color: AppColors.downloadBlue,
                      size: 16,
                    ),
                  ),
                ),
                const SizedBox(width: 14),
                InkWell(
                  onTap: onDelete,
                  customBorder: const CircleBorder(),
                  child: const Icon(
                    Icons.delete_outline,
                    color: AppColors.deleteRed,
                    size: 24,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}