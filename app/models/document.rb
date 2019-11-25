class Document < SmpaResource
  has_many :document_types_existing, class_name: "Document::Type"
  has_many :document_types_proposed, class_name: "Document::Type"

  def self.download_url(id)
    URI.join(site, prefix, "documents/#{id}/download").to_s
  end

  def download_url
    self.class.download_url(id)
  end
end
