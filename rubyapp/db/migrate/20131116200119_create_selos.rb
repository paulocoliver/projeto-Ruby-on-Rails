class CreateSelos < ActiveRecord::Migration
  def change
    create_table :selos do |t|
      t.string :tipo
      t.string :numero

      t.timestamps
    end
  end
end
