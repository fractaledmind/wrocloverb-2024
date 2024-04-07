# frozen_string_literal: true

class Users::NewView < ApplicationView
  include Phlex::Rails::Helpers::FieldID
  include Phlex::Rails::Helpers::FormWith

  def initialize(user:)
    @user = user
  end

  def view_template
    h1(class: "absolute -top-4 py-px px-2 -mx-2 uppercase font-bold text-lg") do
      "Sign up"
    end

    form_with(model: @user, class: "contents") do |form|
      if @user.errors.any?
        div(class: "text-red-500 font-medium mb-8", role: "alert") do
          h2(class: "font-black text-sm uppercase tracking flex items-center") do
            plain I18n.t(
                    "errors.messages.not_saved",
                    count: @user.errors.count,
                    resource: @user.class.model_name.human.downcase
                  )
          end
          ul(class: "list-[square] list-inside pl-4 mt-2") do
            @user.errors.each { |error| li { error.full_message } }
          end
        end
      end

      div(class: "flex flex-col gap-2 w-1/2 mb-8") do
        form.label :screen_name
        form.text_field :screen_name
      end

      div(class: "flex flex-col gap-2 w-full mb-8") do
        form.label :about
        form.text_area :about, rows: 5
      end

      div(class: "flex flex-col gap-2 w-1/2 mb-8") do
        form.label :password
        form.password_field :password,
                            required: true,
                            autocomplete: "new-password",
                            aria: {
                              describedby: form.field_id(:password, :help)
                            }
        small(id: form.field_id(:password, :help)) { "8 characters minimum." }
      end

      div(class: "flex flex-col gap-2 w-1/2 mb-8") do
        form.label :password_confirmation
        form.password_field :password_confirmation,
                                  required: true,
                                  autocomplete: "new-password"
      end

      div(class: "inline-block") do
        form.submit class:
                      "border border-black text-black bg-white py-1 px-2 cursor-pointer hover:bg-black hover:text-white focus:outline-none focus:ring focus:ring-offset-2 focus:ring-blue-500"
      end
    end
  end
end