require 'spec_helper'

describe Upload do

  let(:upload) do
    upload = Upload.new
    upload.file = File.open("#{Rails.root}/app/assets/images/rails.png")
    upload.save!
    upload
  end

  describe '.create' do
    it 'stores uploaded file' do
      expect(File.exists?(upload.file.path)).to be_true
    end
  end

  describe '#destory' do
    it 'deletes with uploaded file' do
      path = upload.file.path
      upload.destroy!
      expect(File.exists?(path)).to_not be_true
    end
  end
end
