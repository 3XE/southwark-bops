class DocumentsController < ApplicationController
  def show
    @document = Document.find(params[:id])
    send_file(@document.file_stream, filename: @document.original_name)
  end
end
