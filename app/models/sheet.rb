class Sheet < ActiveRecord::Base
  validates :title, :presence => true
  validates :content, :presence => true
  validates :language, :presence => true

  #class (static) method
  def self.languages search = ''
    search = search.gsub ' ', '%'
    search = '%' if search.blank?

    #TODO FIXME XXX PAY ATTENTION SQLINJECT'd
    records = Sheet.where('language like ?', "%#{search}%").group(:language)

    records.map{|r| r.language}.reject{|e| e.nil? || e.blank?}.sort
  end

end
