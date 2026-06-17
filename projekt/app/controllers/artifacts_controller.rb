require "fileutils"
class ArtifactsController < ApplicationController

  def index
  end

  def show
  end

  def create
    uuid = SecureRandom.uuid
    uploaded_file = params[:artifact][:file]
    local_file_path = "/var/lib/lightarti/storage/#{uuid}#{uploaded_file.original_filename}"
    puts params[:artifact][:folder_id]
    artifact = Artifact.new(
      name: params[:artifact][:name],
      content_type: uploaded_file.content_type,
      storage_key: local_file_path,
      user_id: current_user.id,
      folder_id: params[:artifact][:folder_id],
      size: uploaded_file.size,
      original_filename: uploaded_file.original_filename

      )
      puts artifact.inspect
    if artifact.save
      FileUtils.cp(uploaded_file.tempfile, local_file_path)
    else
      @artifact = Artifact.new(folder_id: params[:folder_id])
      flash.now[:alert] = "Somthing went worng when uploading"
      render :new
    end
  end

  def new
    @artifact = Artifact.new(folder_id: params[:folder_id])
  end

  def update
  end

  def edit
  end

  def delete
  end

  def destroy
  end
end
