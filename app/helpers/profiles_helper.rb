module ProfilesHelper
  # Generate first line of html text input
  # Both parent and child are string, function will generate a string
  def first_input(parent, child)
    return '<em>' + child + '&nbsp</em>' + text_field_tag(parent + '[0][' + child + ']')
  end

  #Generate first line of html text input
  # Parent is string and child is array of strings
  def first_inputs(parent, childs = [])
    result = ''
    childs.each do |child|
      if parent == "project_experience"
        if child == "name" then @title = "Project Name" end
        if child == "link" then @title = "Project Link" end
      elsif parent == "education_background" && child == "graduation_date"
        @title = "Graduation Date"
      else
        @title =  child.split('_').join(' ').capitalize
      end

      result += '<em>' + @title + '&nbsp</em>' + text_field_tag(parent + '[0][' + child + ']')
    end
    return result += '<br><br>'

  end
end
