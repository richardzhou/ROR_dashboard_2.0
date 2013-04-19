module SessionsHelper
  def show_div_if(condition, attributes={}, &block)
    unless condition
      attributes[:style]="visibility:visible"
    end
    content_tag("div",attributes,&block)
  end
end
