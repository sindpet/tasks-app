# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Constants
PROJECTS = 10
TASKS = 20
TAGS = 8

# Cleanup previous data
TaskTag.destroy_all
Tag.destroy_all
Task.destroy_all
Project.destroy_all
User.destroy_all

# Create users
user1 = User.create(first_name: "This is a",
                    last_name: "Test",
                    email: "test@gmail.com",
                    password: "taskspass",
                    password_confirmation: "taskspass")
user2 = User.create(first_name: "Another",
                    last_name: "Test",
                    email: "test2@gmail.com",
                    password: "taskspass",
                    password_confirmation: "taskspass")

# Create projects
[user1, user2].each do |user|
  PROJECTS.times do |index|
    Project.create(title: "Project #{index + 1}",
                   position: Faker::Number.between(from: 1, to: TASKS).to_i,
                   user: user)
  end
end

# Create tasks
[user1, user2].each do |user|
  TASKS.times do |index|
    Task.create(title: "Task #{index + 1}",
                description: Faker::Lorem.paragraph,
                is_done: Faker::Boolean.boolean,
                user: user)
  end
end

# Assign some tasks to some projects
[user1, user2].each do |user|
  project_ids = user.projects.pluck(:id)
  3.times do
    random_task = user.tasks[rand(TASKS)]
    random_project_id = project_ids.sample
    random_task.update(project_id: random_project_id)
  end
end

# Create tags
[user1, user2].each do |user|
  TAGS.times do
    Tag.create(title: Faker::Creature::Animal.name, user: user)
  end
end

# Assign some tags to some tasks
[user1, user2].each do |user|
  7.times do
    user.tasks[rand(TASKS)].tags << user.tags[rand(TAGS)]
  end
end
