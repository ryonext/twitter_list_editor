class MembersController < ApplicationController
  def index
    member_id_lists = twitter.list_members(list_id: params[:list_id], owner_id: params[:owner_id], count: 200).map {|m| m.to_h[:id_str] }
    render json: member_id_lists
  end

  def create
    twitter.add_list_member(member_params[:list].to_i, member_params[:user].to_i)
    render nothing: true
  end

  def destroy
    twitter.remove_list_member(member_params[:list].to_i, member_params[:user].to_i)
    render nothing: true
  end

  private

    def member_params
      params.require(:member).permit(:list, :user)
    end
end
