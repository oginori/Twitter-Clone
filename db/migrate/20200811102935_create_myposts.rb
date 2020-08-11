class CreateMyposts < ActiveRecord::Migration[5.2]
  def change
    create_table :myposts do |t|
      t.text :content
      t.timestamps
    end
  end
end
