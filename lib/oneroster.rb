require_relative 'oneroster/apibase'
require_relative 'oneroster/endpoints'
# 
# Oneroster::Api.api_auth_credentials('consumer_key','consumer_secret')
module Oneroster

=begin
  get :class_lineitems, 'classes/:class_id/lineitems'
  get :class_lineitem_results, 'classes/:class_id/lineitems/:lineitem_id/results'
  get :class_results, 'classes/:class_id/results'
  get :class_students, 'classes/:class_id/students'
  get :class_teachers, 'classes/:class_id/teachers'
  get :course_classes, 'courses/:course_id/classes'
  get :school_classes, 'schools/:school_id/classes'
  get :school_class_enrollment, 'schools/:school_id/classes/:class_id/enrollments'
  get :school_class_students, 'schools/:school_id/classes/:class_id/students'
  get :school_class_teachers, 'schools/:school_id/classes/:class_id/teachers'
  get :school_courses, 'schools/:school_id/course'
  get :school_enrollment, 'schools/:school_id/enrollments'
  get :school_students, 'schools/:school_id/students'
  get :school_teachers, 'schools/:school_id/teachers'
  get :school_terms, 'schools/:school_id/terms'
  get :student, 'students/:student_id'
  get :student_classes, 'students/:student_id/classes'
  get :teacher_enrollments , 'teacherEnrollments'
  get :teacher, 'teachers/:teacher_id'
  get :teacher_classes, 'teachers/:teacher_id/classes'
  get :term, 'terms/:term_id'
  get :term_classes, 'terms/:term_id/classes'
  get :term_grading_periods, 'terms/:term_id/gradingPeriods'
  get :user, 'users/:user_id'
=end
end
