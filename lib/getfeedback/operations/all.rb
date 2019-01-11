module Getfeedback
  module Operations
    module All
      def self.included(klass)
        klass.extend(ClassMethods)
      end

      module ClassMethods
        def all(opts = {}, client = Getfeedback.shared_client)
          opts = Utils.serialize_values(opts)
          json = client.get_json(path, opts)
          EnumerableResourceCollection.new(array_from_data(json).map { |attributes| new(attributes) })
        end

        def array_from_data(json)
          json
        end
      end
    end
  end
end
