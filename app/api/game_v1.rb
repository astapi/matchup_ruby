class ApiV1 < Grape::API
  version 'v1', using: :path
  format :json
  prefix 'api'
  helpers V1Helpers

  desc "get game list"
  get :game_list do
    GameMst.all
  end

  params do
    requires :game_id, type: Integer, desc: 'game_id'
  end
  desc "game character list"
  get :game_character_list do
    CharacterMst.where(:game_mst_id => params[:game_id])
  end
end
