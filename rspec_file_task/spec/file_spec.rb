require_relative 'spec_helper'

file_test = FileClass.new
f_name = file_test.create


RSpec.describe 'File interaction' do

  context 'Work with file' do

    it 'verifies that user can create a file and write some data' do
      file_test.writes(f_name, TEXT)
      expect(Dir.children(PATH).include?(f_name)).to be(true)

    end

    it 'verifies that user can read added data' do
      expect(file_test.reads(f_name) == TEXT).to be(true)
    end

    it 'verifies that user can rewrite a file' do
      file_test.writes(f_name, ANOTHER_TEXT)
      expect(file_test.reads(f_name) == TEXT).to be(false)
    end

    it 'veifies that user can read rewrited data' do
      expect(file_test.reads(f_name) == ANOTHER_TEXT).to be(true)
    end

    it 'verifies that user can add data to the file' do
      file_test.adds(f_name, TEXT)
      expect(file_test.reads(f_name) == ANOTHER_TEXT + TEXT).to be(true)
    end

    it 'verifies that user can delete a file' do
      file_test.deleted(f_name)
      expect(Dir.children(PATH).include?(f_name)).to be(false)
    end

    it 'verifies that user can not read a deleted file' do
      expect(Dir.exist?(f_name)).to be(false)
    end
  end
end
