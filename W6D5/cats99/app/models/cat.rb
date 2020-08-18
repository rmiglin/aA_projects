# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Cat < ApplicationRecord
    COLORS = ['black', 'white', 'brown', 'orange', 'gray']
    validates :birth_date, presence: true
    validates :color, presence: true, inclusion: {in: COLORS}
    validates :name, presence: true
    validates :sex, presence: true, inclusion: {in: ['M', 'F']}

    def age
        time = Time.new
        @age = time.localtime.year - self.birth_date.year
    end
end
