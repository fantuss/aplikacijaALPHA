class Product < ActiveRecord::Base
  #dodao
 attr_accessible :title, :category, :image_url, :shape, :code
  
  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |product|
	csv << product.attributes.values_at(*column_names)
      end
    end
  end
  #dodao
  
#radi IMPORT klasican
  def self.to_csv(options ={} )
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |product|
	csv << product.attributes.values_at(*column_names)
      end
    end
  end
  
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
    product = find_by_id(row["id"]) || new
    product.attributes = row.to_hash.slice(*accessible_attributes)
    product.save!
    end
  end
  
  ###############
  #za upload odkomentarisati ovo dole a zakomentarisati ovo
  #iznad
  
#def self.import(file)
#  spreadsheet = open_spreadsheet(file)
#  header = spreadsheet.row(1)
#  (2..spreadsheet.last_row).each do |i|
#    row = Hash[[header, spreadsheet.row(i)].transpose]
#    product = find_by_id(row["id"]) || new
    #product.attributes = row.to_hash.slice(*accessible_attributes) OVO NE
#    product.save!
#  end
#end

#def self.open_spreadsheet(file)
#  case File.extname(file.original_filename)
#  when ".csv" then Roo::Csv.new(file.path, nil, :ignore)
#  when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
#  when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
#  else raise "Unknown file type: #{file.original_filename}"
#  end
#end




  
end
