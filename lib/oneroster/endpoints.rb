module Oneroster
  # https://oneroster.infinitecampus.org/campus/oneroster/entropyMaster/learningdata/v1
  class Administrator < Oneroster::ApiBase
    get :all, "/administrators", ignore_root: 'users'
  end
  class Category < Oneroster::ApiBase
    get :all, "/categories", ignore_root: 'categories'
  end
  class Class < Oneroster::ApiBase
    get :all, "/classes", ignore_root: 'classes'
    get :teachers, "/classes/:id/teachers", ignore_root: 'users'
    get :students, "/classes/:id/students", ignore_root: 'users'
  end
  class Course < Oneroster::ApiBase
    get :all, "/courses", ignore_root: 'courses'
  end
  class District < Oneroster::ApiBase
    get :all, "/districts", ignore_root: 'orgs'
  end
  class Enrollment < Oneroster::ApiBase
    get :all, "/enrollments", ignore_root: 'enrollments'
  end
  class GradingPeriod < Oneroster::ApiBase
    get :all, "/gradingPeriods", ignore_root: 'academicSession'
  end
  class Guardian < Oneroster::ApiBase
    get :all, "/guardians", ignore_root: 'users'
  end
  class Lineitem < Oneroster::ApiBase
    get :all, "/lineitems", ignore_root: 'lineitems'
  end
  class Result < Oneroster::ApiBase
    get :all, "/results", ignore_root: 'results'
  end
  class School < Oneroster::ApiBase
    get :all, "/schools", ignore_root: 'orgs'
    get :find, "/schools/:id", ignore_root: 'org'
    get :classes, "schools/:id/classes", ignore_root: 'classes'
    get :students, "schools/:id/students", ignore_root: 'users'
    get :teachers, "schools/:id/teachers", ignore_root: 'users'
  end
  class Scoregroup < Oneroster::ApiBase
    get :all, "/scoreGroups", ignore_root: 'scoreGroups'
  end
  class Student < Oneroster::ApiBase
    get :all, "/students", ignore_root: 'users'
    get :find, "/student/:id", ignore_root: 'users'
  end
  class Teacher < Oneroster::ApiBase
    get :all, "/teachers", ignore_root: 'users'
    get :find, "/teacher/:id", ignore_root: 'user'
  end
  class Term < Oneroster::ApiBase
    get :all, "/terms", ignore_root: 'academicSessions'
    get :find, "/terms/:id", ignore_root: 'academicSession'
  end
  class User < Oneroster::ApiBase
    get :all, "/users", ignore_root: 'users'
    get :find, "/user/:id", ignore_root: 'users'
  end
end
