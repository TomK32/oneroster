require 'openssl'
require 'base64'
require 'json'
require 'httparty'

require_relative 'client'
class Oneroster
  attr_accessor :client
  attr_accessor :metadata

  def initialize(api_credentials)
    self.client = Class.new(Oneroster::Client) do |klass|
      uri = api_credentials['base_uri'] || Oneroster::Client::BASE_URI
      klass.base_uri(uri)
    end.new(api_credentials)
  end

  class << self
    [:get, :post, :put, :delete].each do |command|
      define_method(command.to_s) do |method, path = nil|
        define_method(method) do |options = {}|
          return self.client.class.send(command, prepare_path(path.dup, options), self.client.options.merge(options))
        end
      end
    end
  end

  def prepare_path(path, options)
    options = options.dup
    options.each_pair do |key, value|
      regexp_path_option = /(:#{key}$|:#{key}([:&\/-_]))/
      if path.match(regexp_path_option)
        if value.blank?
          raise "Blank value for parameter '%s' in '%s'" % [key, path]
        end
        path.gsub!(regexp_path_option, "#{value}\\2")
        options.delete(key)
      end
    end
    if parameter = path.match(/:(\w*)/)
      raise "Missing parameter '%s' in '%s'. Parameters: %s" % [parameter[1], path, options]
    end
    path
  end

  # retreive max_page_size from metadata. Defaults to 100
  def get_page_size(resource)
    @metadata ||= self.metadata()
    @metadata['%s_max_page_size' % resource.split('/').last.singularize] rescue 100
  end

  # Process every object for a resource.
  def all(resource, options = {}, &block)
    page_size = (options[:query][:pagesize] rescue nil) || get_page_size(resource)
    _options = options.dup
    _options[:query] ||= {}
    _options[:query][:pagesize] ||= page_size

    page = 1
    results = []
    begin
      _options[:query][:page] = page
      response = self.send(resource, _options)
      results = response.parsed_response || {}
      if !response.parsed_response
        if response.headers['www-authenticate'].match(/Bearer error/)
          raise response.headers['www-authenticate'].to_s
        end
      end

      if results.is_a?(Hash)
        plural = results.keys.first
        results = results[plural][plural.singularize] || []
      end
      if results.is_a?(Hash)
        # a rare(?) case has been observed where (in this case section_enrollment) did return a single
        # data object as a hash rather than as a hash inside an array
        results = [results]
      end
      results.each do |result|
        block.call(result, response)
      end
      page += 1
    end while results.any? && results.size == page_size
  end

  # client is set up per district so it returns only one district
  # for urls with parameters

  # https://oneroster.infinitecampus.org/campus/oneroster/entropyMaster/learningdata/v1
  get :administrators
  get :administrator, 'administrator/:id'
  get :categories
  get :category, 'categories/:id'
  get :classes
  get :class_lineitems, 'classes/:class_id/lineitems'
  get :class_lineitem_results, 'classes/:class_id/lineitems/:lineitem_id/results'
  get :class_results, 'classes/:class_id/results'
  get :class_students, 'classes/:class_id/students'
  get :class_teachers, 'classes/:class_id/teachers'
  get :courses
  get :course_classes, 'courses/:course_id/classes'
  get :districts
  get :enrollments
  get :gradingPeriods
  get :guardians
  get :lineitems
  put :put_lineitem, 'lineitems/:lineitem_id/students/:student_id/results/:result_id'
  get :results
  get :schools
  get :school_classes, 'schools/:school_id/classes'
  get :school_class_enrollment, 'schools/:school_id/classes/:class_id/enrollments'
  get :school_class_students, 'schools/:school_id/classes/:class_id/students'
  get :school_class_teachers, 'schools/:school_id/classes/:class_id/teachers'
  get :school_courses, 'schools/:school_id/course'
  get :school_enrollment, 'schools/:school_id/enrollments'
  get :school_students, 'schools/:school_id/students'
  get :school_teachers, 'schools/:school_id/teachers'
  get :school_terms, 'schools/:school_id/terms'
  get :scoreGroups
  get :students
  get :student, 'students/:student_id'
  get :student_classes, 'students/:student_id/classes'
  get :teacher_enrollments , 'teacherEnrollments'
  get :teachers
  get :teacher, 'teachers/:teacher_id'
  get :teacher_classes, 'teachers/:teacher_id/classes'
  get :terms
  get :term, 'terms/:term_id'
  get :term_classes, 'terms/:term_id/classes'
  get :term_grading_periods, 'terms/:term_id/gradingPeriods'
  get :users
  get :user, 'users/:user_id'
end
