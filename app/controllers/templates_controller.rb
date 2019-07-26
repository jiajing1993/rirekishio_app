class TemplatesController < ApplicationController
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
  end

  def update
    @template = Template.find(params[:id])
  end

  def destroy
  end

  private

  def template_params
    params.require(:template).permit(:name, :content)
  end
end
