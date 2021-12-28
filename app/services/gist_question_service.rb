class GistQuestionService

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new(:access_token => ENV['GIT_TOKEN'])
  end

  def call
    @client.create_gist(gist_params)
  end

  def success?
    @client.last_response.status <= 209 && @client.last_response.status >= 200
  end

  private

  def gist_params
    {
      description: "The question about #{@test.title} from TestGuru",
      public: true,
      files: {
        'test_guru_question.txt' => {
          content: gist_content
        }
      }
    }
  end


  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end
end