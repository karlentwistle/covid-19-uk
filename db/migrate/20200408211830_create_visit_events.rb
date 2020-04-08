class CreateVisitEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :visit_events do |t|
      t.string :controller_name
      t.string :action_name

      t.timestamps
    end
  end
end
