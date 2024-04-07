# frozen_string_literal: true

class Comments::EditView < ApplicationView
  include Phlex::Rails::Helpers::LinkTo
  include Phlex::Rails::Helpers::Routes

  def initialize(comment:)
    @comment = comment
  end

  def view_template
    h1(class: "absolute -top-4 py-px px-2 -mx-2 uppercase font-bold text-lg") do
      "Editing comment"
    end

    link_to "← Back to post",
            @comment.post,
            class:
              "absolute -top-4 right-4 py-px px-2 -mx-2 border-2 border-transparent hover:border-black focus:outline-none focus:ring focus:ring-offset-0 focus:ring-blue-500"

    render Comments::Form.new(
      comment: @comment
    )
  end
end