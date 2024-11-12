window.addEventListener("turbo:load", () => {
  const aiAssistBtn = document.getElementById("ai_assist_btn")
  const aiModal = document.getElementById("ai_modal")
  const aiInput = document.getElementById("ai_input")
  const generateBtn = document.getElementById("generate_btn")
  const cancelBtn = document.getElementById("cancel_btn")
  const contentField = document.getElementById("noticeContent_form")

  if (!aiAssistBtn) return null

  aiAssistBtn.addEventListener("click", () => {
    aiModal.style.display = "block"
  })

  cancelBtn.addEventListener("click", () => {
    aiModal.style.display = "none"
  })

  generateBtn.addEventListener("click", async () => {
    const userInput = aiInput.value
    const response = await fetch("/notices/generate_content", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": document.querySelector("[name='csrf-token']").content,
      },
      body: JSON.stringify({ prompt: userInput }),
    })
    const data = await response.json()
    contentField.value = data.generated_text
    aiModal.style.display = "none"
  })


})