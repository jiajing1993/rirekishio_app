class ProfilesController < ApplicationController
  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    if !@profile.save
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
    profile = params.require(:profile).permit!.to_h
    profile[:skills_attributes] = skills_array
    profile[:work_experiences_attributes] = work_experience_array
    profile[:education_backgrounds_attributes] = education_background_array
    profile[:project_experiences_attributes] = project_experience_array
    return profile
  end

  def skills_array
    return params.require(:skills).permit!.to_h.values
  end

  def work_experience_array
    return params.require(:work_experience).permit!.to_h.values
  end

  def education_background_array
    return params.require(:education_background).permit!.to_h.values
  end

  def project_experience_array
    return params.require(:project_experience).permit!.to_h.values
  end
end
