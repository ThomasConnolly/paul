class Syllabus < ActiveRecord::Base
  validates_presence_of :year
  validates_presence_of :grade
  validates_presence_of :quarter
  validates_presence_of :theme
  validates_presence_of :title9
  enum quarter: %w{ I II III IV }
  default_scope -> { order(:year, :quarter) }

  def self.assign_from_row(row)
    syllabus = Syllabus.where(title: row[:theme]).first_or_initialize
    syllabus.assign_attributes row.to_hash.slice(:year, :grade, :quarter, 
      :theme, :title1, :title2, :title3, :title4, :title5, :title6, :title7, :title8, :title9 )
    syllabus
  end

  def self.to_csv
    #  attributes = #{year grade quarter theme title1 title2 title3 title4 title5 title6 title7 title8 title9}
    
    CSV.generate do |csv|
      csv << column_names

      all.each do |syllabus|
        csv << syllabus.attributes.values_at(*column_names)
      end
    end
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Syllabus.create! row.to_hash
    end
  end
end
