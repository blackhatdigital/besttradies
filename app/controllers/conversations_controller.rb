class ConversationsController < ApplicationController
	before_action :authenticate_user!
	
	def index
		@conversations = current_user.mailbox.conversations.page(params[:page]).per(20)
	end

	def inbox
		@conversations = current_user.mailbox.inbox.page(params[:page]).per(20)
		render action: :index

	end

	def sent
		@conversations = current_user.mailbox.sentbox.page(params[:page]).per(20)
		render action: :index
	end

	def trash
		@conversations = current_user.mailbox.trash.page(params[:page]).per(20)
		render action: :index
	end




	def show
		@conversation = current_user.mailbox.conversations.find(params[:id])
		@conversation.mark_as_read(current_user)
	end

	def new
		@recipients = User.all - [current_user]
	end

	def create
		recipient = User.find(params[:user_id])
		receipt = current_user.send_message(recipient, params[:body], params[:subject])
		redirect_to conversation_path(receipt.conversation)
	end
end