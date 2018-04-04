class PropertyAddress < ApplicationRecord
  belongs_to :property
  geocoded_by :full_address
  after_validation :geocode, if: ->(obj){ obj.cep.present? and obj.cep_changed? }

  def full_address
    "#{self.street} #{self.number}, #{self.city}, #{self.state}, #{self.country}"
  end

  def self.states
    @estados ||= ["AC", "AL", "AP", "AM", "BA", "CE", "DF", "ES", "GO", "MA", "MT", "MS", "MG", "PA", "PB", "PR", "PE", "PI", "RJ", "RN", "RS", "RO", "RR", "SC", "SP", "SE", "TO"].freeze
  end
end

