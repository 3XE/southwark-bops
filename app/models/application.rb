class Application < SmpaResource
  class SiteConstraints < SmpaResource
    def conservation_area?
      0 < nb_conarea.to_i
    end

    def listed_building?
      0 < is_listed_building.to_i
    end
  end

  # FIXME: this should be fixed on the API. Also the data is not great.
  def proposalFlow_hash
    JSON.parse(proposalFlow) if proposalFlow.present?
  end
end
