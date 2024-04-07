class Posts::Post < ApplicationView
  include Phlex::Rails::Helpers::ActionName
  include Phlex::Rails::Helpers::ControllerName
  include Phlex::Rails::Helpers::LinkTo
  include Phlex::Rails::Helpers::Pluralize
  include Phlex::Rails::Helpers::TimeAgoInWords

  def initialize(post:)
    @post = post
  end

  def view_template
    div do
      if controller_name == "posts" && action_name == "show"
        plain @post.title
      else
        link_to @post.title,
                @post,
                class: "hover:underline focus:outline-none focus:ring focus:ring-offset-2 focus:ring-blue-500"
      end
    end

    small(class: "text-sm font-normal inline-flex items-baseline justify-between") do
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
          whitespace
        end
        plain time_ago_in_words(@post.created_at)
        plain " ago "
        span { "·" }
        whitespace
        plain pluralize(@post.comments_count, "comment")
      end
    end
  end
end