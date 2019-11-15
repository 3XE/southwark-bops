module ApplicationsHelper
  def application_address(application)
    sanitize([
      application.site_address&.address_line_1&.titleize,
      application.site_address&.address_line_2&.titleize,
      application.site_address&.address_line_3&.titleize,
      application.site_address&.postcode,
    ].select(&:present?).join(", "))
  end
end
