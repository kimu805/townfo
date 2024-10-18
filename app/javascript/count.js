// お知らせ入力フォームの文字数カウンター
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

// 回覧板入力フォームの文字数カウンター
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

// グループ入力フォームの文字数カウンター
function countGroup() {
  // name
  const groupNameForm = document.getElementById("groupName_form")
  const groupNameCount = document.getElementById("groupName_count")

  if (!groupNameForm) return null

  groupNameForm.addEventListener("input", () => {
    let nameLength = groupNameForm.value.length
    groupNameCount.innerHTML = `${nameLength}`
    if (nameLength > 50) {
      groupNameCount.setAttribute("style", "color: red;")
    }
    if (nameLength <= 50) {
      groupNameCount.setAttribute("style", "color: black;")
    }
  })

  // description
  const groupDescriptionForm = document.getElementById("groupDescription_form")
  const groupDescriptionCount = document.getElementById("groupDescription_count")

  groupDescriptionForm.addEventListener("input", () => {
    let descriptionLength = groupDescriptionForm.value.length
    groupDescriptionCount.innerHTML = `${descriptionLength}`
    if (descriptionLength > 2000) {
      groupDescriptionCount.setAttribute("style", "color: red;")
    }
    if (descriptionLength <= 2000) {
      groupDescriptionCount.setAttribute("style", "color: black;")
    }
  })
}

window.addEventListener("turbo:load", countGroup)
window.addEventListener("turbo:render", countGroup)

// ユーザー新規登録の文字数カウンター
function countNewUser() {
  // nickname
  const userNicknameForm = document.getElementById("userNickname_form")
  const userNicknameCount = document.getElementById("userNickname_count")

  if (!userNicknameForm) return null

  userNicknameForm.addEventListener("input", () => {
    let nicknameLength = userNicknameForm.value.length
    userNicknameCount.innerHTML = `${nicknameLength}`
    if (nicknameLength > 30) {
      userNicknameCount.setAttribute("style", "color: red;")
    }
    if (nicknameLength <= 30) {
      userNicknameCount.setAttribute("style", "color: black;")
    }
  })

    // profile
    const userProfileForm = document.getElementById("userProfile_form")
    const userProfileCount = document.getElementById("userProfile_count")
  
    if (!userProfileForm) return null
  
    userProfileForm.addEventListener("input", () => {
      let profileLength = userProfileForm.value.length
      userProfileCount.innerHTML = `${profileLength}`
      if (profileLength > 1000) {
        userProfileCount.setAttribute("style", "color: red;")
      }
      if (profileLength <= 1000) {
        userProfileCount.setAttribute("style", "color: black;")
      }
    })
}

window.addEventListener("turbo:load", countNewUser)
window.addEventListener("turbo:render", countNewUser)