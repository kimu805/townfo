class ChatGptService
  require "openai"

  def initialize
    @openai = OpenAI::Client.new(access_token: ENV.fetch("OPENAI_API_KEY"))
  end

  def chat(prompt)
    response = @openai.chat(
      parameters: {
        model: "gpt-3.5-turbo",
        messages: [
          { role: "system", content: "以下の条件で文章を作成してください"},
          { role: "user", content: prompt }
        ],
        temperature: 0.7,
        max_tokens: 500,
      },
    )
    response["choices"].first["message"]["content"]
  end
end