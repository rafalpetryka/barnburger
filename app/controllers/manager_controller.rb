class ManagerController < ApplicationController
	layout "news_layout"
	before_action :authenticate_admin!
end
