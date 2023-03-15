class CreateJobVacancies < ActiveRecord::Migration[7.0]
  def change
    create_table :job_vacancies do |t|
      t.integer :recruiter_id
      t.string :position_name
      t.string :description
      t.string :requirement
      t.date :close_date
      t.timestamps
    end
  end
end
