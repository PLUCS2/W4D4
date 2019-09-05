class Album <ApplicationRecord 

  TYPES = %w(live studio)

  validates :title, presence: true 
  validates :band_id, presence: true 
  validates :recordings, inclusion: { in: TYPES }
  validates :year, presence: true

  belongs_to :band, 
    primary_key: :id, 
    foreign_key: :band_id, 
    class_name: :Band 

end 