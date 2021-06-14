require_relative 'markup/component'

module Coprl
  module Presenters
    module Plugins
      module Markup
        module DSLComponents
          def markup(document, **attributes, &block)
            self << Markup::Component.new(document, parent: self, **attributes, &block)
          end
        end

        module WebClientComponents
          def view_dir_markup(pom)
            File.join(__dir__, '../../../..', 'views', 'components')
          end

          def render_markup(comp, render:, components:, index:)
            render.call(:erb, :markup,
                        views: view_dir_markup(comp),
                        locals: { comp: comp, components: components, index: index })
          end

          def render_header_markup(pom, render:)
            render.call(:erb, :markup_header, views: view_dir_markup(pom))
          end
        end
      end
    end
  end
end
