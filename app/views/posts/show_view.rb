# frozen_string_literal: true

class Posts::ShowView < ApplicationView
  include Phlex::Rails::Helpers::ButtonTo
  include Phlex::Rails::Helpers::ControllerName
  include Phlex::Rails::Helpers::LinkTo
  include Phlex::Rails::Helpers::Pluralize
  include Phlex::Rails::Helpers::SimpleFormat
  include Phlex::Rails::Helpers::TimeAgoInWords
  include Phlex::Rails::Helpers::URLFor

  def initialize(post:)
    @post = post
  end

  def view_template
    h1(class: "absolute -top-4 py-px px-2 -mx-2 uppercase font-bold text-lg") do
      plain @post.title
    end

    link_to "← Back to posts".html_safe,
            posts_path,
            class:
              "absolute -top-4 right-4 py-px px-2 -mx-2 border-2 border-transparent hover:border-black focus:outline-none focus:ring focus:ring-offset-0 focus:ring-blue-500"

    small(class:"absolute top-4 text-sm font-normal inline-flex items-baseline justify-between") do
      span do
        if controller_name == "posts"
          plain " by "
          if @post.user == Current.user
            plain " you "
          else
            link_to @post.user.screen_name,
                    user_path(@post.user),
                    class: "hover:underline focus:outline-none focus:ring focus:ring-offset-2 focus:ring-blue-500"
          end
          span { "·" }
        end
        time_ago_in_words(@post.created_at)
        plain " ago "
        span { "·" }
        link_to pluralize(@post.comments_count, "comment"),
                url_for(anchor: :comments),
                class: "hover:underline focus:outline-none focus:ring focus:ring-offset-2 focus:ring-blue-500"
      end
    end

    div(class: "mt-8 prose max-w-none text-black") do
      simple_format @post.description
    end

    if @post.user == Current.user
      br

      div(class: "flex items-center gap-2") do
        link_to "Edit",
                edit_post_path(@post),
                class:
                  "border border-black text-black bg-white py-1 px-2 cursor-pointer hover:bg-black hover:text-white focus:outline-none focus:ring focus:ring-offset-2 focus:ring-blue-500"
        button_to "Destroy",
                  @post,
                  method: :delete,
                  class:
                    "border border-red-500 text-red-500 bg-white py-1 px-2 cursor-pointer hover:bg-red-500 hover:text-white focus:outline-none focus:ring focus:ring-offset-2 focus:ring-blue-500"
      end
    end

    br
    hr(class: "border-black border")
    br

    render "comments/form", comment: @post.comments.new if Current.user.present?

    if @post.comments.exists?
      br

      div(id: "comments", class: "space-y-4") do
        render @post.comments.order(created_at: :desc)
      end
    end
  end
end