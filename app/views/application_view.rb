# frozen_string_literal: true

class ApplicationView < ApplicationComponent
  def around_template
    render ApplicationLayout do
      super
    end
  end
end
