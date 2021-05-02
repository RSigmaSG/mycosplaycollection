class Cosplay < ActiveRecord::Base
  belongs_to :user
  has_many :materials

  def cost
    self.materials.map { |material| material.price * material.quantity }.reduce(:+)
  end

end
