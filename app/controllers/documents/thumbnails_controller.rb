class Documents::ThumbnailsController < ApplicationController
  def show
    @document = Document.find(params[:document_id])

    image = MiniMagick::Image.open(
      @document.download_url,
      File.extname(@document.original_name),
      SmpaResource.headers
    )

    image.resize "128x128"
    image.format "png"
    send_file image.path, filename: "#{@document.id}.png"
  end
end
