locals {
  sanitized_artifact_dir = replace(replace(var.artifact_dir, "\\.\\.", ""), "^/+", "")
  artifact_subdir        = var.isRootModule ? local.sanitized_artifact_dir : "../../${local.sanitized_artifact_dir}"
  archive_file           = "${local.artifact_subdir}/${var.archive_filename}"

}
