require "baked_file_system_mounter"

BakedFileSystemMounter.assemble(["public", "db"])

if APP_ENV == "production"
  STDERR.puts "Mounting from baked file system ..."
  BakedFileSystemStorage.mount
end
