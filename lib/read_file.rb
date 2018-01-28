require 'json'

module ReadFile

  def read_file(filename)
     JSON.parse(File.open(filename).read)
  end

end