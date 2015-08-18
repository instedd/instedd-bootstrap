class CreateExternalServices < ActiveRecord::Migration
  def change
    create_table :external_services do |t|
      t.string :url
      t.string :name

      t.timestamps
    end
  end
end
