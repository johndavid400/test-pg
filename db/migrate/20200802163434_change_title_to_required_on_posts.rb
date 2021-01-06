class ChangeTitleToRequiredOnPosts < ActiveRecord::Migration[6.0]

  def up
    Post.where(title: nil).update_all(title: "Missing")
    change_column_null :posts, :title, false
  end

  def down
    change_column_null :posts, :title, true
  end

end
