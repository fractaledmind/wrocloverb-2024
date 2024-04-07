class Sessions::Session < ApplicationComponent
  include Phlex::Rails::Helpers::ButtonTo
  include Phlex::Rails::Helpers::DOMID
  include Phlex::Rails::Helpers::TimeTag

  def initialize(session:)
    @session = session
  end

  def view_template
    li(id: dom_id(@session), class: "") do
      div(class: "flex justify-between items-center") do
        div(class: "flex flex-col gap-1") do
          div(class: "whitespace-nowrap") do
            span { @session.browser.platform.id.to_s.capitalize }
            whitespace
            span { @session.browser.id.to_s.capitalize }
            whitespace
            span { @session.browser.full_version }
            whitespace
            if @session == Current.session
              small(
                class: "border border-green-500 text-green-600 px-1 py-px"
              ) { "active" }
            end
          end
          div(class: "ml-4 text-sm") do
            time_tag @session.created_at,
                     @session.created_at.to_formatted_s(:long)
          end
        end
        button_to "Revoke",
                  @session,
                  method: :delete,
                  class:
                    "border border-red-500 text-red-500 bg-white py-1 px-2 cursor-pointer hover:bg-red-500 hover:text-white focus:outline-none focus:ring focus:ring-offset-2 focus:ring-blue-500"
      end
    end
  end
end