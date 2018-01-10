class Landlord < ApplicationRecord
  belongs_to :user
  has_many :properties, dependent: :destroy


  def self.search(query)
    sql_query = " \
        name ILIKE :query OR
        rg ILIKE :query OR
        cpf ILIKE :query OR
        email ILIKE :query
      "
    where(sql_query, query: "%#{query}%")
  end

end
