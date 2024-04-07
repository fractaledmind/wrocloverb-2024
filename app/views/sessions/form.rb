class Sessions::Form < ApplicationView
  include Phlex::Rails::Helpers::FieldsFor
  include Phlex::Rails::Helpers::FormWith

  def initialize(session:)
    @session = session
  end

  def template
    form_with(model: @session, class: "contents") do |form|
      if @session.errors.any?
        div(class: "text-red-500 font-medium mb-8", role: "alert") do
          h2(class: "font-black text-sm uppercase tracking flex items-center") do
            plain I18n.t(
                    "errors.messages.not_saved",
                    count: @session.errors.count,
                    resource: @session.class.model_name.human.downcase
                  )
          end
          ul(class: "list-[square] list-inside pl-4 mt-2") do
            @session.errors.each { |error| li { error.full_message } }
          end
        end
      end

      form.fields_for :user do |fields|
        div(class: "flex flex-col gap-2 w-1/2 mb-8") do
          fields.label :screen_name
          fields.text_field :screen_name
        end

        div(class: "flex flex-col gap-2 w-1/2 mb-8") do
          fields.label :password
          fields.password_field :password,
                                required: true,
                                autocomplete: "current-password"
        end
      end

      div(class: "inline-block") do
        form.submit class:
                      "border border-black text-black bg-white py-1 px-2 cursor-pointer hover:bg-black hover:text-white focus:outline-none focus:ring focus:ring-offset-2 focus:ring-blue-500"
      end
    end
  end
end