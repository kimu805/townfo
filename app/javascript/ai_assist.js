window.addEventListener("DOMContentLoaded", () => {
  const aiAssistBtn = document.getElementById("ai_assist_btn")
  const aiModal = document.getElementById("ai_modal")
  const aiInput = document.getElementById("ai_input")
  const generateBtn = document.getElementById("generate_btn")
  const cancelBtn = document.getElementById("cancel_btn")
  const contentField = document.getElementById("noticeContent_form")

  aiAssistBtn.addEventListener("click", () => {
    aiModal.style.display = "block"
  })

  cancelBtn.addEventListener("click", () => {
    aiModal.style.display = "none"
  })

  generateBtn.addEventListener("click", async () => {
    const userInput = aiInput.value
    console.log(userInput)
  })

})