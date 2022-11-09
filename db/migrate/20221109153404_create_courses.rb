class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :course_no
      t.string :uni
      t.string :section_no
      t.string :int

      t.timestamps null: false
    end
    add_index :courses, :course_no
  end
end
