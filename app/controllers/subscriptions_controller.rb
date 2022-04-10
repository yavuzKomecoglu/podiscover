# frozen_string_literal: true

class SubscriptionsController < ApplicationController
  before_action :authenticate_user!
  def index
    subscriptions = current_user.feed.uniq { |s| s.podcast_id }
    @subscriptions = subscriptions.sort_by{ |s| s.podcast.users.count }.reverse
  end

  def show
    @subscription = current_user.subscriptions.find(params[:id])
  end
end