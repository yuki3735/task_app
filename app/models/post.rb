class Post < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :start
    validates :finish
  end
  validate :not_before_today

  def not_before_today
    errors.add(:finish, 'は今日以降の日付で選択してください') if finish.nil? || finish < Date.today
  end



end