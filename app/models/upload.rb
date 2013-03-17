class Upload < ActiveRecord::Base

  mount_uploader :file, FileUploader

  validates_presence_of :file

  before_destroy :delete_file

  scope :index, -> { self.order('created_at DESC') }

  def filename
    return File.basename(self.file.path)
  end

  def src
    return self.file.path.gsub(Rails.public_path.to_s, '')
  end

  def is_image?
    %w(.jpg .jpeg .png .gif).include?(File.extname(self.file.path))
  end

private
  def delete_file
    self.remove_file!
  end

end
