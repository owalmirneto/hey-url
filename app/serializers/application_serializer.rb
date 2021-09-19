# frozen_string_literal: true

class ApplicationSerializer < ActiveModel::Serializer
  def object
    ActiveDecorator::Decorator.instance.decorate(super)
  end
end
