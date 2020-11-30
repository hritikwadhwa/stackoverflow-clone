module ApplicationHelper
  def posted_at(timestamp)
    difference = (Time.now - timestamp).round(0)
    if difference < 48.hours
      "Posted " + distance_of_time_in_words(difference) + " ago"

    else
      "Posted at " + timestamp.strftime("%Y-%m-%d %H:%M:%S")
    end
  end

  def find_email_by_user_id(user_id)
    user = User.find(user_id)
    user.email.downcase
  end

  def find_name_by_user_id(user_id)
    user = User.find(user_id)
    user.name
  end
end
