class User
  attr_accessor :name, :address, :department

  def User.roles # we could also use 'self.roles" here or "class << roles" then just "def roles" below it
    ["employee", "manager", "director", "exec"]
  end

  def initialize(name, address, department)
    @name = name
    @address = address
    @department = department
    @department.users << self
  end

  # new method to keep what department u r in up 2 date
  def department=(new_department)
    @department.users.delete(self)
    @department = new_department
    @department.users << self
  end
end

class Company
  attr_accessor :name, :url, :departments

  def initialize(name, url)
    @name = name
    @url = url
  end

  def users
    departments.map(&:users).flatten
  end
end

class Department
  attr_accessor :name, :users

  def initialize(name)
    @name = name
  end

  def users
    # ovveride the accessor to make sure we allways have an array to work with to avoid null conditions
    @users ||= [] # will make an empty array unless other data is provided by accessor
  end
end

# setup data
comp = Company.new("inc inc", "https://link.url")
sales_dep = Department.new("sales")
engineering_dep = Department.new("engineering")
bob = User.new("Bobby smith", "house", sales_dep)
sally = User.new("sally R", "condo", engineering_dep)

# usage of our cast
comp.departments = [sales_dep, engineering_dep]
comp.users
sales_dep.users
engineering_dep.users
engineering_dep.users.map(&:name)

# chaning bobs dept
bob.department = engineering_dep
