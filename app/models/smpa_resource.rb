class SmpaResource < ActiveResource::Base
  self.site = "https://smpaapi.hactar.is/api/v1"
  self.headers['Authorization'] = "jwt #{ENV['SMPA_API_KEY']}"
  self.include_format_in_path = false
end
