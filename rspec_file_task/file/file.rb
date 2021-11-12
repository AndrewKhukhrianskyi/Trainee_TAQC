class FileClass
  def create_filename
    filename = rand(100).to_s + '.txt'
  end

  def write_file(filename, text)
    file = File.open(filename, 'w')
    file.write(text)
    file.close()
  end

  def add_data(filename, text)
    file = File.open(filename, 'a')
    file.write(text)
    file.close()
  end

  def read_file(filename)
    file_r = File.open(filename, 'r')
    file_r.read()
  end


  def delete_file(filename)
    File.delete(filename)
  end
end
