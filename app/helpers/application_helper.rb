module ApplicationHelper
    def error_message(model, attr)
        return if !model.errors[attr].any?

        content_tag(:span, model.errors[attr].first)
    end
end
