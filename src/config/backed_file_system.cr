require "baked_file_system_mounter"

BakedFileSystemMounter.assemble from: "src/assets", to: "public"
BakedFileSystemStorage.mount
