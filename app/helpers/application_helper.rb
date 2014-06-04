module ApplicationHelper

  # Generate error tag ID for the given model's field.
  def error_tag_id(model, field)
    "#{model.class.to_s.underscore}_#{field}_error"
  end
  
  # Obtain the error messages for the given model's field as a single string.
  def error_messages(model, field)    
    # Collect all error messages (currently not 
    messages = model.errors[field].collect do |message|
      field.to_s.humanize + " " + message
    end
    
    messages = messages.first(1) # Currently, only the first message is displayed.
    messages.join(', ')
  end

  # Generate <span> to contain the error message for the given model's field.
  def error_tag(model, field)    
    tag_id = error_tag_id(model, field)
    messages = error_messages(model, field)
    raw("<span id=\"#{tag_id}\" class=\"field_error\">#{messages}</span>")
  end
end
