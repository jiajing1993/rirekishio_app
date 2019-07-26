class TemplatesController < ApplicationController
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

      # Create partial template
      template_partial = File.open('app/views/templates/source/_' + @template.name + '.html.slim', 'w')
      template_partial.close

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

    file_name = 'app/views/templates/source/_' + @template.name + '.html.slim'
    if !File.exist?(file_name)
      flash[:alert] = "Database have template record but cant find corresponding partial file, thus create a new one."
      File.open(file_name, 'w').close
    else
      @template.content = File.read(file_name)
    end
  end

  def update
    @template = Template.find(params[:id])
    @profile = Profile.find_by(name:"Example Name")

    if @template.update_attributes(template_params)
      template_partial = File.open('app/views/templates/source/_' + @template.name + '.html.slim', 'w')
      template_partial.puts(@template.content)
      template_partial.close
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
    file_name = 'app/views/templates/source/_' + @template.name + '.html.slim'
    if !@template.nil?
      if File.exist?(file_name)
        File.delete(file_name)
        flash[:notice] = "Deleted " + file_name
      else
        flash[:alert] = "Database have template record but cant find corresponding partial file."
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
    params.require(:template).permit(:name, :content)
  end
end
