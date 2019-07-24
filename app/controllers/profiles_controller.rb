class ProfilesController < ApplicationController
  before_action :user_signed_in, only: :show
  before_action :correct_user, only: :show

  def show
    @profile = Profile.find(params[:id])
  end

  def new
    @profile = Profile.new
  end

  def create
    session[:profile_params] = profile_params
    @profile = Profile.new(session[:profile_params])
    if no_user_id_but_valid?(@profile)
      render :preview
      return
    else
      render :new
    end
  end

  def preview
    @profile = Profile.new
  end

  def save
    byebug
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def profile_params
    profile = params.require(:profile).permit(:name, :email, :phone_number, :current_role, :career_goal, :picture)
    profile[:skills_attributes] = skills_array
    profile[:work_experiences_attributes] = work_experience_array
    profile[:education_backgrounds_attributes] = education_background_array
    profile[:project_experiences_attributes] = project_experience_array
    return profile
  end

  def skills_array
    return params.require(:skills).values.map { |x| x.slice(:proficiency, :skills, :description) }
  end

  def work_experience_array
    return params.require(:work_experience).values.map { |x| x.slice(:company, :role, :start_date, :end_date, :city, :description) }
  end

  def education_background_array
    return params.require(:education_background).values.map { |x| x.slice(:graduation_date, :university, :major) }
  end

  def project_experience_array
    return params.require(:project_experience).values.map { |x| x.slice(:name, :link, :description) }
  end

  def no_user_id_but_valid?(profile)
    profile.valid?
    if profile.errors.full_messages.count == 2 &&
        profile.errors.full_messages[0] == 'User must exist' &&
        profile.errors.full_messages[1] == 'User can\'t be blank'
      return true
    else
      return false
    end
  end

  def user_signed_in
    if !user_signed_in?
      flash[:alert] = 'Please sign in first.'
      redirect_to new_user_session_path
      return
    end
  end

  def correct_user
    if current_user.id != params[:id].to_i
      flash[:alert] = 'You don\'t have permission to view this page.'
      redirect_to root_url
      return
    end
  end
end
