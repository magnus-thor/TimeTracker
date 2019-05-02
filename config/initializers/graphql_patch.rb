# frozen_string_literal: true

module GraphQL
  class Query
    class Arguments
      def to_params
        ActionController::Parameters.new(to_h).permit(*to_h.keys).except(:id)
      end
    end
  end
end
