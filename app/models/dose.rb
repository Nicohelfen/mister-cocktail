class Dose < ActiveRecord::Base
  belongs_to :cocktail
  belongs_to :ingredient

  validates_presence_of :cocktail_id, :ingredient_id, :description
  validates  :ingredient, :uniqueness => {:scope => :cocktail}

end
