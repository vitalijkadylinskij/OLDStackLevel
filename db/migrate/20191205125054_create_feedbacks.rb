class CreateFeedbacks < ActiveRecord::Migration[5.0]
  def change
    create_table :feedbacks do |t|
      t.string :author_photo
      t.string :author_name
      t.string :feedback_text
      t.string :job_title
      t.string :locale
    end
  end
end
