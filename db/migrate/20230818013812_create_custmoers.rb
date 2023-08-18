class CreateCustmoers < ActiveRecord::Migration[6.1]
  def change
    create_table :custmoers do |t|

      t.timestamps
    end
  end
end
