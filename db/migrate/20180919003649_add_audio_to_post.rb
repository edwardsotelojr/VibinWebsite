class AddAudioToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :audio, :string
  end
end
