class Sheet < ActiveRecord::Base
  validates :title, :presence => true
  validates :content, :presence => true
  validates :language, :presence => true

  #class (static) method
  def self.languages search = ''
    search = search.gsub ' ', '%'
    search = '%' if search.blank?

    #TODO FIXME XXX PAY ATTENTION SQLINJECT'd
    records = self.find_by_sql(<<-SQL
     SELECT *
     FROM sheets
     where language like '%#{search}%'
     GROUP BY `language`
    SQL
    )

    records.map{|r| r.language}.reject{|e| e.nil? || e.blank?}.sort
  end

end
