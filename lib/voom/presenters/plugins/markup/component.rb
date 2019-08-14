require 'voom/presenters/dsl/components/event_base'

module Voom
  module Presenters
    module Plugins
      module Markup
        class Component < DSL::Components::Base
          attr_reader :document, :height

          def initialize(document, **attributes, &block)
            super(type: :markup, **attributes, &block)

            @document = document
            @height = @attributes.delete(:height)

            expand!
          end
        end
      end
    end
  end
end
