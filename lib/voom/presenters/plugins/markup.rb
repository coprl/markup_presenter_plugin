require_relative 'markup/component'

module Voom
  module Presenters
    module Plugins
      module Markup
        module DSLComponents
          def markup(document, **attributes, &block)
            self << Markup::Component.new(document, parent: self, **attributes, &block)
          end
        end

        module WebClientComponents
          def render_markup(comp, render:, components:, index:)
            view_dir = File.join(__dir__, 'markup')

            render.call(:erb, :markup,
                        views: view_dir,
                        locals: { comp: comp, components: components, index: index })
          end

          def render_header_markup(_pom, render:)
            view_dir = File.join(__dir__, 'markup')

            render.call(:erb, :markup_header, views: view_dir)
          end
        end
      end
    end
  end
end
