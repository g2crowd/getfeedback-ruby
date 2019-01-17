module Getfeedback
  class SurveyResponse < Resource
    self.path = "/responses"
    attr_accessor :meta

    include Operations::All
    include Operations::Retrieve


    def self.array_from_data(json)
      json[:active_models]
    end

    def self.object_from_data(json)
      json[:response]
    end
  end
end
