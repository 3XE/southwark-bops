class DocumentsController < ApplicationController
  def show
    @document = Document.find(params[:id])

    # pipe the file data as we read it from the API
    uri = URI.parse(@document.download_url)
    Net::HTTP.start(uri.host, uri.port, use_ssl: true) do |http|
      request = Net::HTTP::Get.new(uri)

      # use same headers as an SmpaResource
      SmpaResource.headers.each {|k, v| request[k] = v }

      http.request(request) do |response|
        headers["Content-Type"]   = response["Content-Type"]
        headers["Content-Disposition"] = "attachment; filename=#{@document.original_name.inspect}"
        self.response_body = response.read_body
      end
    end
  end
end
