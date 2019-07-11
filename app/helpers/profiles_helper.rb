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
      @title =  child.split('_').join(' ').capitalize

      # exceptions
      if parent == "work_experience"
        if child == "company" then @title = "Company Name" end
        if child == "start_date" then @title = "Start Date" end
        if child == "end_date" then @title ="End Date" end
      elsif parent == "project_experience"
        if child == "name" then @title = "Project Name" end
        if child == "link" then @title = "Project Link" end
      elsif parent == "education_background"
        if child == "graduation_date" then @title = "Graduation Date" end
      end

      result += '<em>' + @title + '&nbsp</em>' + text_field_tag(parent + '[0][' + child + ']')
    end

    case parent
    when "skills" then @k = "0"
    when "work_experience" then @k = "1"
    when "education_background" then @k = "2"
    when "project_experience" then @k = "3"
    else @k = 10
    end
    result += '<button type="button" onclick="remove_field(' + @k + ',0)" >&#10006</button>'

    return result += '<br><br>'

  end

  def load_skills
    return File.read('app/assets/javascripts/skills.coffee').gsub!("index", "0").slice(11..-3)
  end

  def load_work_experience
    return File.read('app/assets/javascripts/work_experience.coffee').gsub!("index", "0").slice(20..-3)
  end

  def load_education_background
    return File.read('app/assets/javascripts/education_background.coffee').gsub!("index", "0").slice(25..-3)
  end

  def load_project_experience
    return File.read('app/assets/javascripts/project_experience.coffee').gsub!("index", "0").slice(23..-3)
  end
end
