# frozen_string_literal: true

class Posts::EditView < ApplicationView
  include Phlex::Rails::Helpers::LinkTo
  include Phlex::Rails::Helpers::Routes

  def initialize(post:)
    @post = post
  end

  def view_template
    h1(class: "absolute -top-4 py-px px-2 -mx-2 uppercase font-bold text-lg") do
      "Editing post"
    end

    link_to "← Back to posts",
            posts_path,
            class:
              "absolute -top-4 right-4 py-px px-2 -mx-2 border-2 border-transparent hover:border-black focus:outline-none focus:ring focus:ring-offset-0 focus:ring-blue-500"

    render Posts::Form.new(
      post: @post
    )

    div(class: "inline-block ml-2") do
      link_to "Show this post",
              @post,
              class:
                "inline-block border border-transparent text-black bg-white py-1 px-2 cursor-pointer hover:border-black focus:outline-none focus:ring focus:ring-offset-2 focus:ring-blue-500"
    end
  end
end