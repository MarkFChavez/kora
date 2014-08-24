module GlobalHelper
  def error_messages_for model
    if model.errors.any?
      content_tag :div, class: "alert alert-danger" do
        result = content_tag :span, "#{pluralize(model.errors.count, "error")} found:", class: "lead"
        list = content_tag :ul do
          model.errors.full_messages.collect do |error|
            content_tag :li, error
          end.join.html_safe
        end

        (result + list).html_safe
      end
    end
  end
end
