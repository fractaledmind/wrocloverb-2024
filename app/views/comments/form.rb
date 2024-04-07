class Comments::Form < ApplicationView
  include Phlex::Rails::Helpers::FormWith

  def initialize(comment:)
    @comment = comment
    @post = comment.post
    @model = @comment.new_record? ? [@post, @comment] : @comment
  end

  def view_template
    form_with(model: @model) do |form|
      if @comment.errors.any?
        div(class: "text-red-500 font-medium mb-8", role: "alert") do
          h2(class: "font-black text-sm uppercase tracking flex items-center") do
            plain I18n.t(
                    "errors.messages.not_saved",
                    count: @comment.errors.count,
                    resource: @comment.class.model_name.human.downcase
                  )
          end
          ul(class: "list-[square] list-inside pl-4 mt-2") do
            @comment.errors.each { |error| li { error.full_message } }
          end
        end
      end

      div(class: "flex flex-col gap-2 w-1/2 mb-8") do
        plain form.label :body, class: "sr-only"
        plain form.text_area :body, rows: 3
      end

      div(class: "inline-block") do
        plain form.submit class:
                            "border border-black text-black bg-white py-1 px-2 cursor-pointer hover:bg-black hover:text-white focus:outline-none focus:ring focus:ring-offset-2 focus:ring-blue-500"
      end
    end
  end
end