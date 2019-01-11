module Getfeedback
  class SurveyResponse < Resource
    self.path = "/responses"
    attr_accessor :meta

    include Operations::All
    include Operations::Retrieve


    def self.array_from_data(json)
      json[:active_models]
    end
  end
end
