class CreateFeedbacks < ActiveRecord::Migration[7.1]
  def change
    create_table :feedbacks do |t|
      t.text :message
      t.string :email

      t.timestamps
    end
  end
end
