# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  commentable_id   :integer          default(0)
#  commentable_type :string(255)      default("")
#  title            :string(255)      default("")
#  body             :text             default("")
#  subject          :string(255)      default("")
#  user_id          :integer          default(0), not null
#  parent_id        :integer
#  lft              :integer
#  rgt              :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Comment < ActiveRecord::Base

  include ActsAsCommentable::Comment
<<<<<<< HEAD
  attr_accessible :title, :body
=======
  attr_accessible :title, :comment
>>>>>>> dccdb5b12d6be8d4a29f1bf4155b4fc85b94db20
  belongs_to :commentable, :polymorphic => true

  default_scope :order => 'created_at DESC'

  # NOTE: install the acts_as_votable plugin if you
  # want user to vote on the quality of comments.
  #acts_as_voteable

  # NOTE: Comments belong to a user
  belongs_to :course
  belongs_to :user
end
