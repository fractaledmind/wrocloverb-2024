# frozen_string_literal: true

class Posts::IndexView < ApplicationView
  include Phlex::Rails::Helpers::ButtonTo
  include Phlex::Rails::Helpers::LinkTo
  include Phlex::Rails::Helpers::Routes

  def initialize(posts:)
    @posts = posts
  end

  def view_template
    h1(class: "absolute -top-4 py-px px-2 -mx-2 uppercase font-bold text-lg") do
      "Recent posts"
    end

    link_to "+ New post",
            new_post_path,
            class:
              "absolute -top-4 right-4 py-px px-2 -mx-2 border-2 border-transparent hover:border-black focus:outline-none focus:ring focus:ring-offset-0 focus:ring-blue-500"

    div(id: "posts") do
      if @posts.any?
        table(class: "w-[calc(100%+2rem)] -mx-4 -mb-0") do
          tbody do
            @posts.each do |post|
              tr(class: "*:px-4 *:py-2") do
                td { render Posts::Post.new(post: post) }
                td(class: "flex justify-end gap-2") do
                  if post.user == Current.user
                    link_to "Edit",
                            edit_post_path(post),
                            class:
                              "border border-black text-black bg-white py-1 px-2 cursor-pointer hover:bg-black hover:text-white focus:outline-none focus:ring focus:ring-offset-2 focus:ring-blue-500"
                    button_to "Destroy",
                              post,
                              method: :delete,
                              class:
                                "border border-red-500 text-red-500 bg-white py-1 px-2 cursor-pointer hover:bg-red-500 hover:text-white focus:outline-none focus:ring focus:ring-offset-2 focus:ring-blue-500"
                  end
                end
              end
            end
          end
        end
      else
        div(class: "flex items-center justify-center gap-2") do
          span(class: "") { "No posts yet… Want to be the first?" }
        end
      end
    end
  end
end
