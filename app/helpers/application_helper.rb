module ApplicationHelper
  def linkify str
    #TODO more edge cases?
    str = str.downcase.gsub(/[^a-zA-Z0-9+-]/, '_').gsub(/_{2,}/,'_')
  end
end
