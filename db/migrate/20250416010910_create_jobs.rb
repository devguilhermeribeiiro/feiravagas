class CreateJobs < ActiveRecord::Migration[8.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :description
      t.string :location
      t.string :mode
      t.text :requirements
      t.text :skills
      t.text :benefits
      t.text :salary
      t.references :employer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
