function countNotice() {
  // title
  const noticeTitleForm = document.getElementById("noticeTitle_form")
  const noticeTitleCount = document.getElementById("noticeTitle_count")

  if (!noticeTitleForm) return null

  noticeTitleForm.addEventListener("input", () => {
    let titleLength = noticeTitleForm.value.length
    noticeTitleCount.innerHTML = `${titleLength}`
    if (titleLength > 50) {
      noticeTitleCount.setAttribute("style", "color: red;")
    }
    if (titleLength <= 50) {
      noticeTitleCount.setAttribute("style", "color: black;")
    }
  })

  // content
  const noticeContentForm = document.getElementById("noticeContent_form")
  const noticeContentCount = document.getElementById("noticeContent_count")

  noticeContentForm.addEventListener("input", () => {
    let contentLength = noticeContentForm.value.length
    noticeContentCount.innerHTML = `${contentLength}`
    if (contentLength > 1000) {
      noticeContentCount.setAttribute("style", "color: red;")
    }
    if (contentLength <= 1000) {
      noticeContentCount.setAttribute("style", "color: black;")
    }
  })
}

window.addEventListener("turbo:load", countNotice)
window.addEventListener("turbo:render", countNotice)

function countCircular() {
  // title
  const circularTitleForm = document.getElementById("circularTitle_form")
  const circularTitleCount = document.getElementById("circularTitle_count")

  if (!circularTitleForm) return null

  circularTitleForm.addEventListener("input", () => {
    let titleLength = circularTitleForm.value.length
    circularTitleCount.innerHTML = `${titleLength}`
    if (titleLength > 50) {
      circularTitleCount.setAttribute("style", "color: red;")
    }
    if (titleLength <= 50) {
      circularTitleCount.setAttribute("style", "color: black;")
    }
  })
}

window.addEventListener("turbo:load", countCircular)
window.addEventListener("turbo:render", countCircular)