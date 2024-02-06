class CardGenerator

  def initialize(files)
    @files = files
  end

  def cards
    File.readlines(@files).map do |line|
      question, answer, category_string = line.chomp.split(',')
      category = category_string.to_sym
      Card.new(question, answer, category)
    end
  end
end