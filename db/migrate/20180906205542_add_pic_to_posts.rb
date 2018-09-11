class AddPicToPosts < ActiveRecord::Migration[5.2]

      def self.up
        change_table :posts do |t|
          t.attachment :pic
        end
      end

      def self.down
        drop_attached_file :posts, :pic
      end
end
