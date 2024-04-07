# frozen_string_literal: true

class Posts::NewView < ApplicationView
  include Phlex::Rails::Helpers::LinkTo
  include Phlex::Rails::Helpers::Routes

  def initialize(post:)
    @post = post
  end

  def view_template
    h1(class: "absolute -top-4 py-px px-2 -mx-2 uppercase font-bold text-lg") do
      "New post"
    end

    link_to "← Back to posts",
            posts_path,
            class:
              "absolute -top-4 right-4 py-px px-2 -mx-2 border-2 border-transparent hover:border-black focus:outline-none focus:ring focus:ring-offset-0 focus:ring-blue-500"

    render Posts::Form.new(
      post: @post
    )
  end
end