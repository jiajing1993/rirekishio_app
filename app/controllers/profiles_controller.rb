class ProfilesController < ApplicationController
  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.valid?
      byebug
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def profile_params
    profile = params.require(:profile).permit(:name, :email, :phone_number, :current_role, :career_goal)
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
end
