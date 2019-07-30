class TemplatesController < ApplicationController
  before_action :admin_only

  layout "template"

  def index
    @templates = Template.all
  end

  def show
    @template = Template.find(params[:id])
    @profile = Profile.find_by(name:"Example Name")
  end

  def new
    @template = Template.new
  end

  def create
    @template = Template.new(template_params)

    if @template.save

      # create partial for template content.
      template_partial = File.open('app/views/templates/source/_' + @template.name + '.html.slim', 'w')
      template_partial.puts(Template.find_by(name:'default').content.gsub(/default/, @template.name))
      template_partial.close
      
      # create scss for template style.
      template_scss = File.open('app/assets/stylesheets/template_styles/' + @template.name + '.scss', 'w')
      template_scss.puts('#template_' + @template.name + " {\n\n}")
      template_scss.close

      redirect_to edit_template_path(@template)
      return
    else
      flash[:alert] = @template.errors.full_messages
      redirect_to templates_path
    end
  end

  def edit
    @template = Template.find(params[:id])
    @profile = Profile.find_by(name:"Example Name")

    # load template content.
    file_name = 'app/views/templates/source/_' + @template.name + '.html.slim'
    if !File.exist?(file_name)
      flash[:alert] = "Database have template record but cant find corresponding partial file, thus create a new one."
      File.open(file_name, 'w') { |file| file.puts Template.find_by(name:'default').content.gsub(/default/, @template.name) }
    else
      @template.content = File.read(file_name)
    end

    # load template style.
    file_name = 'app/assets/stylesheets/template_styles/' + @template.name + '.scss'
    if !File.exist?(file_name)
      flash[:alert] = "Database have template record but cant find corresponding scss file, thus create a new one."
      File.open(file_name, 'w') { |file| file.puts '#template_' + @template.name + " {\n\n}" }
    else
      @template.style = File.read(file_name)
    end
  end

  def update
    @template = Template.find(params[:id])
    @profile = Profile.find_by(name:"Example Name")

    if @template.update_attributes(template_params)

      # update template content.
      template_partial = File.open('app/views/templates/source/_' + @template.name + '.html.slim', 'w')
      template_partial.puts(@template.content)
      template_partial.close

      # update template style.
      template_scss = File.open('app/assets/stylesheets/template_styles/' + @template.name + '.scss', 'w')
      template_scss.puts(@template.style)
      template_scss.close

      if params[:save].nil?
        render :edit
      else
        render :show
      end
    else
      render :edit
    end
  end

  def destroy
    @template = Template.find(params[:id])
    if !@template.nil?
      
      flash[:notice] = ''
      flash[:alert] = ''

      # remove template content
      file_name = 'app/views/templates/source/_' + @template.name + '.html.slim'
      if File.exist?(file_name)
        File.delete(file_name)
        flash[:notice] += "Deleted " + file_name
      else
        flash[:alert] += "Database have template record but cant find corresponding partial file."
      end

      # remove template style
      file_name = 'app/assets/stylesheets/template_styles/' + @template.name + '.scss'
      if File.exist?(file_name)
        File.delete(file_name)
        flash[:notice] += " Deleted " + file_name
      else
        flash[:alert] += " Database have template record but cant find corresponding scss file."
      end

      @template.destroy
      redirect_to templates_path
    else
      flash[:alert] = "Database do not have the template record."
      redirect_to templates_path
    end
  end

  private

  def template_params
    params.require(:template).permit(:name, :content, :style)
  end

  def admin_only
    if !user_signed_in? || !current_user.admin?
      flash[:alert] = "You don't have permission to view this page."
      redirect_to root_path
      return
    end
  end
end
