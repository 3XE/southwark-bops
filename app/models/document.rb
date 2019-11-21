require 'open-uri'
class Document < SmpaResource
  def self.file_stream(id)
    open(download_url(id), headers)
  end

  def self.download_url(id)
    URI.join(site, prefix, "documents/#{id}/download").to_s
  end

  def file_stream
    self.class.file_stream(id)
  end

  def download_url
    self.class.download_url(id)
  end
end
