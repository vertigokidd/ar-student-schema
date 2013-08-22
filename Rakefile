require 'rake'
require 'rspec/core/rake_task'
require 'faker'
require_relative 'db/config'
require_relative 'lib/students_importer'


task :console do
  exec "irb -r./db/config.rb"
end


desc "seed the database"
task "db:seed" do
	require_relative 'app/models/student.rb'
  require_relative 'app/models/teacher.rb'

	100.times do
	  Student.create :first_name => Faker::Name.first_name,
	                 :last_name  => Faker::Name.last_name,
                   :gender     => ['m', 'f'].sample,
                   :teacher_id => rand(1..9),
	                 :birthday  => Date.today - rand(15..40)*365,
                   :email      => Faker::Internet.email
	end

  9.times do
    Teacher.create :first_name => Faker::Name.first_name,
                   :last_name => Faker::Name.last_name,
                   :email    => Faker::Internet.email
  end

# teacher = Teacher.create(first_name: 'Thelma', last_name: 'Roberts', email: 'troberts@treeteacher.org')
# teacher = Teacher.create(first_name: 'Priscilla', last_name: 'Stanley', email: 'pstanley@treeteacher.org')
# teacher = Teacher.create(first_name: 'Joe', last_name: 'Kennedy', email: 'jkennedy@treeteacher.org')
# teacher = Teacher.create(first_name: 'Pete', last_name: 'Best', email: 'pbest@treeteacher.org')
# teacher = Teacher.create(first_name: 'Gerlado', last_name: 'Jojobe', email: 'gjojobe@treeteacher.org')
# teacher = Teacher.create(first_name: 'Sarah', last_name: 'Jones', email: 'sjones@treeteacher.org')
# teacher = Teacher.create(first_name: 'Allison', last_name: 'Jenkins', email: 'ajenkins@treeteacher.org')
# teacher = Teacher.create(first_name: 'David', last_name: 'Black', email: 'dblack@treeteacher.org')
# teacher = Teacher.create(first_name: 'Soren', last_name: 'Svengaard', email: 'ssvengaard@treeteacher.org')
end




desc "create the database"
task "db:create" do
  touch 'db/ar-students.sqlite3'
end

desc "drop the database"
task "db:drop" do
  rm_f 'db/ar-students.sqlite3'
end

desc "migrate the database (options: VERSION=x, VERBOSE=false, SCOPE=blog)."
task "db:migrate" do
  ActiveRecord::Migrator.migrations_paths << File.dirname(__FILE__) + 'db/migrate'
  ActiveRecord::Migration.verbose = ENV["VERBOSE"] ? ENV["VERBOSE"] == "true" : true
  ActiveRecord::Migrator.migrate(ActiveRecord::Migrator.migrations_paths, ENV["VERSION"] ? ENV["VERSION"].to_i : nil) do |migration|
    ENV["SCOPE"].blank? || (ENV["SCOPE"] == migration.scope)
  end
end

desc "populate the test database with sample data"
task "db:populate" do
  StudentsImporter.import
end

desc 'Retrieves the current schema version number'
task "db:version" do
  puts "Current version: #{ActiveRecord::Migrator.current_version}"
end

desc "Run the specs"
RSpec::Core::RakeTask.new(:specs)

task :default  => :specs
