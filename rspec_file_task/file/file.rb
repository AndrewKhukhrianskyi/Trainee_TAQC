class FileClass
  def create
    filename = rand(100).to_s + '.txt'
  end

  def writes(filename, text)
    file = File.open(filename, 'w')
    file.write(text)
    file.close()
  end

  def adds(filename, text)
    file = File.open(filename, 'a')
    file.write(text)
    file.close()
  end

  def reads(filename)
    file_r = File.open(filename, 'r')
    file_r.read()
  end


  def deleted(filename)
    File.delete(filename)
  end
end
