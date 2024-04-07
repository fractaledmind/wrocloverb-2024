# frozen_string_literal: true

class Users::ShowView < ApplicationView
  include Phlex::Rails::Helpers::ButtonTo
  include Phlex::Rails::Helpers::LinkTo
  include Phlex::Rails::Helpers::SimpleFormat
  include Phlex::Rails::Helpers::TimeAgoInWords
  include Phlex::Rails::Helpers::TimeTag

  def initialize(user:)
    @user = user
  end

  def view_template
    h1(class: "absolute -top-4 py-px px-2 -mx-2 uppercase font-bold text-lg") do
      plain @user.screen_name
    end

    if @user == Current.user
      div(class: "flex items-center gap-2") do
        link_to "Edit profile",
                edit_user_path(@user),
                class:
                  "border border-black text-black bg-white py-1 px-2 cursor-pointer hover:bg-black hover:text-white focus:outline-none focus:ring focus:ring-offset-2 focus:ring-blue-500"
        button_to "Delete profile",
                  @user,
                  method: :delete,
                  class:
                    "border border-red-500 text-red-500 bg-white py-1 px-2 cursor-pointer hover:bg-red-500 hover:text-white focus:outline-none focus:ring focus:ring-offset-2 focus:ring-blue-500"
      end

      br
    end

    dl(class: "grid grid-cols-[fit-content(100%)_1fr] gap-x-2") do
      dt { "user:" }
      dd { plain @user.screen_name }
      dt { "created:" }
      dd do
        if @user == Current.user
          time_tag @user.created_at,
                   @user.created_at.to_date.to_formatted_s(:long)
        else
          plain time_ago_in_words(@user.created_at)
          plain " ago "
        end
      end
      dt { "about:" }
      dd(class: "prose text-black") { simple_format @user.about }
    end

    br

    div(class: "space-y-1.5") do
      details(open: true) do
        summary(class:"cursor-pointer focus:outline-none focus-visible:ring ring-offset-2 ring-blue-500") do
          strong { "Posts: " }
          plain @user.posts.size
        end
        ul(class: "list-none space-y-4") do
          @user
            .posts
            .order(created_at: :desc)
            .each { |post| li { render Posts::Post.new(post:) } }
        end
      end
      details do
        summary(class:"cursor-pointer focus:outline-none focus-visible:ring ring-offset-2 ring-blue-500") do
          strong { "Comments: " }
          plain @user.comments.size
        end
        ul(class: "list-none space-y-4") do
          @user
            .comments
            .order(created_at: :desc)
            .each { |comment| li { render Comments::Comment.new(comment:) } }
        end
      end
      if @user == Current.user
        details do
          summary(class:"cursor-pointer focus:outline-none focus-visible:ring ring-offset-2 ring-blue-500") do
            strong { "Sessions: " }
            plain @user.sessions.size
          end
          ul(class: "list-[square] list-inside space-y-4 pl-6") do
            @user.sessions.order(created_at: :desc).each { |session| render session }
          end
        end
      end
    end
  end
end