# frozen_string_literal: true

class ApplicationQuery < ::Interage::ApplicationQuery
  delegate :find_by!, to: :relation
end
