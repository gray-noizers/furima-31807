class Log
    include ActiveModel::Model
    attr_accessor :postal_code, :prefecture_id, :municipality ,:banchi, :building, :tel, :city

    with_options presence: true do
        validates :postal_code
        validates :city
        validates :municipality
        validates :banchi
        #validates :building
        validates :tel
    end

    validates :prefecture_id, numericality: { other_than: 0 }

end