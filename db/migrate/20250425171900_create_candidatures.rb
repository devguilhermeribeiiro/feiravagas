class CreateCandidatures < ActiveRecord::Migration[8.0]
  def change
    create_table :candidatures do |t|
      t.references :job, null: false, foreign_key: true
      t.references :job_seeker, null: false, foreign_key: true
      t.boolean :status

      t.timestamps
    end
  end
end
