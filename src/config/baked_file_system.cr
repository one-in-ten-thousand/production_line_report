require "baked_file_system_mounter"

BakedFileSystemMounter.assemble(
  {
    "src/assets" => "public",
    "db" => "db"
  }
)
BakedFileSystemStorage.mount
