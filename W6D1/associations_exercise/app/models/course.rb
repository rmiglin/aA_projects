# == Schema Information
#
# Table name: courses
#
#  id            :bigint           not null, primary key
#  name          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  instructor_id :integer
#  prereq_id     :integer
#
class Course < ApplicationRecord
    belongs_to :enrollments,
        primary_key: :id,
        foreign_key: :course_id,
        class_name: :Enrollment
    
    belongs_to :enrolled_students,
        primary_key: :id,
        foreign_key: :student_id,
        class_name: :User
end
