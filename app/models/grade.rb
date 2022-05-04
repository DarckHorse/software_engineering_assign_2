class Grade < ApplicationRecord
    validates_presence_of :student_id
    validates_presence_of :student_name
    validates_presence_of :student_grade
    validate :grade_must_be_greater_than_or_equal_to_zero_and_less_than_one_hundred

    #custom validator
    #makes sure grade is larger than zero and less than 100
    def grade_must_be_greater_than_or_equal_to_zero_and_less_than_one_hundred
        #if it is not null, if it was null then we can't compare it to zero
        if student_grade != nil
            if student_grade < 0
                errors.add(:student_grade, "can't be less than 0")
            elsif student_grade > 100
                errors.add(:student_grade, "can't be greater than 100")
            end
        end
    end

    def student_id
        student_id = [*1..6, *'A'..'F'].sample(6).join
    end
end
