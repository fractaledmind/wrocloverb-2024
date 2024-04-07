class Comments::Comment < ApplicationView
  include Phlex::Rails::Helpers::ButtonTo
  include Phlex::Rails::Helpers::ControllerName
  include Phlex::Rails::Helpers::DOMID
  include Phlex::Rails::Helpers::LinkTo
  include Phlex::Rails::Helpers::TimeAgoInWords

  def initialize(comment:)
    @comment = comment
  end

  def view_template
    details(id: (dom_id @comment), class: "px-2", open: true) do
      summary(class:"cursor-pointer px-1 text-sm focus:outline-none focus-visible:ring ring-offset-2 ring-blue-500") do
        div(class:"inline-flex w-[calc(100%_-_1.676em)] items-baseline justify-between") do
          span do
            if controller_name == "users"
              span do
                plain "on "
                link_to @comment.post.title,
                        @comment.post,
                        class: "hover:underline focus:outline-none focus:ring focus:ring-offset-2 focus:ring-blue-500"
              end
            elsif controller_name == "posts"
              span do
                plain "by "
                link_to @comment.user.screen_name,
                        @comment.user,
                        class: "hover:underline focus:outline-none focus:ring focus:ring-offset-2 focus:ring-blue-500"
              end
            end
            span { "·" }
            plain time_ago_in_words(@comment.created_at)
            plain " ago "
          end
          div(class: "flex justify-end gap-2") do
            if @comment.user == Current.user
              link_to "Edit",
                      edit_comment_path(@comment),
                      class:
                        "border border-black text-black bg-white py-1 px-2 cursor-pointer hover:bg-black hover:text-white focus:outline-none focus:ring focus:ring-offset-2 focus:ring-blue-500"
              button_to "Destroy",
                        @comment,
                        method: :delete,
                        class:
                          "border border-red-500 text-red-500 bg-white py-1 px-2 cursor-pointer hover:bg-red-500 hover:text-white focus:outline-none focus:ring focus:ring-offset-2 focus:ring-blue-500"
            end
          end
        end
      end
      plain @comment.body
    end
  end
end