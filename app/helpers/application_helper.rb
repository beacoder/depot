module ApplicationHelper

  # [61] update: add helper function to hide div element on condition
  def hidden_div_if(condition, attributes = {}, &block)
    if condition
      attributes["style"] = "display: none"
    end
    content_tag("div", attributes, &block) end
end
