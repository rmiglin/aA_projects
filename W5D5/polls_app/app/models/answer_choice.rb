# == Schema Information
#
# Table name: answer_choices
#
#  id          :bigint           not null, primary key
#  answer      :string           not null
#  question_id :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class AnswerChoice < ApplicationRecord
end
