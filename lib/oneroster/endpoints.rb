module Oneroster
  # https://oneroster.infinitecampus.org/campus/oneroster/entropyMaster/learningdata/v1
  class Administrator < Oneroster::ApiBase
    get :all, "/administrators"
  end
  class Category < Oneroster::ApiBase
    get :all, "/categories"
  end
  class Class < Oneroster::ApiBase
    get :all, "/classes"
  end
  class Course < Oneroster::ApiBase
    get :all, "/courses"
  end
  class District < Oneroster::ApiBase
    get :all, "/districts", ignore_root: 'orgs'
  end
  class Enrollment < Oneroster::ApiBase
    get :all, "/enrollments"
  end
  class GradingPeriod < Oneroster::ApiBase
    get :all, "/gradingPeriods"
  end
  class Guardian < Oneroster::ApiBase
    get :all, "/guardians"
  end
  class Lineitem < Oneroster::ApiBase
    get :all, "/lineitems"
  end
  class Result < Oneroster::ApiBase
    get :all, "/results"
  end
  class School < Oneroster::ApiBase
    get :all, "/schools"
  end
  class Scoregroup < Oneroster::ApiBase
    get :all, "/scoreGroups"
  end
  class Student < Oneroster::ApiBase
    get :all, "/students"
    get :find, "/student/:id"
  end
  class Teacher < Oneroster::ApiBase
    get :all, "/teachers"
    get :find, "/teacher/:id"
  end
  class Term < Oneroster::ApiBase
    get :all, "/terms"
    get :find, "/terms/:id"
  end
  class User < Oneroster::ApiBase
    get :all, "/users"
    get :find, "/user/:id"
  end
end
