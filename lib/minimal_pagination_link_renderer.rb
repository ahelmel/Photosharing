class MinimalPaginationLinkRenderer < WillPaginate::ViewHelpers::LinkRenderer

  def container_attributes
    super.except(:first_label, :last_label)
  end

  protected
    
    def page_number(page)
      page_title = ((page>9)? page: ["0", page])
    
      if page == current_page
         tag(:em, page_title)
      elsif current_page == 1
      	if page == (current_page + 1) || page == (current_page + 2)
      	  link(page_title, page, :rel => rel_value(page))
      	end 
      elsif current_page == total_pages
      	if page == (current_page - 1) || page == (current_page - 2)
      	  link(page_title, page, :rel => rel_value(page))
      	end 
      else
      	if page == (current_page - 1) || page == (current_page + 1)
      	  link(page_title, page, :rel => rel_value(page))
      	end 
      end
    end
    
    def gap

    end

    def first_page
      previous_or_next_page(current_page == 1 ? nil : 1, @options[:first_label], "first_page")
    end

    def last_page
      previous_or_next_page(current_page == total_pages ? nil : total_pages, @options[:last_label], "last_page")
    end

end
