class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments
  
  accepts_nested_attributes_for :categories
  
  def categories_attributes=(categories_attributes)
     categories_attributes.values.each do |cat|
      if !cat[:name].empty? 
         self.categories << Category.find_or_create_by(name: cat[:name])
      end 
     end 
  end 

end
