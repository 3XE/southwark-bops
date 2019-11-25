class Documents::ThumbnailsController < ApplicationController
  def show
    @document = Document.find(params[:document_id])

    @blob = $cache.fetch("/documents/#{params[:document_id]}/thumbnail.png") do
      image = MiniMagick::Image.open(
        @document.download_url,
        File.extname(@document.original_name),
        SmpaResource.headers
      )

      image.resize "128x128"
      image.format "png"
      image.to_blob
    end

    send_data @blob, filename: "#{@document.id}_thumbnail.png"
  end
end
