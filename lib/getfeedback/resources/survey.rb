module Getfeedback
  class Survey < Resource
    self.path = "/surveys"
    attr_accessor :meta

    include Operations::All
    include Operations::Retrieve

    def self.array_from_data(json)
      json[:surveys]
    end
  end
end
