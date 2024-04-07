# frozen_string_literal: true

class Sessions::NewView < ApplicationView
  def initialize(session:)
    @session = session
  end

  def view_template
    h1(class: "absolute -top-4 py-px px-2 -mx-2 uppercase font-bold text-lg") do
      "Sign in"
    end

    render Sessions::Form.new(
      session: @session
    )
  end
end
