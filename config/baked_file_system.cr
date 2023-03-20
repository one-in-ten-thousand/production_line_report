BakedFileSystemMounter.assemble(["public", "db"])

if LuckyEnv.production?
  STDERR.puts "Mounting from baked file system ..."
  BakedFileSystemStorage.mount
end
