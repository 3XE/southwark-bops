# HACK: around crash caused by running `identify` on multiple microsoft office
# files in parallel
$mini_magick_mutex = Mutex.new

module MiniMagick
  class Image
    class <<self
      alias_method :read_orig, :read

      def read(stream, ext = nil)
        if /(doc|xls|ppt)/ =~ ext
          $mini_magick_mutex.synchronize { sleep(1); read_orig(stream, ext) }
        else
          read_orig(stream, ext)
        end
      end
    end
  end
end
