class CreateFuncionarios < ActiveRecord::Migration
  def change
    create_table :funcionarios do |t|
      t.string :nome
      t.string :tipo

      t.timestamps
    end
  end
end
