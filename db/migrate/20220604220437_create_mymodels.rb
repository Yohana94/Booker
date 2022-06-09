class CreateMymodels < ActiveRecord::Migration[6.1]
  def change
    create_table :mymodels do |t|

      t.timestamps
    end
  end
end
