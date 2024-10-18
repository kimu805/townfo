function countNotice() {
  const noticeTitleForm = document.getElementById("noticeTitle_form")
  const noticeTitleCount = document.getElementById("noticeTitle_count")

  if (!noticeTitleForm) return null
  console.log("読み込み完了")

  noticeTitleForm.addEventListener("input", () => {
    let titleLength = noticeTitleForm.value.length
    noticeTitleCount.innerHTML = `${titleLength}`
    if (titleLength > 50) {
      noticeTitleCount.setAttribute("style", "color: red;")
    }
  })
}

window.addEventListener("turbo:load", countNotice)
window.addEventListener("turbo:render", countNotice)