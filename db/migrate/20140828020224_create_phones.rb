class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.string :number
      t.belongs_to :contact, index: true

      t.timestamps
    end
  end
end
