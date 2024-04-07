# frozen_string_literal: true

class ApplicationLayout < ApplicationComponent
  include Phlex::Rails::Layout
  include Phlex::Rails::Helpers::ContentFor
  include Phlex::Rails::Helpers::LinkTo
  include Phlex::Rails::Helpers::ButtonTo

  def view_template(&block)
    doctype

    html(class: "h-full") do
      head do
        title { content_for(:title) || "Lorem News" }
        meta(name: "viewport", content: "width=device-width,initial-scale=1")
        meta(name: "apple-mobile-web-app-capable", content: "yes")
        csrf_meta_tags
        csp_meta_tag
        yield :head
        link(rel: "manifest", href: "/manifest.json")
        link(rel: "icon", href: "/icon.png", type: "image/png")
        link(rel: "icon", href: "/icon.svg", type: "image/svg+xml")
        link(rel: "apple-touch-icon", href: "/icon.png")
        stylesheet_link_tag "application", "data-turbo-track": "reload"
        javascript_include_tag "application",
                                "data-turbo-track": "reload",
                                type: "module"
      end

      body(class: "h-full flex flex-col max-w-4xl mx-auto p-8 pb-0 font-mono") do
        header(class: "flex items-center justify-between text-lg mb-12") do
          h2 do
            a(
              href: "/",
              class:
                "bg-black text-white font-bold normal-case px-2 py-1 relative before:absolute before:inset-0 before:-z-10 before:transform before:bg-[radial-gradient(circle_at_center,#000_.05rem,transparent_0),radial-gradient(circle_at_center,#000_.05rem,transparent_0)] before:[background-size:.2rem_.2rem] before:[background-position:0_0,.1rem_.1rem] before:[background-color:initial] before:transition-transform before:ease-in before:duration-100 hover:before:translate-x-1 hover:before:translate-y-1 focus:outline-none focus:ring focus:ring-offset-2 focus:ring-blue-500"
            ) { " Lorem News " }
          end
          div(class: "inline-flex items-center gap-2") do
            if Current.user
              span(class: "inline-flex items-center") do
                svg(
                  class: "-ml-0.5 mr-1.5 h-2 w-2 text-green-400",
                  fill: "currentColor",
                  viewbox: "0 0 4 4"
                ) { |s| s.rect(width: "4", height: "4") }
                span do
                  link_to Current.user.screen_name_in_database,
                          Current.user,
                          class:
                            "hover:underline focus:outline-none focus:ring focus:ring-offset-2 focus:ring-blue-500"
                end
              end
              plain " | "
              button_to "Sign out",
                        Current.session,
                        method: :delete,
                        class:
                          "hover:underline focus:outline-none focus:ring focus:ring-offset-2 focus:ring-blue-500"
            else
              link_to "Sign in",
                      sign_in_path,
                      class:
                        "hover:underline focus:outline-none focus:ring focus:ring-offset-2 focus:ring-blue-500"
              plain " | "
              link_to "Sign up",
                      sign_up_path,
                      class:
                        "hover:underline focus:outline-none focus:ring focus:ring-offset-2 focus:ring-blue-500"
            end
          end
        end
        main(
          class:
            "border-2 border-black bg-white px-4 py-8 relative mb-4 before:absolute before:inset-0 before:-z-10 before:transform before:translate-x-2 before:translate-y-2 before:bg-[radial-gradient(circle_at_center,#000_.05rem,transparent_0),radial-gradient(circle_at_center,#000_.05rem,transparent_0)] before:[background-size:.2rem_.2rem] before:[background-position:0_0,.1rem_.1rem] before:[background-color:initial]"
        ) { yield }
        footer(class: "mt-auto text-sm text-center") do
          p(class: "py-4") do
            plain " Made with &heartsuit; by "
            a(
              href: "https://twitter.com/fractaledmind",
              class:
                "underline focus:outline-none focus:ring focus:ring-offset-2 focus:ring-blue-500"
            ) { "@fractaledmind" }
            plain " for "
            a(
              href: "https://wrocloverb.com",
              class:
                "underline focus:outline-none focus:ring focus:ring-offset-2 focus:ring-blue-500"
            ) { "wroclove.rb 2024" }
          end
        end
      end
    end
  end
end
