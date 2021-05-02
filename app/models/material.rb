class Material < ActiveRecord::Base
  
  validates_format_of :store_link, :with => /\A(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w\.-]*)*\/?\Z/i
  validates :quantity, :numericality => { :greater_than_or_equal_to => 1 }
  validates :price, :numericality => { :only_integer => true }

  belongs_to :cosplay


  end
  