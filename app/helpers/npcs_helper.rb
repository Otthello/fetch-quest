module NpcsHelper
  def get_rand_npc
    Npc.order("RANDOM()").first
  end
end
