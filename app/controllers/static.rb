get '/' do
  erb :"static/index"
end

get '/home' do
	if logged_in?
		erb :"static/home"
	
	else
		redirect '/?error=1'
	end
end

get '/question/:question_id' do
	@question = Question.find(params[:question_id])
	@answers = @question.answers
	erb :"static/question_page"
	
end

get '/user/:id' do
	@user = User.find(params[:id])
	@answers = @user.answers
	@questions = @user.questions
	erb :"static/user_profile"
end

post '/:user/questions/:question_id/answer' do
	@question = Question.find(params[:question_id])
	@answer = @question.answers.new(params[:answer])
	@answer.user_id = current_user.id 
	if @answer.save
		erb :"static/solution"
	else
		erb :"static/error"
	end
end