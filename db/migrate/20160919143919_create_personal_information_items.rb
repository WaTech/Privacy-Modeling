class CreatePersonalInformationItems < ActiveRecord::Migration[5.0]
  def change
    create_table :personal_information_items do |t|
      t.string :name

      t.timestamps
    end
  end
end
