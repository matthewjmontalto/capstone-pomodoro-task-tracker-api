class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.date :date, null: false
      t.boolean :completed
      t.integer :difficulty
      t.integer :number_pomodoro_sessions

      t.timestamps
    end
  end
end
