class Document < SmpaResource
  def self.download_url(id)
    URI.join(site, prefix, "documents/#{id}/download").to_s
  end

  def download_url
    self.class.download_url(id)
  end
end
