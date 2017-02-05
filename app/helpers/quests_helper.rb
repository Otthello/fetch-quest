module QuestsHelper
  def get_rand_quest
    Quest.order("RANDOM()").first
  end
end
