class AddPaperclipToImages < ActiveRecord::Migration[5.0]
  def change
    change_table :images do |t|
      t.attachment :paperclip
    end
  end
end
