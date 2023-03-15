class CreateApplies < ActiveRecord::Migration[7.0]
  def change
    create_table :applies do |t|
      t.integer :applicant_id
      t.integer :job_vacancy_id
      t.integer :status
      t.timestamps
    end
  end
end
