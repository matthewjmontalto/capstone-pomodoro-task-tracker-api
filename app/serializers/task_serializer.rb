class TaskSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :date, :completed, :difficulty, :number_pomodoro_sessions, :user_id
end
